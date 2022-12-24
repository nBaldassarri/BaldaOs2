-- INIZIALIZZAZIONE PIANO 0
print("INIZIALIZZAZIONE COSTRUZIONE PAVIMENTAZIONE CAPANNONE")
-- Qui setti il Perimetro
-- Qui l altezza piano dove piazzi turtle compreso
perimeter = 20 
height = 10 

function refuelling()
    print("REFUELLING")
    for i = 1, 16 do
        turtle.select(i) 
        if turtle.refuel(0) then 
            turtle.refuel(turtle.getItemCount(i))
            return
        end
    end
    print('Fuel not found')
end

function heightpositioning(height)
    turtleDirection = "turtle"
    local i = 0
    while i < height do 
        turtle.up()
        i = i + 1
    end
end

function mineforward(perimeter)
    local count = 0 
    local side = false
    while side == false do
        turtle.dig()
        turtle.forward()
        count = count + 1
        if count == perimeter-1 then
            side = true
        end
    end
end


function squareMiningEmpty(perimeter)
    local cycleFirst = 1
    local cycle = 1
    local heightCycle = 1
    local finishedMining = false

    heightpositioning(height)
    refuelling()

    for i = 1, 16 do
        if turtle.getItemDetail(i) == "minecraft:diamond_pickaxe" then
            turtle.equipLeft()
            return
        end
    end



    while finishedMining == false do
        if cycle % 2 == 0 then
            turtle.turnRight()
            turtle.forward()
            turtle.turnRight()
            mineforward(perimeter)
            cycle = cycle + 1
        elseif cycle % 2 ~= 0 then
            if cycleFirst == 1 then
                turtle.turnLeft()
                mineforward(perimeter)
                cycle = cycle + 1
                cycleFirst = 0
            else
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
            mineforward(perimeter)
            cycle = cycle + 1
            end
        end
        if heightCycle == 20 then
            finishedMining = true
            break
        end
        if cycle == perimeter then
            if finishedMining == true then
                break
            else
            turtle.digDown()
            turtle.down()
            heightCycle = heightCycle + 1
            turtle.turnLeft()
            turtle.turnLeft()
            mineforward(perimeter)
            cycle = 2
            end
        end
    end
end

squareMiningEmpty(perimeter)
    

