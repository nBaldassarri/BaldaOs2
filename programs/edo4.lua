i = 0
for i = 1, 16 do
    turtle.select(i) 
    local data = turtle.getItemDetail()
    if data.name == "minecraft:diamond_pickaxe" then
        turtle.equipLeft()
      end
      return
    end
end

