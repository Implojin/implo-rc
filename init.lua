# TEAMCAPTAIN 

travel_delay = -1
explore_delay = -1
rest_delay = -1
view_delay = 0
show_travel_trail = true
use_animations = 

prompt_menu = false
more_gem_info = true
always_show_gems = true

# megazigging
show_more = false

# try to prevent autopick from being interrupted during zig cleanup?
travel_key_stop = false

# we dynamically re-set travel_open_doors in multiple places below
travel_open_doors = avoid

tile_key_repeat_delay = 150

# try to force the game to redraw at minimum ~20fps, to help the player contextualize auto-handler actions
# redrawing faster than this is probably excessive for online play, even though automated actions can and will occur much faster
# TODO: Force a redraw and a small delay with every auto-handler action, so the player can see them?
tile_update_rate = 50
tile_runrest_rate = 50

# prevent autofight from changing behavior at arbitrary HP threshold
autofight_stop = 0

# We manually issue HP warnings below, and do not use the game's LOW HITPOINT WARNING
hp_warning = 0

# flash screen for our scripted danger tier warnings above tier 2
flash_screen_message += T2
flash_screen_message += T3

# tiles-specific options
tile_show_threat_levels = tough, nasty, unusual

cloud_status = true

macros += M 'o' ===do_autoexplore
macros += M \{-266} ===init_player_tile

# player tile things
tile_weapon_offsets = 0,0
tile_shield_offsets = 0,0

: if c_persist.PLAYER_TILE ~= nil then
:    crawl.setopt("tile_player_tile = " .. c_persist.PLAYER_TILE)
: end

# Below we setup some custom player tile Lua, based on species
#
: barachian_tiles = {
: "tile:mons_prince_ribbit", }

: deep_dwarf_tiles = {
: "tile:mons_wiglaf",
: "tile:mons_jorgrun", }

: deep_elf_tiles = {
: "tile:mons_deep_elf_high_priest",
: "tile:mons_deep_elf_demonologist",
: "tile:mons_deep_elf_annihilator", }

: demigod_tiles = {
: "tile:mons_orb_of_electricity",
: "tile:mons_mlioglotl", }

: demonspawn_tiles = {
: "tile:mons_polymoth",
: "tile:mons_killer_klown_3",
: "tile:mons_executioner", }

: djinni_tiles = {
: "tile:mons_azrael", }

: draconian_tiles = {
: "tile:mons_lernaean_hydra01",
: "tile:TRAN_DRAGON_WHITE",
: "tile:mons_xtahua",
: "tile:mons_serpent_of_hell_gehenna",
: "tile:mons_serpent_of_hell_tartarus", }

: felid_tiles = {
: "tile:mons_natasha", }

: formicid_tiles = {
: "tile:mons_pharaoh_ant", }

: gargoyle_tiles = {
: "tile:mons_training_dummy",
: "tile:mons_war_gargoyle", }

: ghoul_tiles = {
: "tile:mons_zombie_lernaean_hydra01",
: "tile:mons_ghoul", }

: gnoll_tiles = {
: "tile:mons_gnoll",
: "tile:mons_gnoll_sergeant",
: "tile:mons_crazy_yiuf",
: "tile:mons_grum",
: "tile:mons_grunn",
: "tile:mons_gnoll_bouda", }

: hill_orc_tiles = {
: "tile:mons_orc_warlord", }

: human_tiles = {
: "tile:mons_dimme",
: "tile:mons_eleionoma",
: "tile:mons_hell_wizard_50",
: "tile:mons_hellbinder",
: "tile:mons_master_elementalist",
: "tile:mons_ancestor_hexer",
: "tile:mons_drowned_soul",
: "tile:mons_erica_swordless",
: "tile:mons_louise",
: "tile:mons_maggie",
: "tile:mons_margery",
: "tile:mons_holy_swine", }

: kobold_tiles = {
: "tile:tran_shadow",
: "tile:mons_sonja", }

: merfolk_tiles = {
: "tile:mons_water_nymph",
: "tile:mons_merfolk_aquamancer",
: "tile:mons_ilsuiw_water", }

: minotaur_tiles = {
: "tile:mons_minotaur",
: "tile:mons_chuck", }

: mummy_tiles = {
: "tile:mons_anubis_guard",
: "tile:mons_khufu",
: "tile:mons_menkaure",
: "tile:mons_royal_mummy", }

: naga_tiles = {
: "tile:mons_vashnia", }

: octopode_tiles = {
: "normal", }

: ogre_tiles = {
: "tile:mons_ogre_mage",
: "tile:mons_erolcha",
: "tile:mons_ironbound_thunderhulk", }

: palentonga_tiles = {
: "tile:TRAN_STATUE_PALENTONGA", }

: spriggan_tiles = {
: "tile:mons_spriggan_air_mage",
: "tile:mons_the_enchantress",
: "tile:mons_agnes_staveless", }

: tengu_tiles = {
: "tile:mons_phase_bat",
: "tile:mons_bennu",
: "tile:mons_caustic_shrike",
: "tile:mons_tengu_conjurer",
: "tile:mons_tengu_reaver", }

: troll_tiles = {
: "tile:mons_deep_troll_shaman",
: "tile:mons_parghit",
: "tile:mons_moon_troll", }

: vampire_tiles = {
: "tile:mons_zonguldrok_lich",
: "tile:mons_murray",
: "tile:mons_jory",
: "tile:mons_jiangshi", }

: vine_stalker_tiles = {
: "tile:mons_dryad",
: "tile:mons_vine_stalker",
: "tile:mons_briar_patch",
: "tile:mons_thorn_hunter", }

: species_name_map = {
: {"Barachi", barachian_tiles},
: {"Deep Dwarf", deep_dwarf_tiles},
: {"Deep Elf", deep_elf_tiles},
: {"Demigod", demigod_tiles},
: {"Demonspawn", demonspawn_tiles},
: {"Djinni", djinni_tiles},
: {"Draconian", draconian_tiles},
: {"Felid", felid_tiles},
: {"Formicid", formicid_tiles},
: {"Gargoyle", gargoyle_tiles},
: {"Ghoul", ghoul_tiles},
: {"Gnoll", gnoll_tiles},
: {"Hill Orc", hill_orc_tiles},
: {"Human", human_tiles},
: {"Kobold", kobold_tiles},
: {"Merfolk", merfolk_tiles},
: {"Minotaur", minotaur_tiles},
: {"Mummy", mummy_tiles},
: {"Naga", naga_tiles},
: {"Octopode", octopode_tiles},
: {"Ogre", ogre_tiles},
: {"Palentonga", palentonga_tiles},
: {"Spriggan", spriggan_tiles},
: {"Tengu", tengu_tiles},
: {"Troll", troll_tiles},
: {"Vampire", vampire_tiles},
: {"Vine Stalker", vine_stalker_tiles}, }

# crawlrc Lua declared in brackets is processed after the game is initialized
{
-- here we randomize the player's tile per-species, using you.race()
-- you.race() returns the capitalized name string from the species yaml
function get_species_tile()
    local species = you.race()
    local tile = "normal"

    for _,map in ipairs(species_name_map) do
        if species == map[1] then
            tile = map[2][crawl.random2(#map[2]) + 1]
        end
    end
    return tile
end

function init_player_tile()
    c_persist.PLAYER_TILE = get_species_tile()
    crawl.setopt("tile_player_tile = " .. c_persist.PLAYER_TILE)
end

-- begin threat warning lua
local DEBUG_MONS_STATUS = false
local DEBUG_MONS_FLAGS = false
local DEBUG_MONS_DESC = false
local DEBUG_MONS_TARGET_DESC = false
local DEBUG_LOF_PATH = false
local DEBUG_THREATS = false
local DEBUG_ABIL_XDY = false
local DEBUG_ABIL_DAM = false
local DEBUG_ABIL_PCT = false
local DEBUG_YOU_STATUS = false

local ATT_NEUTRAL = 1
local mons_table = {}
local current_threats = {}
local known_threats = {}

-- Check if an ability exists within the monster's spellbook.
-- This checks innate/demonic abilities and spells, but cannot check draconian breath abilities.
-- The third parameter is optional, and tests if the ability deals more than the given damage.
-- @param mons mons
-- @param string ability name
-- @param number[opt="nil"] damage optional
-- @return bool
function check(mons, ability_string, damage)
    damage = damage or nil
    local books = nil
    books = mons:spells()
    if books ~= nil then
        for _,book in ipairs(books) do
            for _,spell in ipairs(book) do
                if spell == ability_string then
                    if damage ~= nil then
                        return check_abil_dam(mons, ability_string) > damage
                    else
                        return true
                    end
                end
            end
        end
    end
    return false
end

-- lua string.find() returns an index, not a bool, if a pattern match is found,
-- therefore string.find() comparisons need to include ~= nil
-- this function is syntactic sugar to help the danger table inlines read a little better
function check_desc(mons, string)
    local desc = mons:desc(true)
    if string.find(desc, string) ~= nil then return true end
    return false
end

function check_tdesc(mons, string)
    local desc = mons:target_desc()
    if string.find(desc, string) ~= nil then return true end
    return false
end

-- Check if a monster description contains a damage string for a given ability.
-- Returns the damage string if it exists, otherwise nil.
-- The damage string is typically formatted as "#d#" (ex: 3d23), but is sometimes formatted as "#-#" (Smiting: 7-17),
-- prefixed with "#x" (CBL: 3x3d25), or postfixed with "*" (LRD: 3d23*).
-- @param mons mons
-- @param string ability name
-- @return string|nil xdy
function check_abil_xdy(mons, ability)
    local xdy = nil
    local desc = mons:desc(true)
    -- manually fixup ability names that get mangled/chopped by crawl in the mons:desc window
    if ability == "Lehudib's Crystal Spear" then ability = "Crystal Spear" end
    if ability == "Lee's Rapid Deconstruction" then ability = "Lee's Rapid Deconst" end

    -- if the ability exists in the full desc,
    if string.find(desc, ability) ~= nil then
        -- try to extract "ability string, (optional) whitespace, (optional) <color>, ([ax]x[d-]y*)" from the full desc
        xdy = string.match(desc, ability .. "%s*" .. "<?%l*>?" .. "%(?%d*x?%d+[d%-]%d+%*?%)?")
        -- if our pattern exists, try to extract "xdy"
        if xdy ~= nil then
            xdy = string.match(xdy, "%d*x?%d+[d%-]%d+")
            assert(xdy ~= nil)
        end
    end
    if DEBUG_ABIL_XDY then
        if xdy ~= nil then
            crawl.mpr(ability .. " xdy: " .. xdy)
        end
    end
    return xdy
end

-- Check how much damage a monster will deal with an ability.
-- Returns the maximum possible damage of the ability if we can calculate it, otherwise nil.
-- @param mons mons
-- @param string ability name
-- @return number|nil damage
function check_abil_dam(mons, ability)
    local xdy = check_abil_xdy(mons, ability)
    if xdy == nil then return nil end
    assert(type(xdy) == "string")

    local damage = nil
    local dice = {}

    for i in string.gmatch(xdy, "%d+") do
        table.insert(dice, tonumber(i))
    end
    assert(next(dice) ~= nil and #dice >= 2)

    -- most damage formats: "3d23", "3x3d25", "3d23*"
    if string.find(xdy, "d") ~= nil then
        local roll = 1
        for _,die in ipairs(dice) do
            roll = roll * die
        end
        damage = roll
    -- smiting damage format: "7-17"
    elseif string.find(xdy, "%-") ~= nil and #dice == 2 then
        damage = dice[#dice]
    end
    -- This assert should trigger for damage formats like "3x7-17", which are unhandled above as they do not currently exist
    assert(damage ~= nil, "ability damage format unrecognized!")
    if DEBUG_ABIL_DAM then crawl.mpr(ability .. " damage: " .. tostring(damage)) end
    return damage
end

-- Check if a given monster ability has a (percentage) value listed in the monster description.
-- Returns "percentage" as a string if it exists, otherwise nil.
-- @param mons mons
-- @param string ability name
-- @return string|nil percentage
function check_abil_pct(mons, ability)
    local pct = nil
    local desc = mons:desc(true)
    -- if the ability exists in the full desc,
    if string.find(desc, ability) ~= nil then
        -- try to extract "ability string, whitespace, optional <color>, (decimal%)" from the full desc
        pct = string.match(desc, ability .. "%s+" .. "<?%l*>?" .. "%(%d+%%%)")
        -- if our pattern exists, try to extract the decimal
        if pct ~= nil then
            pct = tonumber(string.match(pct, "%d+"))
            if DEBUG_ABIL_PCT then crawl.mpr(ability .. "(%): " .. pct) end
        end
    end
    return pct
end

local function all_true(table)
    for _,v in ipairs(table) do
        if v == nil then return false end
        if not (v == true) then return false end
    end
    return true
end

local function same_coords(c1x, c1y, c2x, c2y)
    if c1x == c2x and c1y == c2y then return true end
    return false
end

-- test if we have line of fire to this mons
-- @param mons mons
-- @param[opt="Magic Dart"] string optional, test LOF using this spell name
-- @return bool false if LOF is blocked or the spell path to mons is disjoint,
--              true if spell has clear LOF to mons from the player's position
function check_lof(mons, spell)
    local path = nil
    spell = spell or "Magic Dart"
    path = spells.path(spell, mons:pos())
    if path == nil then return false end

    if DEBUG_LOF_PATH == true then
        crawl.mpr(spell .. " path to " .. mons:name() .. ": ")
        for _,vertex in ipairs(path) do
            crawl.mpr(vertex[1] .. "," .. vertex[2])
        end
    end

    -- TODO: this test is buggy with Hep ancestors, because they can be fired through, FIXME
    if not same_coords(path[#path][1], path[#path][2], mons:pos()) then
        if DEBUG_LOF_PATH == true then crawl.mpr("LOF blocked to " .. mons:name() .. "?") end
        return false
    end
    return true
end

function debug_mpr_current_threats()
    crawl.mpr("current_threats : ")
    for _,entry in ipairs(current_threats) do
        local pos = {}
        pos1,pos2 = entry[1]:pos()
        crawl.mpr("name: " .. entry.name .. " pos(): " .. pos1 .. "," .. pos2)
    end
end

function debug_mpr_mons_flags(mons)
    crawl.mpr(mons:name() .. " flags: ")
    local flags = {}
    flags = mons:flags()
    if next(flags) ~= nil then
        for _,flag in ipairs(flags) do
            crawl.mpr(flag .. " | ")
        end
    end
end

-- copied from ff.rc, which used a clua re-implementation of explorer.rare_ood() from /dat/dlua/explorer.dlua
function check_rare_ood(m)
    local you_depth = you.depth()
    local mdepth = m:avg_local_depth()
    local mprob = m:avg_local_prob()
    local br_depth = you.depth_fraction()
    -- explorer.rare_ood() used ood_threshold = math.max(2, you_depth / 3),
    -- we use a fixed OOD threshold so it doesn't grow later
    local ood_threshold = 3
    return mdepth > you_depth + ood_threshold and mprob < 2
end

-- The conditions here check for torment immunity, not torment resistance.
-- This function is named and patterned after player::res_torment(), such that I could theoretically
-- straight up delete this and replace its check with you.res_torment(), if that's ever added.
function you_res_torment()
    -- (you.get_mutation_level(MUT_TORMENT_RESISTANCE) >= 2)
    if you.get_base_mutation_level("torment resistance") >= 2 then
        return true
    end
    -- get_form()->res_neg() == 3
    -- this appears to be MR_RES_NEG, 3 in form-data.h
    -- notably, this excludes statue form, as that only provides MR_RES_NEG 1
    local transform = you.transform()
    if transform == "death" or transform == "wisp" or transform == "fungus" or transform == "shadow" then
        return true
    end
    -- || you.has_mutation(MUT_VAMPIRISM) && !you.vampire_alive
    if you.get_base_mutation_level("vampiric") > 0 and you.status("bloodless") == true then
        return true
    end
    -- || you.petrified()
    -- player::petrified() returns duration[DUR_PETRIFIED]
    -- this check would appear to be pointless for our purposes, as our script won't be getting turns while petrified,
    -- but we include it here anyway, for completeness
    if you.status("petrified") then
        return true
    end
    -- || you.form == transformation::tree
    if transform == "tree" then
        return true
    end
    -- we do not recreate logic for player_equip_unrand(UNRAND_ETERNAL_TORMENT) here, as it has not generated since 2015

    -- TODO: add partial torment resistance checks, maybe?
    return false
end

-- This function is patterned after player::undead_state(), for purpose of checking Dispel Undead vulnerability.
-- As found in bolt::affect_player_enchantment , all undead states not (you.undead_state() == US_ALIVE) are vulnerable to DU.
-- @param bool exempt_living_vp
-- @return bool
function you_are_undead(exempt_living_vp)
    assert(type(exempt_living_vp) == "boolean")
    -- if (form == transformation::death)
    local transform = you.transform()
    if transform == "death" then return true end
    -- return species::undead_type(species);
    -- it looks like this ultimately returns the undead_type in the species yamls, after a few indirect calls
    -- ghoul and mummy are US_UNDEAD, vampire is US_SEMI_UNDEAD, grep "undead_type" didn't find any others here.
    local species = you.race()
    if species == "Ghoul" or species == "Mummy" then
        return true
    end
    -- If exempt_living_vp is passed as true, we deviate from player::undead_state().
    -- This is relevant for DU Range and Undeadhunter, which check holiness, which exempts Alive Vp.
    -- As far as I can tell, mons have no way of casting DU at Alive Vp, even though they would technically take damage from it.
    if species == "Vampire" then
        if exempt_living_vp == false then
            return true
        elseif exempt_living_vp == true and string.find(you.mutation_overview(), "alive") == nil then
            return true
        end
    end

    return false
end

-- This function exists to check vulnerability to holy wrath weapons.
-- player::res_holy_energy() checks player::undead_or_demonic(), which returns undead_state(temp) || species == SP_DEMONSPAWN
-- Notably, that test does not exempt living vp, so we don't either.
function you_are_unholy()
    local species = you.race()
    if species == "Demonspawn" then return true end
    return you_are_undead(false)
end

-- XXX: The logic that sets state for this below is necessarily ill-defined:
-- Crawl doesn't send any kind of message when it stops autoexplore adjacent to a closed door.
-- As a result, we have to guard against infinite loops here.
local reissue_autoexplore_needed = false
local force_autoexplore_stop = false
local loop_guard = 0
local done_exploring = false
function maybe_reissue_autoexplore()
    assert(loop_guard < 100, "ASSERT: maybe_reissue_autoexplore() infinite loop detected")
    crawl.setopt("travel_open_doors = avoid")

    if next(mons_table) ~= nil then
        reissue_autoexplore_needed = false
    end

    if done_exploring then
        reissue_autoexplore_needed = false
        done_exploring = false
    end

    if reissue_autoexplore_needed == true then
        loop_guard = loop_guard + 1
        crawl.mpr("|| travel_open_doors interrupted explore, reissuing autoexplore.")
        crawl.setopt("travel_open_doors = open")
        crawl.sendkeys('o')
        return true
    end
    loop_guard = 0
    return false
end

function do_autoexplore()
    crawl.setopt("travel_open_doors = avoid")
    force_autoexplore_stop = false
    crawl.sendkeys('o')
end

-- Returns true if this mons should be treated as threatening for autotravel, warning, and combat purposes.
-- This function exists because mons:is_firewood() doesn't cover all such cases.
-- @param mons mons
-- @return bool
function is_threatening(mons)
    if mons:is_firewood() and mons:name() ~= "briar patch" then return false end
    if mons:name() == "butterfly" then return false end
    return mons:attitude() < ATT_NEUTRAL
end

-- Here we reconstruct the Dream Sheep "Dream Dust" success rate, as it's not exposed anywhere in-game.
local DREAM_SHEEP_CAP = 6
local DREAM_SHEEP_MAGIC_NUMBER = 25
function get_dream_dust_success_rate()
    local sheep = 0
    local rate = 0

    for _,mons in ipairs(mons_table) do
        if check(mons, "Dream Dust") then
            sheep = sheep + 1
        end
    end

    if sheep > DREAM_SHEEP_CAP then sheep = DREAM_SHEEP_CAP end
    if sheep > 0 then
        rate = 100 * ((sheep - 1) * DREAM_SHEEP_MAGIC_NUMBER + 1) / (sheep * DREAM_SHEEP_MAGIC_NUMBER)
    end

    return rate
end

local pending_message_warnings = {}
local pending_player_warnings = {}

local HP_WARN_T2_PERCENT = 60
local HP_WARN_T3_PERCENT = 40
local LAST_HP = math.huge

function construct_hp_warning()
    local hp,mhp = you.hp()
    local threat = nil
    local percent = math.floor(100 * hp / mhp)

    if next(mons_table) ~= nil and percent <= HP_WARN_T2_PERCENT and hp < LAST_HP then
        threat = {name = "Low HP Warning", tier = (percent <= HP_WARN_T3_PERCENT and 3 or 2),
                  reason = ("" .. percent .. "% HP (" .. hp .. "/" .. mhp .. ")"), last_warned = nil}
    end

    LAST_HP = hp
    return threat
end

function update_hp_warning()
    local threat = construct_hp_warning()

    if threat ~= nil then
        table.insert(pending_player_warnings, threat)
    end
end

local status = {
    _update_mons = function()
        local LOS = you.los()
        local mons = nil
        mons_table = {}

        for i = -LOS,LOS do
            for j = -LOS,LOS do
                mons = monster.get_monster_at(i,j)
                if mons and you.see_cell_no_trans(i,j) and is_threatening(mons) then
                    table.insert(mons_table, mons)
                end
            end
        end
    end,
    -- returns false if a warning did not occur, true if a warning occurred
    _warn = function(self,threat,force_more)
        if force_more == nil then force_more = true end
        if threat.last_warned ~= nil and threat.last_warned == you.turns() then return false end

        local tier = threat.tier
        local colour = "yellow"
        if tier > 1 then colour = "yellow" end
        if tier > 2 then colour = "lightred" end

        crawl.formatted_mpr("<lightred>Danger: " .. threat.name .. "</lightred> |T" .. tostring(tier) .. "| " ..
                            "<" .. colour .. ">Reason: " .. threat.reason .. "</" .. colour .. ">")
        crawl.flush_prev_message()

        -- Tier 2+, flash screen. There is no clua binding to manually perform a flash screen.
        -- Here, we have to rely on the rcfile flash_screen_message option, pattern matching our (custom) printed tier messages.

        if tier >= 3 and force_more then crawl.more() end

        if tier >=2 then
            crawl.redraw_screen()
            crawl.delay(150)
        end

        threat.last_warned = you.turns()
        return true
    end,
    _check_threat = function(self,mons)
        -- when in debug mode, print the monster status table to mpr
        if DEBUG_MONS_STATUS == true then crawl.mpr(mons:name() .. " status: " .. mons:status() ) end
        if DEBUG_MONS_FLAGS == true then debug_mpr_mons_flags(mons) end
        if DEBUG_MONS_DESC == true then crawl.mpr(mons:name() .. " desc: " .. mons:desc(true) ) end
        if DEBUG_MONS_TARGET_DESC == true then crawl.mpr(mons:name() .. " target_desc: " .. mons:target_desc() ) end
        if DEBUG_LOF_PATH == true then check_lof(mons, "Magic Dart") end


-- begin danger table
        -- TODO: Fill out the remaining danger conditions:
        -- Need to finish adding all missing high danger monster spells,
        -- and also check things that aren't in mons:spells(), like wands, weapons, or monster descriptions
        -- TODO: add generic string.find(m:desc()) matching catch-all danger conditions,
        -- to make the script resilient vs. new mons / new spells / unhandled spells
        -- e.g. string.find(string.lower(m:desc(), "paralys"))
        -- or string.find(m:desc(), "[pP]aralys")   ??
        local danger_table = {
        -- XXX: refactor this table so i'm not duplicating logic (like check_abil_pct) in the conditions and reason fields
        {conditions = {check_abil_pct(mons, "Paralyse") ~= nil and check_abil_pct(mons, "Paralyse") > 5},
               tier = 3,
             reason = "Paralyse " .. (check_abil_pct(mons, "Paralyse") or "buggy") .. "%, equip more Will?"} ,
        {conditions = {check_abil_pct(mons, "Petrify") ~= nil and check_abil_pct(mons, "Petrify") > 5},
               tier = 3,
             reason = "Petrify " .. (check_abil_pct(mons, "Petrify") or "buggy") .. "%, equip more Will?"} ,
        {conditions = {check_abil_pct(mons, "Banishment") ~= nil and check_abil_pct(mons, "Banishment") > 5},
               tier = 3,
             reason = "Banishment " .. (check_abil_pct(mons, "Banishment") or "buggy") .. "%, equip more Will?"} ,
        {conditions = {check_abil_pct(mons, "Sleep") ~= nil and check_abil_pct(mons, "Sleep") > 5},
               tier = 3,
             reason = "Sleep " .. (check_abil_pct(mons, "Sleep") or "buggy") .. "%, equip more Will?"} ,
        {conditions = {check(mons, "Stunning Burst"), you.res_shock() < 1},
               tier = 3,
             reason = "Stunning Burst (paralyse) and no rElec"} ,
        {conditions = {check(mons, "Paralysis Gaze")},
               tier = 3,
             reason = "Irresistible Paralysis Gaze (pierces LOF) " .. (mons:status("fully charged") ~= true and "is charging!"
                                                                       or "is ready to fire!!")} ,
        {conditions = {check(mons, "Dream Dust")},
               tier = 2,
             reason = "Irresistible Dream Dust (" .. get_dream_dust_success_rate() .. "%), watch out!"} ,
        {conditions = {check_abil_pct(mons, "Confusion Gaze") ~= nil and check_abil_pct(mons, "Confusion Gaze") > 5},
               tier = 2,
             reason = "Confusion Gaze " .. (check_abil_pct(mons, "Confusion Gaze") or "buggy") .. "%, equip more Will?"} ,
        -- XXX: As far as I can tell, the only way to pull attack flavour (AF_WHATEVER) data is
        -- through string.find(mons:desc()), this doesn't appear to be exposed anywhere else in the clua
        -- TODO: check against the other attack flavour descriptors to see if there are more that should be handled here
        -- https://github.com/crawl/crawl/blob/master/crawl-ref/source/describe.cc#L4292
        {conditions = {check_desc(mons, "poison and cause paralysis or slowing"), you.res_poison() < 1},
               tier = 3,
             reason = "AF_POISON_PARALYSE and no rPois"} ,
        -- TODO: Improve this? mons evoke power is 30 + mons.get_hit_dice(); a static will check isn't accurate here,
        -- but the game also doesn't currently expose mons evoke success% vs. the player anywhere, as far as I can tell.
        {conditions = {check_tdesc(mons, "wand of paralysis"), you.willpower() < 3},
               tier = 3,
             reason = "Wand of Paralysis and low Will"} ,
        {conditions = {check_abil_pct(mons, "Porkalator") ~= nil and check_abil_pct(mons, "Porkalator") > 5},
               tier = 2,
             reason = "Porkalator " .. (check_abil_pct(mons, "Porkalator") or "buggy") .. "%, equip more Will?"} ,
        {conditions = {check_abil_pct(mons, "Slow") ~= nil and check_abil_pct(mons, "Slow") > 5},
               tier = 2,
             reason = "Slow " .. (check_abil_pct(mons, "Slow") or "buggy") .. "%, equip more Will?"} ,
        {conditions = {check_abil_pct(mons, "Sentinel's Mark") ~= nil and check_abil_pct(mons, "Sentinel's Mark") > 5},
               tier = 3,
             reason = "Sentinel's Mark " .. (check_abil_pct(mons, "Sentinel's Mark") or "buggy") .. "%, equip more Will?"} ,
        -- comparing "distort" instead of "distortion" works against Rift, randarts, and panlord "distorting touch"
        -- TODO: check to see if this catches dancing weapons?
        {conditions = {check_tdesc(mons, "[dD]istort"), you.branch() ~= "Zig"},
               tier = 3,
             reason = "Distortion weapon!"} ,
        -- elec weapons: ego, randarts + glaive of the guard + eos + storm bow, arc blade
        {conditions = {check_tdesc(mons, "of electrocution")
                       or check_tdesc(mons, "{elec")
                       or check_tdesc(mons, "arc blade"),
                       you.res_shock() < 1, you.branch() ~= "Zig"},
               tier = 2,
             reason = "Electrocution weapon and no rElec!"} ,
        {conditions = {check_tdesc(mons, "quivering poison"), you.res_poison() < 1, you.branch() ~= "Zig"},
               tier = 2,
             reason = "Quivering poison darts and no rPois, careful!"} ,
        {conditions = {check_tdesc(mons, "quivering curare"), you.res_poison() < 1, you.branch() ~= "Zig"},
               tier = 3,
             reason = "Quivering curare and no rPois, watch out!!"} ,
        {conditions = {check_tdesc(mons, "quivering atropa"), you.branch() ~= "Zig"},
               tier = 2,
             reason = "Quivering atropa, careful!"} ,
        {conditions = {check_tdesc(mons, "quivering datura"), you.branch() ~= "Zig"},
               tier = 3,
             reason = "Quivering datura, careful!"} ,
        {conditions = {check_tdesc(mons, "quivering dispersal"), you.branch() ~= "Zig"},
               tier = 3,
             reason = "Quivering dispersal, careful!"} ,
        {conditions = {check_tdesc(mons, "throwing net"), you.branch() ~= "Zig"},
               tier = 3,
             reason = "Quivering throwing nets, watch out!"} ,
        -- TODO: branded javelins (silver), branded large rocks (chuck)
        {conditions = {check_tdesc(mons, "large rock"), you.branch() ~= "Zig"},
               tier = 2,
             reason = "Quivering large rocks, watch out!!"} ,
        {conditions = {check_tdesc(mons, "javelin"), you.branch() ~= "Zig"},
               tier = 2,
             reason = "Quivering javelins, watch out!"} ,
        {conditions = {check_tdesc(mons, "boomerang"), you.branch() ~= "Zig"},
               tier = 2,
             reason = "Quivering boomerangs, careful!"} ,
        {conditions = {check(mons, "Malmutate"), you.branch() ~= "Zig"},
               tier = 2,
             reason = "Malmutator in LOS"} ,
        -- XXX: I'd prefer to check lof against "Malmutate" here, but it seems like spells.path() only works with player spells?
        {conditions = {check(mons, "Malmutate"), check_lof(mons), you.branch() ~= "Zig"},
               tier = 2,
             reason = "Malmutator in LOF!"} ,
        {conditions = {mons:name() == "orb of fire", you.res_fire() < 3},
               tier = 3,
             reason = "Orb of Fire and low rF"} ,
        {conditions = {mons:is_unique() == true},
               tier = 2,
             reason = "Unique monster, careful!"} ,
        {conditions = {check_rare_ood(mons)},
               tier = 2,
             reason = "OOD monster, careful!"} ,

        {conditions = {mons:name() == "Nikola", you.res_shock() < 1},
               tier = 3,
             reason = "Nikola and no rElec"} ,
        {conditions = {mons:name() == "Nikola", check_tdesc(mons, "[sS]ilenced") ~= true and mons:status("waterlogged") ~= true},
               tier = 3,
             reason = "Nikola in LOS and not silenced or waterlogged"} ,

        -- ironbound thunderhulks, lodul
        {conditions = {check(mons, "Call Down Lightning"), you.res_shock() < 1},
               tier = 3,
             reason = "Call Down Lightning and no rElec"} ,

        {conditions = {string.find(mons:name(), "[sS]imulacrum") ~= nil, you.res_cold() < 1},
               tier = 2,
             reason = "simulacrum and no rC, careful"} ,
        {conditions = {string.find(mons:name(), "[sS]imulacrum") ~= nil, string.find(mons:speed_description(), "fast") ~= nil,
                       you.res_cold() < 1},
               tier = 3,
             reason = mons:speed_description() .. " simulacrum and no rC, watch out!!"} ,

        {conditions = {mons:is("ready_to_howl"), you.branch() ~= "Zig",
                       check_abil_pct(mons, "Doom Howl") ~= nil and check_abil_pct(mons, "Doom Howl") > 5},
               tier = 3,
             reason = "Doom Howl " .. (check_abil_pct(mons, "Doom Howl") or "buggy") .. "%, equip more Will or hex it or something"} ,
        {conditions = {check(mons, "Symbol of Torment"), you_res_torment() ~= true},
               tier = 3,
             reason = "Torment and not torment immune!"} ,

        {conditions = {check(mons, "Dispel Undead Range"), you_are_undead(true) == true},
               tier = 3,
             reason = "Dispel Undead in LOS while undead!"} ,
        {conditions = {check_tdesc(mons, "Undeadhunter"), you_are_undead(true) == true},
               tier = 3,
             reason = "wielding Undeadhunter while undead, watch out!!"} ,
        {conditions = {check_tdesc(mons, "holy wrath"), you_are_unholy() == true},
               tier = 3,
             reason = "wielding holy wrath while unholy, watch out!!"} ,

        {conditions = {check_tdesc(mons, "carrying a wand")},
               tier = 2,
             reason = "carrying a " .. (string.match(mons:target_desc(), "wand of %w+") or "unknown/nonexistent wand?")
                                    .. ", careful!"} ,
        -- damnation checks
        {conditions = {check(mons, "Hurl Damnation")},
               tier = 2,
             reason = "Damnation in LOS, careful!"} ,
        {conditions = {check(mons, "Call Down Damnation")},
               tier = 2,
             reason = "Damnation (smite) in LOS, watch out!"} , }

        -- TODO: handle radroach irradiate
        -- TODO: handle ophan "Holy Flames" vs. unholy/undead player check
        -- TODO: handle revenant ghostly fireball (rN check)
        -- TODO: generic "mons carrying randart/unrand check"
        -- TODO: handle Spit Acid and no rCorr
        -- TODO: handle Corrosive Bolt and no rCorr
        -- TODO: look into which other rCorr abilities should be warned
        -- TODO: "if it's unique, and asleep, and at abs(maxlos) from 0,0", auto set an exclude
        -- maybe do the same thing if it's OOD? or tripping any huge damage / rF+++ flags?
        -- TODO: I need to add active status warnings for dangerous player status to this script;
        -- things like petrifying or howl or standing-in-dangerous-cloud or mark

        for _,entry in ipairs(danger_table) do
            assert(type(entry.conditions) == "table" and type(entry.tier) == "number" and type(entry.reason) == "string")
        end
-- end danger table

        for _,threat in ipairs(danger_table) do
            if all_true(threat.conditions) then
                local needs_warn = true
                -- if this entry to current_threats matches a known_threats entry, don't warn about it,
                -- but also delete the matching known_threats entry, so that we can properly warn about duplicate threats.
                for key,entry in pairs(known_threats) do
                    if entry.name == mons:name() and entry.reason == threat.reason then
                        needs_warn = false
                        table.remove(known_threats, key)
                        break
                    end
                end

                table.insert(current_threats, {name = mons:name(), tier = threat.tier, reason = threat.reason, last_warned = nil})
                if needs_warn then self:_warn(current_threats[#current_threats]) end
            end
        end

    end,
    _update_threats = function(self)
        current_threats = {}
        for _,mons in ipairs(mons_table) do
            self:_check_threat(mons)
        end
        if DEBUG_THREATS == true then debug_mpr_current_threats() end

        -- at the end of each update, replace the known_threats table with the current_threats table
        known_threats = current_threats
    end,
    _reissue_warnings = function(self)
        for _,threat in ipairs(current_threats) do
            if threat.tier >= 3 then
                self:_warn(threat, false)
            end
        end
    end,
    _issue_message_log_warnings = function(self)
        for key,warning in ipairs(pending_message_warnings) do
            self:_warn(warning)
            table.remove(pending_message_warnings, key)
        end
    end,
    _update_player_warnings = function(self)
        update_hp_warning()
    end,
    _issue_player_warnings = function(self)
        for key,warning in ipairs(pending_player_warnings) do
            self:_warn(warning,true)
            table.remove(pending_player_warnings, key)
        end
    end,
    _maybe_act = function(self)
-- begin action table
        local action_table = {
        -- TODO: auto-id of consumables, to help avoid earlygame unid situations
        -- TODO: make sure the script autopicks aux items during earlygame
        -- TODO: let the script handle autopick / autodrop of the usual throwables + evo items
        { auto = true, handler = maybe_reissue_autoexplore } , }
-- end action table

        local did_act = nil
        for _,action in ipairs(action_table) do
            if action.auto then
                did_act = action.handler()
            end
            if did_act == true then
                break
            end
        end
        return did_act
    end,
    -- ready() can be called multiple times per game turn, if the player takes actions that do not end the turn.
    -- (e.g. pressing escape, checking inventory with 'i', checking spells with 'I', etc.)
    -- We don't want the script to rebuild threat tables or reissue warnings if it has already done so this turn,
    -- therefore, we only take these actions if the game turn has changed.
    update = function(self)
        if self._last_updated == nil or self._last_updated ~= you.turns() then
            self:_update_mons()
            self:_update_threats()
            self:_reissue_warnings()
            self:_update_player_warnings()
            self:_issue_player_warnings()
            self._last_updated = you.turns()
        end
        self:_maybe_act()
    end, }

function ready()
    if you.turns() == 0 then init_player_tile() end
    if DEBUG_YOU_STATUS == true then crawl.mpr(you.status() .. " || " .. you.transform()) end
    status:update()
end

local message_log_threat_table = {
    {conditions = "into a shaft and drop",
           tier = 3,
         reason = "Shafted!"} ,
    {conditions = "You are yanked towards",
           tier = 3,
         reason = "Malevolent teleportation!"} , }

-- ch_stop_running preempts(?) c_message, so here we track state, and defer acting on it until the next ready().
-- TODO: check messages for whether the player was shafted / teleported, and if so, stop reissuing autoexplore?
-- I don't want the script blindly re-issuing actions if the floor situation has changed.
function c_message(text, channel)
    if string.find(text, "Done exploring.") then done_exploring = true end
    if string.find(text, "Partly explored") then done_exploring = true end

    for _,threat in ipairs(message_log_threat_table) do
        if string.find(text, threat.conditions) then
            table.insert(pending_message_warnings, {name = threat.reason, tier = threat.tier, reason = threat.reason, last_warned = nil})
            status:_issue_message_log_warnings() 
       end
    end
end

-- Does the given feature exist adjacent to the player?
--
-- For this, we compare against view.feature_at(x,y),
-- which returns the second name string in feature-data.h, feature_def feat_defs[],
-- this is the "vaultname" string that includes underscores.
--
-- If ignore_excluded is true, we treat tiles with exclusions as though they do not contain the feature.
-- @param string "feature_name"
-- @param bool[opt="false"] ignore_excluded
-- @return bool
function check_adjacent_feat(string, ignore_excluded)
    ignore_excluded = ignore_excluded or false
    local feature = nil
    for i = -1,1 do
        for j = -1,1 do
            feature = view.feature_at(i,j)
            if feature == string then
                if ignore_excluded == true and travel.is_excluded(i,j) == true then
                    -- do nothing, continue the loop
                else
                    return true
                end
            end
        end
    end
    return false
end

-- Note: We can't print messages to mpr from ch_stop_running().
-- XXX: Messages here appear to print to the log *before* the c_message() hook is called, which appears
-- to preempt that hook, breaking the underlying assumption that it's being called for each message. (???)
function ch_stop_running(runmode)
    reissue_autoexplore_needed = false
    -- These conditions test if our autoexplore was interrupted early due to travel_open_doors = avoid.
    -- XXX: This check is imperfect, and is likely to send the script into infinite autoexplore loops.
    -- I've added an assert and some harder checks to maybe_reissue_autoexplore(), but this could still be improved.
    if runmode == "explore_greedy" and check_adjacent_feat("closed_door", true)
       and you.feel_safe() and force_autoexplore_stop == false then
           reissue_autoexplore_needed = true
    end
end

-- "travel_open_doors = avoid" ordinarily causes problems with closed doors and interlevel travel.
-- This permits autotravel to open doors that are in the way, when issuing G> and X> commands.
function ch_start_running(runmode)
    if runmode == "intertravel" then
        crawl.setopt("travel_open_doors = open")
    end
end

function c_answer_prompt(prompt)
    -- skip chain lightning and shatter ally prompts when megazigging with death channel
    if you.branch() == "Zig" and you.status("death channelling") == true then
        if prompt:find("Chain Lightning might hit") then return true end
        if prompt:find("Really attack near") then return true end
    end
    if prompt:find("Really quaff the potion of lignification") then return true end
    if prompt:find("Really attack barehanded") then return true end
    if prompt:find("Shopping list: replace") then return false end
    if prompt:find("Shopping list: remove") then return false end
    -- try to prevent the script from becoming stuck in a failed autopickup -> reissue autoexplore loop,
    -- if it fails to pick something up while adjacent to a closed door
    if prompt:find("Could not pick up") then
        force_autoexplore_stop = true
    end
end
}
