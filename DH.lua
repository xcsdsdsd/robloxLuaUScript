local VALUE = 100
local LO = 1
local HI = 100

local SCAN_DELAY = 0.02
local LOCK_DELAY = 0.005
local LOCK_THREADS = 5

local list = {}

local function num(v)
    if type(v) == "number" then return v end
    if type(v) == "string" then
        local ok, r = pcall(function() return tonumber(v) end)
        if ok then return r end
    end
    return nil
end

task.spawn(function()
    while true do
        pcall(function()
            local cache = getgc("Stamina")
            local newList = {}
            for _, e in ipairs(cache) do
                if e.type == "number" then
                    local n = num(e.value)
                    if n and n >= LO and n <= HI then
                        table.insert(newList, e)
                    end
                end
            end
            if #newList > 0 then
                list = newList
            end
        end)
        task.wait(SCAN_DELAY)
    end
end)

for i = 1, LOCK_THREADS do
    task.spawn(function()
        while true do
            pcall(function()
                local current = list
                if #current > 0 then
                    applygc(current, "Stamina", VALUE)
                end
            end)
            task.wait(LOCK_DELAY)
        end
    end)
end

print("on")
