{
function check(mons, ability_string)
    local books = nil
    books = mons:spells()

    if books ~= nil then
        for _,book in ipairs(books) do
            for _,spell in ipairs(book) do
                if spell == ability_string then return true end
            end
        end
    end

    return false
end

local ATT_NEUTRAL = 1
local mons_table = {}
local threat_table = {}

local status = {
    _update_mons = function()
        local LOS = you.los()
        local m = nil
        mons_table = {}

        for i = -LOS,LOS do
            for j = -LOS,LOS do
                m = monster.get_monster_at(i,j)
                if m and you.see_cell_no_trans(i,j) and m:attitude() < ATT_NEUTRAL then
                    table.insert(mons_table, m)
                end
            end
        end
    end,
    -- TODO: generic string.find(m:desc()) matching catch-alls, 
    -- for dangerous abils / new mons that I haven't specifically added checks for
    -- e.g. string.find(string.lower(m:desc(), "paralys"))
    -- or string.find(m:desc(), "[pP]aralys")   ??
    _check_threat = function(self,mons)
        local dangerous_abils_table = {
        {"Paralyse", you.willpower() < 3, "low Will"} ,
        {"Petrify", you.willpower() < 3, "low Will"} ,
        {"Banishment", you.willpower() < 3, "low Will"} ,
        {"Stunning Burst", you.res_shock() < 1, "no rElec"} , }

        -- TODO: multiple conditionals for some warnings? maybe?
        -- Are any multi-conditional warnings needed anywhere?
        for _,threat in ipairs(dangerous_abils_table) do
            if check(mons, threat[1]) == true and threat[2] == true then
                -- mons, "reason"
                table.insert(threat_table, {mons, threat[1] .. " and " .. threat[3]})
            end
        end
    end,
    _update_threats = function(self)
        threat_table = {}
        -- TODO: compare mons spellpower / success rate (whichever of these is exposed?)
        -- against player Will for Paralyse/Banish/Petrify,
        -- do the same for player rPois vs. AF_POISON_PARALYSIS,
        -- player rElec vs. Stunning Burst, etc.
        for _,mons in ipairs(mons_table) do
            self:_check_threat(mons)
        end
    end,
    -- TODO: hysteresis on the warnings, so they don't pop every turn
    -- (maybe allow some extreme threats to pop every turn? e.g. paralyse with low Will)
    _warn = function ()
        for _,threat in ipairs(threat_table) do
            crawl.formatted_mpr("<lightred>Danger: " .. threat[1]:name() .. "</lightred>")
            crawl.formatted_mpr("<lightblue>Reason: " .. tostring(threat[2]) .. "</lightblue>")
            crawl.more()
        end
    end,
    update = function(self)
        self:_update_mons()
        self:_update_threats()
        self:_warn()
    end, }

function ready()
    status:update()
end
}
