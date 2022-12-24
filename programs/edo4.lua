i = 0
for i = 1, 16 do
    if turtle.getItemDetail(i) == "minecraft:diamond_pickaxe" then
        turtle.equipLeft()
        return
    end
end