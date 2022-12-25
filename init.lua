# TEAMCAPTAIN 

travel_delay = -1
explore_delay = -1
rest_delay = -1
view_delay = 0
show_travel_trail = true
use_animations = false

# megazigging
show_more = false

# try to prevent autopick from being interrupted during zig cleanup?
travel_key_stop = false

# re-set travel_open_doors = false, this was set in my old rc but removed -.-
travel_open_doors = avoid

# try to reduce keyboard delay for realtime games
# for local games, this can = keyboard debounce time (in milliseconds),
# but for online play, let's set it to server ping (in ms)
tile_runrest_rate = 0
tile_key_repeat_delay = 43

# prevent autofight from changing behavior at arbitrary HP threshold
autofight_stop = 0

# try to prevent movement key tapping deaths due to disabled mores
# note: you need to force_more for this to work with show_more = false
hp_warning = 60

# allow specific force_mores through show_more = false
force_more_message = 
force_more_message += LOW HITPOINT WARNING

# since we're clearing default force_mores, re-enable portal, zot clock,
# and disto announcements, as not to miss them

# default force_mores can be found at:
# https://github.com/crawl/crawl/blob/master/crawl-ref/source/dat/defaults/messages.txt#L89
# (some of these might be helpful to re-add later)

## Zot is coming!
force_more_message += You have lingered too long
force_more_message += Zot draws nearer
force_more_message += Zot has nearly found you
force_more_message += Zot already knows
force_more_message += Zot's attention fixes on you
# Announcements of timed portal vaults:
force_more_message += interdimensional caravan
force_more_message += distant snort
force_more_message += roar of battle
force_more_message += wave of frost
force_more_message += hiss of flowing sand
force_more_message += sound of rushing water
force_more_message += oppressive heat about you
force_more_message += crackle of arcane power
force_more_message += hear a distant wind
## Dangerous weapons
#force_more_message += is wielding.*distortion
## dancing weapons require special handling...
#force_more_message += there is a.*distortion
#force_more_message += of distortion comes into view

# flash screen for our scripted danger tier warnings above tier 2
flash_screen_message += T2
flash_screen_message += T3

# tiles-specific options
tile_show_threat_levels = tough, nasty
cloud_status = true

# does this have a bad interaction with view_delay ???
# tile_realtime_anim = true

# player tile things
tile_weapon_offsets = 0,0
tile_shield_offsets = 0,0

# TODO: move all of these global player tiles into the species-specific tables,
# then get rid of this old table
: player_tiles_table = {
: "tile:mons_polymoth",
: "tile:mons_dimme",
: "tile:mons_hell_wizard_50",
: "tile:mons_hellbinder",
: "tile:mons_master_elementalist",
: "tile:mons_dryad",
: "tile:mons_eleionoma",
:-- "tile:mons_tiamat_mottled",
: "tile:mons_holy_swine", }
:
: if c_persist.PLAYER_TILE == nil then
:    c_persist.PLAYER_TILE = player_tiles_table[crawl.random2(#player_tiles_table) + 1]
: end
:
: crawl.setopt("tile_player_tile = " .. c_persist.PLAYER_TILE)

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
: "tile:mons_killer_klown_3",
: "tile:mons_gloorx_vloq",
: "tile:mons_lom_lobon",
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
: "tile:mons_ancestor_hexer",
: "tile:mons_drowned_soul",
: "tile:mons_erica_swordless",
: "tile:mons_louise",
: "tile:mons_maggie",
: "tile:mons_margery", }

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
:-- "tile:mons_cigotuvis_monster",
:-- "tile:TRAN_STORM_OCTOPODE",
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

-- Check whether a monster's abilities deal enough damage to be dangerous to the player.
-- If it's dangerous, return a danger_entries table, containing conditions and reasons for each danger.
-- @return danger_entries { {conditions = table, tier = number, reason = string}, ... }
function check_generic_damage(mons)
    local abilities = {}
    local books = nil
    books = mons:spells()
    if books ~= nil then
        for _,book in ipairs(books) do
            for _,spell in ipairs(book) do
                table.insert(abilities, spell)
            end
        end
    end

    local hp,mhp = you.hp()
    local damage = nil
    local entry = {}
    local danger_entries = {}

    if next(abilities) ~= nil then
        for _,ability in ipairs(abilities) do
            damage = nil
            -- XXX: serpent of hell has an issue here: its abilities mostly dont show up in mons:spells() ???
            -- all that shows up here are "gehenna serpent of hell breath" and "Summon Dragon"
            -- It looks like those are its only two abilities in mon-spell.h MST_SERPENT_OF_HELL_GEH ,
            -- but it has several other abils in-game (these are probably coded similarly to draconian breath abils or something?
            -- TODO: look into *this*.
            damage = check_abil_dam(mons, ability)
            if damage ~= nil then
                entry = {}
                if damage / mhp >= 0.5 then
                    entry = {conditions = {true}, tier = 2, reason = ability .. " deals more than 50% MHP!"}
                    table.insert(danger_entries, entry)
                end
                if damage > hp then
                    entry = {conditions = {true}, tier = 3, reason = "IMMINENT DEATH: " .. ability .. " deals " .. tostring(damage)
                                                                     .. " damage, you have " .. tostring(hp) .. " HP!!"}
                    table.insert(danger_entries, entry)
                end
            end
        end
    end

    -- TODO: warn if (total highest damage of all onscreen mons) >= (current HP)?
    -- (this will require doing it from outside of this function)

    for _,entry in ipairs(danger_entries) do
        assert(type(entry.conditions) == "table" and type(entry.tier) == "number" and type(entry.reason) == "string")
    end
    return danger_entries
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
        -- try to extract "ability string, whitespace, optional <color>, (number%)" from the full desc
        pct = string.match(desc, ability .. "%s+" .. "<?%l*>?" .. "%(%d+%%%)")
        -- if our pattern exists, try to extract "number%"
        if pct ~= nil then
            pct = string.match(pct, "%d+")
        end
    end
    if DEBUG_ABIL_PCT then
        if pct ~= nil then
            crawl.mpr(ability .. "(%): " .. pct)
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
        crawl.mpr("name(): " .. entry[1]:name() .. " pos(): " .. pos1 .. "," .. pos2)
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
    if transform == "lich" or transform == "wisp" or transform == "fungus" or transform == "shadow" then
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
    -- if (form == transformation::lich)
    local transform = you.transform()
    if transform == "lich" then return true end
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

-- Returns true if this mons should be treated as threatening for autotravel, warning, and combat purposes.
-- This function exists because mons:is_firewood() doesn't cover all such cases.
-- @param mons mons
-- @return bool
function is_threatening(mons)
    if mons:is_firewood() and mons:name() ~= "briar patch" then return false end
    if mons:name() == "butterfly" then return false end
    return mons:attitude() < ATT_NEUTRAL
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
    -- TODO: Maybe allow some extreme threats to pop every turn? e.g. paralyse with low Will
    _warn = function ()
        local threat = current_threats[#current_threats]
        local tier = threat.tier
        local colour = "yellow"
        if tier > 1 then colour = "yellow" end
        if tier > 2 then colour = "lightred" end

        crawl.formatted_mpr("<lightred>Danger: " .. threat[1]:name() .. "</lightred> |T" .. tostring(tier) .. "| " ..
                            "<" .. colour .. ">Reason: " .. threat.reason .. "</" .. colour .. ">")

        -- Tier 2+, flash screen. There is no clua binding to manually perform a flash screen.
        -- Here, we have to rely on the rcfile flash_screen_message option, pattern matching our (custom) printed tier messages.

        if tier >= 3 then crawl.more() end
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
        -- TODO: compare mons spellpower / success rate (whichever of these is exposed?)
        -- against player Will for Paralyse/Banish/Petrify, etc.
        local danger_table = {
        {conditions = {check(mons, "Paralyse"), you.willpower() < 3},
               tier = 3,
             reason = "Paralyse and low Will"} ,
        {conditions = {check(mons, "Petrify"), you.willpower() < 3},
               tier = 3,
             reason = "Petrify and low Will"} ,
        {conditions = {check(mons, "Banishment"), you.willpower() < 3},
               tier = 3,
             reason = "Banishment and low Will"} ,
        {conditions = {check(mons, "Stunning Burst"), you.res_shock() < 1},
               tier = 3,
             reason = "Stunning Burst (paralyse) and no rElec"} ,
        {conditions = {check(mons, "Paralysis Gaze")},
               tier = 3,
             reason = "Irresistable Paralysis Gaze (pierces LOF) " .. (mons:status("fully charged") ~= true and "is charging!"
                                                                       or "is ready to fire!!")} ,
        {conditions = {check(mons, "Confusion Gaze"), you.willpower() < 3},
               tier = 2,
             reason = "Confusion Gaze and low Will"} ,
        -- XXX: As far as I can tell, the only way to pull attack flavour (AF_WHATEVER) data is
        -- through string.find(mons:desc()), this doesn't appear to be exposed anywhere else in the clua
        -- TODO: check against the other attack flavour descriptors to see if there are more that should be handled here
        -- https://github.com/crawl/crawl/blob/master/crawl-ref/source/describe.cc#L4292
        {conditions = {check_desc(mons, "poison and cause paralysis or slowing"), you.res_poison() < 1},
               tier = 3,
             reason = "AF_POISON_PARALYSE and no rPois"} ,
        -- TODO: Improve this? I'm not sure a static will check is ideal here; does monster HD/XL/whatever factor in?
        {conditions = {check_tdesc(mons, "wand of paralysis"), you.willpower() < 3},
               tier = 3,
             reason = "Wand of Paralysis and low Will"} ,
        -- comparing "distort" instead of "distortion" works against Rift, randarts, and panlord "distorting touch"
        -- TODO: check to see if this catches dancing weapons?
        {conditions = {check_tdesc(mons, "[dD]istort"), you.branch() ~= "Zig"},
               tier = 3,
             reason = "Distortion weapon!"} ,
        {conditions = {check(mons, "Malmutate"), you.branch() ~= "Zig"},
               tier = 2,
             reason = "Malmutator in LOS"} ,
        -- XXX: I'd prefer to check lof against "Malmutate" here, but it seems like spells.path() only works with player spells?
        {conditions = {check(mons, "Malmutate"), check_lof(mons), you.branch() ~= "Zig"},
               tier = 3,
             reason = "Malmutator in LOF!"} ,
        {conditions = {mons:name() == "orb of fire", you.res_fire() < 3},
               tier = 3,
             reason = "Orb of Fire and low rF"} ,
        {conditions = {mons:is_unique() == true},
               tier = 3,
             reason = "Unique monster, careful!"} ,
        {conditions = {check_rare_ood(mons)},
               tier = 3,
             reason = "OOD monster, careful!"} ,
        {conditions = {check(mons, "Creeping Frost"), you.res_cold() < 1},
               tier = 2,
             reason = "Creeping Frost and no rC"} ,
        -- Most major rElec mons have Lightning Bolt:
        -- This covers electric golems, titans, storm dragons, antaeus, multiple uniques;
        -- also many smaller mons, inc. annihilators, air mages.
        {conditions = {check(mons, "Lightning Bolt"), you.res_shock() < 1},
               tier = 2,
             reason = "Lightning Bolt and no rElec"} ,
        -- Chain Lightning only exists on Nikola at present, but this check is here in case some dev gets creative
        {conditions = {check(mons, "Chain Lightning"), you.res_shock() < 1},
               tier = 3,
             reason = "Chain Lightning and no rElec"} ,
        {conditions = {mons:name() == "Nikola", you.res_shock() < 1},
               tier = 3,
             reason = "Nikola and no rElec"} ,
        {conditions = {mons:name() == "Nikola", check_tdesc(mons, "[sS]ilenced") ~= true and mons:status("waterlogged") ~= true},
               tier = 3,
             reason = "Nikola in LOS and not silenced or waterlogged"} ,
        -- shock serpents, electric eels, lightning spires
        {conditions = {check(mons, "Electrical Bolt"), you.res_shock() < 1},
               tier = 2,
             reason = "Electrical Bolt and no rElec"} ,
        -- lom lobon
        {conditions = {check(mons, "Conjure Ball Lightning"), you.res_shock() < 1},
               tier = 3,
             reason = "Conjure Ball Lightning and no rElec"} ,
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
        {conditions = {check(mons, "Bolt of Cold"), you.res_cold() < 1},
               tier = 2,
             reason = "Bolt of Cold and no rC"} ,
        {conditions = {check(mons, "Cold Breath"), you.res_cold() < 1},
               tier = 2,
             reason = "Cold Breath and no rC"} ,
        {conditions = {check(mons, "Glaciate"), you.res_cold() < 3},
               tier = 3,
             reason = "Glaciate and not rC+++, watch out!"} ,
        {conditions = {check(mons, "Polar Vortex"), you.res_cold() < 3},
               tier = 3,
             reason = "Polar Vortex and not rC+++, careful!"} ,
        -- antaeus, josephina, rime drakes
        {conditions = {check(mons, "Flash Freeze"), you.res_cold() < 2},
               tier = 3,
             reason = "Flash Freeze and not rC++, careful!"} ,
        -- josephina, wendigo
        {conditions = {check(mons, "Seracfall"), you.res_cold() < 3},
               tier = 3,
             reason = "Seracfall and not rC+++, careful!"} ,
        {conditions = {check(mons, "Doom Howl"), mons:is("ready_to_howl"), you.branch() ~= "Zig"},
               tier = 3,
             reason = "Doom Howl in LOS, hex it or something"} ,
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
        -- xtahua (3d40)
        {conditions = {check(mons, "Searing Breath"), you.res_fire() < 3},
               tier = 3,
             reason = "Searing Breath (3d40) and not rF+++, watch out!"} ,
        -- hellephant (3d40), fire dragon (3d24), lindwurm (3d18), hell hound (3d10)
        -- TODO: maybe dynamically check ability descriptors for something like '3d40',
        -- to get rid of the hardcoded hellephant check here?
        {conditions = {check(mons, "Fire Breath"), mons:name() ~= "hellephant", you.res_fire() < 1},
               tier = 2,
             reason = "Fire Breath and not rF+, careful"} ,
        {conditions = {check(mons, "Fire Breath"), mons:name() == "hellephant", you.res_fire() < 3},
               tier = 3,
             reason = "Fire Breath (3d40) and not rF+++, watch out!"} ,
        -- 10 mons: orb of fire (3d43), margery (3d33), draconian scorcher (3d26), fire giant (3d26),
        -- deep elf elementalist (3d23), balrug (3d23), azrael (3d20), hell hog (3d20), wizard (3d19), efreet (3d15)
        {conditions = {check(mons, "Fireball"), mons:name() ~= "orb of fire" and mons:name() ~= "Margery", you.res_fire() < 1},
               tier = 2,
             reason = "Fireball and not rF+, careful"} ,
        {conditions = {check(mons, "Fireball"), mons:name() == "Margery", you.res_fire() < 2},
               tier = 3,
             reason = "Fireball (3d33) and not rF++, careful"} ,
        {conditions = {check(mons, "Fireball"), mons:name() == "orb of fire", you.res_fire() < 3},
               tier = 3,
             reason = "Fireball (3d43) and not rF+++, watch out!"} ,
        -- 16 mons: orb of fire (3d40), margery (3d32) !, mara (3d27) (x3 if mara clones...), golden dragon (3d27), asmodeus (3d26),
        -- tengu reaver (3d26), draconian scorcher (3d25), fire giant (3d25), ophan (3d24), balrug (3d23), azrael (3d20),
        -- hell knight (3d18), deep elf fire mage "pyromancer": (3d17), orc sorcerer (3d17), efreet (3d15), maggie (3d13)
        {conditions = {check(mons, "Bolt of Fire"), mons:name() ~= "orb of fire" and mons:name() ~= "Margery"
                                                    and mons:name() ~= "Mara", you.res_fire() < 1},
               tier = 2,
             reason = "Bolt of Fire and not rF+, careful"} ,
        {conditions = {check(mons, "Bolt of Fire"), mons:name() == "Margery" or mons:name() == "Mara", you.res_fire() < 2},
               tier = 3,
             reason = "Bolt of Fire " .. (mons:name() == "Margery" and "(3d32)" or "(3d27)") .. " and not rF++, careful"} ,
        {conditions = {check(mons, "Bolt of Fire"), mons:name() == "orb of fire", you.res_fire() < 3},
               tier = 3,
             reason = "Bolt of Fire (3d40) and not rF+++, watch out!"} ,
        -- 5 mons: draconian scorcher (3d25), roxanne (3d23), salamander mystic (3d18), ogre mage (3d18), molten gargoyle (3d15)
        {conditions = {check(mons, "Bolt of Magma"), string.find(mons:name(), "draconian scorcher") == nil
                                                     and mons:name() ~= "Roxanne", you.res_fire() < 1},
               tier = 2,
             reason = "Bolt of Magma and not rF+, careful"} ,
        {conditions = {check(mons, "Bolt of Magma"), string.find(mons:name(), "draconian scorcher") ~= nil
                                                     or mons:name() == "Roxanne" , you.res_fire() < 3},
               tier = 3,
             reason = "Bolt of Magma (irresistible ~3d30+ equivalent) and not rF+++, watch out!"} ,
        {conditions = {check_tdesc(mons, "carrying a wand")},
               tier = 3,
             -- This pattern should match against (charges) and (success%), but I think the game only displays (charges) here
             reason = "carrying a " .. (string.match(mons:target_desc(), "wand of %w+ %(%d+%%?%)") or "unknown/nonexistent wand?")
                                    .. ", careful!"} ,
        -- damnation checks
        {conditions = {check(mons, "Hurl Damnation"), check_lof(mons) ~= true},
               tier = 2,
             reason = "Damnation in LOS, careful!"} ,
        {conditions = {check(mons, "Hurl Damnation"), check_lof(mons) == true},
               tier = 3,
             reason = "Damnation in LOF, watch out!"} ,
        {conditions = {check(mons, "Call Down Damnation")},
               tier = 3,
             reason = "Damnation (smite) in LOS, watch out!"} , }

        local generic_damage_entries = check_generic_damage(mons)
        for _,entry in ipairs(generic_damage_entries) do
            table.insert(danger_table, entry)
        end

        -- TODO: maybe remove the base OOF name check, since its spells are now accounted for separately
        -- alternate approach: remove the OOF-specific bolt of fire and fireball checks, since they're spamming twice per OOF,
        -- and instead just rely on the single old-style oof rF3 warning
        -- TODO: adjust the IMMINENT DEATH checks to account for player resistance, right now they work off of base damage only,
        -- which fires warnings pretty much instantly vs. d40s / glaciate
        -- TODO: same deal as above with the 50% MHP warnings
        -- TODO: handle radroach irradiate
        -- TODO: handle ophan "Holy Flames" vs. unholy/undead player check
        -- TODO: handle revenant ghostly fireball (rN check)
        -- TODO: generic "mons carrying randart/unrand check"
        -- TODO: something like "warning: min TTL < 1 turn!!", "warning: min TTL < 2 turns!",
        -- "avg TTL < 3 turns", etc.; compare against total known onscreen damage values for this
        -- TODO: handle Spit Acid and no rCorr
        -- TODO: handle Corrosive Bolt and no rCorr
        -- TODO: look into which other rCorr abilities should be warned
        -- TODO: "if it's unique, and asleep, and at abs(maxlos) from 0,0", auto set an exclude
        -- maybe do the same thing if it's OOD? or tripping any huge damage / rF+++ flags?

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
                    if entry[1]:name() == mons:name() and entry.reason == threat.reason then
                        needs_warn = false
                        table.remove(known_threats, key)
                        break
                    end
                end

                table.insert(current_threats, {mons, tier = threat.tier, reason = threat.reason})
                if needs_warn then self:_warn() end
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
    update = function(self)
        self:_update_mons()
        self:_update_threats()
        self:_maybe_act()
    end, }

function ready()
    if you.turns() == 0 then init_player_tile() end
    status:update()
end

-- ch_stop_running preempts(?) c_message, so here we track state, and defer acting on it until the next ready().
-- TODO: check messages for whether the player was shafted / teleported, and if so, stop reissuing autoexplore?
-- I don't want the script blindly re-issuing actions if the floor situation has changed.
function c_message(text, channel)
    if string.find(text, "Done exploring.") then
        done_exploring = true
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
            -- XXX: there's a logic error here? it's returning immediately, not checking any other tiles,
            -- if it finds *one* that's excluded. I need to flip the tests and only return true from within this for do
            -- TODO: FIXME
            if ignore_excluded == true and travel.is_excluded(i,j) == true then return false end
            if feature == string then return true end
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
    if runmode == "explore_greedy" and check_adjacent_feat("closed_door", true) and you.feel_safe() then
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

-- skip chain lightning and shatter ally prompts when megazigging with death channel
function c_answer_prompt(prompt)
    if you.branch() == "Zig" and you.status("death channelling") == true then
        if prompt:find("Chain Lightning might hit") then return true end
        if prompt:find("Really attack near") then return true end
    end
end
}
