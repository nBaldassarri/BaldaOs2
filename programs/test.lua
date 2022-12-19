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

local endTurtle = peripheral.wrap("right")

endTurtle.savePoint("test")
turtle.forward()
turtle.forward()
turtle.forward()
-- turtle.select(2) 
endTurtle.digBlock()
endTurtle.warpToPoint("test")