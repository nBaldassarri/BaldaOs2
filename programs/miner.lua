function eat()
    print("eating...")
    for i = 1, 16 do
        turtle.select(i) 
        if turtle.refuel(0) then 
            turtle.refuel(turtle.getItemCount(i))
            return
        end
    end
    print('Fuel not found')
end

eat()

i = 0
while i < 10 do 
    turtle.digDown()
    turtle.down()
    i = i+1
end 