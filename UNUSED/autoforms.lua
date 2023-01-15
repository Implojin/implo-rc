
local DEBUG_YOU_STATUS = false

local recastable_spells = { {name = "Storm Form", transform = "storm", status = "storm-form",},
                            {name = "Necromutation", transform = "lich", status = "lich-form",},
                            {name = "Statue Form", transform = "statue", status = "statue-form",},
                            {name = "Beastly Appendage", transform = "appendages", status = "appendages",}, }
local max_recast_failrate = 5

function you_forms_need_recasting()
    for _,spell in ipairs(recastable_spells) do
        if you.status(spell.status .. " (expiring)") == true
           and spells.memorised(spell.name)
           and spells.fail(spell.name) < max_recast_failrate then
            return true
        end
    end
    return false
end

chk_interrupt_activity.run = function (iname, cause, extra)
    if you_forms_need_recasting() then return true end

    if iname == 'message' then
        return rr_handle_message(cause, extra)
    end

    return false
end
chk_interrupt_activity.rest = chk_interrupt_activity.run
chk_interrupt_activity.travel = chk_interrupt_activity.run

chk_interrupt_activity.descending_stairs = function (iname, cause, extra)
    if you_forms_need_recasting() then return true end
end
-- By default we don't auto-recast on stair ascension, but you can enable this by uncommenting below.
-- This is dangerous: It will interrupt attempts to use upstairs, if you're trying to escape with < while your form is expiring.
--chk_interrupt_activity.ascending_stairs = chk_interrupt_activity.descending_stairs

function get_spell_name(form)
    for _,spell in ipairs(recastable_spells) do
        if form == spell.transform then
            return spell.name
        end
    end
    return nil
end

-- Note: This script has awful UX wrt delay interrupts:
-- It *constantly* breaks resting and autoexplore, requiring the player to press 'o' or '5' again each time it does so.
-- Note: This script is dangerous as-written:
-- It will recast indiscriminately during combat, wasting turns at times that can be unexpected to the player.
-- For this to really become usable it needs to be wrapped into the is_threatening() monster LOS check,
-- and it also needs some code to auto-resume the previously taken delayed action, when it breaks delays using interrupts.
function _maybe_recast_forms()
    if you_forms_need_recasting() then
        local transform = you.transform()
        local name = get_spell_name(transform)
        local mp,mmp = you.mp()

        if you.contaminated() > 0 then
            crawl.mpr("<lightred>Warning: You're contaminated, the script is not recasting " .. name .. "!<lightred>")
            return false
        end

        if mp < spells.mana_cost(name) then
            crawl.mpr("<lightred>Warning: You don't have enough MP, the script is not recasting " .. name .. "!<lightred>")
            return false
        end

        spells.cast(name,0,0,true)
        return true
    end
    return false
end

function ready()
    if you.turns() == 0 then init_player_tile() end
    if DEBUG_YOU_STATUS == true then crawl.mpr(you.status() .. " || " .. you.transform()) end
    status:update()
    _maybe_recast_forms()
end
