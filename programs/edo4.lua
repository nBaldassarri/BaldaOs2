i = 0
for i = 1, 16 do
    turtle.select(i) 
    local data = turtle.getItemDetail()

    if data then
        print("Item name: ", data.name)
        print("Item damage value: ", data.damage)
        print("Item count: ", data.count)
        if data.name == "minecraft:diamond_pickaxe" then
        turtle.equipLeft()
        end
    end
    return
end

