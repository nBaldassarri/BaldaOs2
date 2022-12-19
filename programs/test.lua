local bridge = peripheral.find("rsBridge") -- Finds the peripheral if one is connected

if bridge == nil then error("rsBridge not found") end

bridge.exportItem({
    name = "minecraft:stone",
    count = 32
}, "LEFT")
-- Exports an protection I book to the chest above the me bridge.