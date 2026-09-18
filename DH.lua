local VALUE = 100
local LO = 1
local HI = 100
local DELAY = 0.01

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
        local ok = pcall(function()
            local cache = getgc("Stamina")
            local list = {}
            for _, e in ipairs(cache) do
                if e.type == "number" then
                    local n = num(e.value)
                    if n and n >= LO and n <= HI then
                        table.insert(list, e)
                    end
                end
            end
            if #list > 0 then
                applygc(list, "Stamina", VALUE)
            end
        end)
        task.wait(DELAY)
    end
end)

print("on")
