function GetNameFromString(obj)
    return string.lower(string.sub(obj.name, 11))
end

function Is_This_An_Ore(raw_block_data)
    block_name = GetNameFromString(raw_block_data)

if string.find(block_name, "ore") ~= nil then  
    return true
else
    return false
end
end

function Turn_180()
    turtle.turnRight()
    turtle.turnRight()
end

function Check_All_Blocks()
    has_forward_block, forward_block = turtle.inspect()
    has_above_block, above_block = turtle.inspectUp()
    has_below_block, below_block = turtle.inspectDown()

    if has_forward_block then
        forward_block = Is_This_An_Ore(forward_block)
    end
    if has_above_block then
        above_block = Is_This_An_Ore(above_block)
    end
    if has_below_block then
        below_block = Is_This_An_Ore(below_block)
    end

    if forward_block then
        turtle.dig()
    end
    if above_block then
        turtle.digUp()
    end
    if below_block then
        turtle.digDown()
    end
end


function Dig_Move_Check(distance)
    for i = distance, 1, -1
    do
        print(i)
        turtle.dig()
        turtle.forward()
        turtle.turnLeft()
        Check_All_Blocks()
        Turn_180()
        Check_All_Blocks()
        turtle.turnLeft()   
end
end

print("Starting")
Dig_Move_Check(10)
turtle.up()
Turn_180()
Dig_Move_Check(10)
print("Done")

--- main ---
--- Dig Forward
--- Move Forward
--- Turn Left
--- Check Block
--- Dig Forward
--- Check Block in the back
--------- Turn Right x2
--------- Dig Forward
--------- Turn Left
--- main ---































