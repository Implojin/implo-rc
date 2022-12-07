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

local ATT_NEUTRAL = 1
local mons_table = {}
local current_threats = {}
local known_threats = {}

local DEBUG_MONS_STATUS = false
local DEBUG_MONS_DESC = false
local DEBUG_MONS_TARGET_DESC = false
local DEBUG_LOF_PATH = false
local DEBUG_THREATS = false

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
    -- TODO: Maybe allow some extreme threats to pop every turn? e.g. paralyse with low Will
    _warn = function ()
        local threat = current_threats[#current_threats]
        crawl.formatted_mpr("<lightred>Danger: " .. threat[1]:name() .. "</lightred> || " ..
                            "<lightblue>Reason: " .. tostring(threat[2]) .. "</lightblue>")
        crawl.more()
    end,
    _check_threat = function(self,mons)
        -- when in debug mode, print the monster status table to mpr
        if DEBUG_MONS_STATUS == true then crawl.mpr(mons:name() .. " status: " .. mons:status() ) end
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
             reason = "Paralyse and low Will"} ,
        {conditions = {check(mons, "Petrify"), you.willpower() < 3},
             reason = "Petrify and low Will"} ,
        {conditions = {check(mons, "Banishment"), you.willpower() < 3},
             reason = "Banishment and low Will"} ,
        {conditions = {check(mons, "Stunning Burst"), you.res_shock() < 1},
             reason = "Stunning Burst (paralyse) and no rElec"} ,
        -- TODO: I'd like to deduplicate this but atm it's not worth the code, revisit this after adding all threat conditions
        -- (if there are enough conditions that need dedup I can change all reasons to a function return and update the caller)
        {conditions = {check(mons, "Paralysis Gaze"), mons:status("fully charged") ~= true},
             reason = "irresistable Paralysis Gaze in LOS, but not channelling yet"} ,
        {conditions = {check(mons, "Paralysis Gaze"), mons:status("fully charged") == true},
             reason = "channelling irresistable Paralysis Gaze!"} ,
        {conditions = {check(mons, "Confusion Gaze"), you.willpower() < 3},
             reason = "Confusion Gaze and low Will"} ,
        -- XXX: As far as I can tell, the only way to pull attack flavour (AF_WHATEVER) data is
        -- through string.find(mons:desc()), this doesn't appear to be exposed anywhere else in the clua
        -- TODO: check against the other attack flavour descriptors to see if there are more that should be handled here
        -- https://github.com/crawl/crawl/blob/master/crawl-ref/source/describe.cc#L4292
        {conditions = {check_desc(mons, "poison and cause paralysis or slowing"), you.res_poison() < 1},
             reason = "AF_POISON_PARALYSE and no rPois"} ,
        -- TODO: Improve this? I'm not sure a static will check is ideal here; does monster HD/XL/whatever factor in?
        {conditions = {check_tdesc(mons, "wand of paralysis"), you.willpower() < 3},
             reason = "Wand of Paralysis and low Will"} ,
        -- comparing "distort" instead of "distortion" works against Rift, randarts, and panlord "distorting touch"
        -- TODO: check to see if this catches dancing weapons?
        {conditions = {check_tdesc(mons, "[dD]istort"), you.branch() ~= "Zig"},
             reason = "Distortion weapon!"} ,
        {conditions = {check(mons, "Malmutate"), you.branch() ~= "Zig"},
             reason = "Malmutator in LOS"} ,
        -- XXX: I'd prefer to check lof against "Malmutate" here, but it seems like spells.path() only works with player spells?
        {conditions = {check(mons, "Malmutate"), check_lof(mons), you.branch() ~= "Zig"},
             reason = "Malmutator in LOF!"} ,
        {conditions = {mons:name() == "orb of fire", you.res_fire() < 3},
             reason = "Orb of Fire and low rF"} , }

        for _,threat in ipairs(danger_table) do
            if all_true(threat.conditions) then
                local needs_warn = true
                -- if this entry to current_threats matches a known_threats entry, don't warn about it,
                -- but also delete the matching known_threats entry, so that we can properly warn about duplicate threats.
                for key,entry in pairs(known_threats) do
                    if entry[1]:name() == mons:name() and entry[2] == threat.reason then
                        needs_warn = false
                        table.remove(known_threats, key)
                        break
                    end
                end

                table.insert(current_threats, {mons, threat.reason})
                if needs_warn then self:_warn() end
            end
        end
-- end danger table
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
    update = function(self)
        self:_update_mons()
        self:_update_threats()
    end, }

function ready()
    status:update()
end
}
