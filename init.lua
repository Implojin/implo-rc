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

local DEBUG_MONS_STATUS = false

local function all_true(table)
    for _,v in ipairs(table) do
        if v == nil then return false end
        if not (v == true) then return false end
    end
    return true
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
    _check_threat = function(self,mons)
        -- when in debug mode, print the monster status table to mpr
        if DEBUG_MONS_STATUS == true then crawl.mpr(mons:name() .. " status: " .. mons:status() ) end

-- begin danger table
        -- TODO: Fill out the remaining danger conditions:
        -- Need to finish adding all missing high danger monster spells,
        -- and also check things that aren't in mons:spells(), like wands, weapons, or monster descriptions
        -- TODO: add generic string.find(m:desc()) matching catch-all danger conditions,
        -- to make the script resilient vs. new mons / new spells / unhandled spells
        -- e.g. string.find(string.lower(m:desc(), "paralys"))
        -- or string.find(m:desc(), "[pP]aralys")   ??
        -- TODO: compare mons spellpower / success rate (whichever of these is exposed?)
        -- against player Will for Paralyse/Banish/Petrify,
        -- do the same for player rPois vs. AF_POISON_PARALYSIS, etc.
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
             reason = "Confusion Gaze and low Will"} , }
        
        for _,threat in ipairs(danger_table) do
            if all_true(threat.conditions) then
                table.insert(threat_table, {mons, threat.reason})
            end
        end
-- end danger table
    end,
    _update_threats = function(self)
        threat_table = {}
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
