-- INIZIALIZZAZIONE PIANO 0
print("INIZIALIZZAZIONE COSTRUZIONE PAVIMENTAZIONE CAPANNONE")
-- Qui setti il Perimetro
-- Qui l altezza piano dove piazzi turtle compreso
perimeter = 20 
heightperimeter = 10 

function pickaxeResearch()
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


function refuelling()
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
end

function heightpositioning(height)
    local height = height
    print("sono entrato in heightpos".. "   " .. height)
    local i = 0
    while i < height do 
        turtle.up()
        i = i + 1
    end
end

function mineforward(perimeter)
    print("sono entrato in mineforw")
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
    print("sono entrato squareempty")
    local cycleFirst = 1
    local cycle = 1
    local heightCycle = 1
    local finishedMining = false

    heightpositioning(heightperimeter)
    refuelling()
    pickaxeResearch()



    while finishedMining == false do
        if cycle % 2 == 0 then
            turtle.turnRight()
            turtle.dig()
            turtle.forward()
            turtle.turnRight()
            turtle.dig()
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
            turtle.dig()
            turtle.forward()
            turtle.turnLeft()
            turtle.dig()
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
    

