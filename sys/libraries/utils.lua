return {
    refuelling = function()
        print("sono entrato in refuel")
        print("REFUELLING")
        for i = 1, 16 do
            turtle.select(i) 
            if turtle.refuel(0) then 
                turtle.refuel(turtle.getItemCount(i))
                return
            end
        end
        print('Fuel not found')
    end,

    pickaxeResearch = function()
        local i = 0
        for i = 1, 16 do
            turtle.select(i) 
            local data = turtle.getItemDetail()
            if data then
                print("Item name: ", data.name)
                print("Item damage value: ", data.damage)
                print("Item count: ", data.count)
                if data.name == "minecraft:diamond_pickaxe" then
                    turtle.equipLeft()
                    return
                end
            end
        end
    end
}