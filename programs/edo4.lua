i = 0
for i = 1, 16 do
    turtle.select(i) 
    local data = turtle.getItemDetail()
    if data ~= nil then
        local item = data.name
        if item == "minecraft:diamond_pickaxe" then
            turtle.equipLeft()
        end
    end
return
end

