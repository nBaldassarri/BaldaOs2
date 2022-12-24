i = 0
for i = 1, 16 do
    turtle.select(i) 
    local data = turtle.getItemDetail()
    print("doppo turt select")
    if data then
        print("sono entrato in data if")
        print("Item name: ", data.name)
        print("Item damage value: ", data.damage)
        print("Item count: ", data.count)
        if data.name == "minecraft:diamond_pickaxe" then
            print("sono primA DI EQUIP")
            turtle.equipLeft()
            return
        end
    end
end

