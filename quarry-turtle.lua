--- Quarry Turtle
--- A turtle that digs out an area specified by the user

print("Quarry Turtle")
print("By Beau")
print("-------------")

--- Functions

function showMenu(title, options)
    print(title)
    for i, v in ipairs(options) do
        print(i .. ". " .. v)
    end
    print("0. Exit")
    print("Select an option: ")
    return io.read()
end

function dig(dir)
    if dir == "forward" then
        turtle.dig()
        turtle.forward()
    elseif dir == "up" then
        turtle.digUp()
        turtle.up()
    elseif dir == "down" then
        turtle.digDown()
        turtle.down()
    end
end

function digLine(length, dir)
    for i = 1, length do
        dig(dir)
    end
end

function digSquare(length, width, dir)
    for i = 1, width do
        digLine(length, dir)
        if i ~= width then
            turtle.turnRight()
            dig(dir)
            turtle.turnRight()
        end
    end
end

function digLayer(length, width, dir)
    for i = 1, length do
        digSquare(width, dir)
        if i ~= length then
            turtle.turnRight()
            dig(dir)
            turtle.turnRight()
        end
    end
end

function digArea(length, width, height, dir)
    for i = 1, height do
        digLayer(length, width, dir)
        if i ~= height then
            dig("up")
        end
    end
end

--- Main

local length, width, height, dir

while true do

    --- Check if turtle has fuel
    if turtle.getFuelLevel() == 0 then
        print("Turtle has no fuel")
        exit()
        break
    end



    local option = showMenu("Quarry Turtle", { "16x16x16", "Custom Dimensions", "Exit" })

    if option == "1" then
        length = 16
        width = 16
        height = 16
        dir = "forward"

        digArea(length, width, height, dir)

    elseif option == "2" then

            print("Enter length: ")
            length = io.read()
            print("Enter width: ")
            width = io.read()
            print("Enter height: ")
            height = io.read()
            print("Enter direction (forward, up, down): ")
            dir = io.read()

            digArea(length, width, height, dir)

    elseif option == "0" then
        break
    else
        print("Invalid option")
    end
end
