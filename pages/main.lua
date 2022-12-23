local basalt = require("/sys/basalt")

local w, h = term.getSize()

local main = basalt.createFrame("mainFrame")
local homeFrame = main:addFrame("homeFrame"):setPosition(1,2):setBackground(colors.lightGray):setSize(w, h-1)
local programFrame = main:addFrame("programFrame"):setPosition(1,2):setBackground(colors.lightGray):setSize(w, h-1):hide()
local editorFrame = main:addFrame("editorFrame"):setPosition(1,2):setBackground(colors.lightGray):setSize(w, h-1):hide()

local id = 1
local processes = {}
local function openProgram(path, title, x, y, w, h)
    local pId = id
    id = id + 1
    local f = main:addFrame()
        :setMovable()
        :setSize(w or 30, h or 12)
        :setPosition(x or math.random(2, 12), y or math.random(2, 8))

    f:addLabel()
        :setSize("parent.w", 1)
        :setBackground(colors.black)
        :setForeground(colors.lightGray)
        :setText(title or "New Program")

    f:addProgram()
        :setSize("parent.w", "parent.h - 1")
        :setPosition(1, 2)
        :execute(path or "rom/programs/shell.lua")

    f:addButton()
        :setSize(1, 1)
        :setText("X")
        :setBackground(colors.black)
        :setForeground(colors.red)
        :setPosition("parent.w", 1)
        :onClick(function()
            f:remove()
            processes[pId] = nil
        end)
    processes[pId] = f
    return f
end

local menuBar = main:addMenubar("mainMenuBar"):addItem("HOME"):addItem("PROGRAMMI"):addItem("EDITOR"):setBackground(colors.gray):setSize(w, 1):setSpace(5):setScrollable():show()
menuBar:onChange(function(self)
    homeFrame:hide()
    programFrame:hide()
    editorFrame:hide()
    if(self:getValue().text=="HOME")then
        homeFrame:show() 
    elseif(self:getValue().text=="PROGRAMMI")then
        programFrame:show() 
    elseif(self:getValue().text=="EDITOR")then
        editorFrame:show() 
    end
end)

local function visualButton(btn)
    btn:onClick(function(self) btn:setBackground(colors.black) btn:setForeground(colors.lightGray) end)
    btn:onClickUp(function(self) btn:setBackground(colors.gray) btn:setForeground(colors.black) end)
    btn:onLoseFocus(function(self) btn:setBackground(colors.gray) btn:setForeground(colors.black) end)
end

--Home Frame:
homeFrame:addLabel("titleLabel"):setText("BALDA OS"):setFontSize(2):setPosition(14,2)
visualButton(homeFrame:addButton("updateButton"):setText("AGGIORNA"):setSize(13,3):setPosition(2,8):onClick(function()
    shell.run("./sys/update.lua")
end):show())

--Program Frame:
visualButton(programFrame:addButton("minerButton"):setText("MINER"):setSize(13,3):setPosition(2,2):onClick(function()
    openProgram("./programs/miner.lua")
end):show())
visualButton(programFrame:addButton("testButton"):setText("TEST"):setSize(13,3):setPosition(2,6):onClick(function()
    openProgram("./programs/test.lua")
end):show())
visualButton(programFrame:addButton("edoButton"):setText("edotest"):setSize(13,3):setPosition(2,10):onClick(function()
    shell.run("./programs/edo.lua")
end):show())
visualButton(programFrame:addButton("edo2Button"):setText("endertest"):setSize(13,3):setPosition(16,2):onClick(function()
    openProgram("./programs/enderedo.lua")
end):show())
visualButton(programFrame:addButton("edo3Button"):setText("endertestrisp"):setSize(13,3):setPosition(16,6):onClick(function()
    openProgram("./programs/enderedorisp.lua")
end):show())
visualButton(programFrame:addButton("gameButton"):setText("GAME"):setSize(13,3):setPosition(16,10):onClick(function()
    openProgram("rom/programs/fun/worm.lua")
end):show())

-- Editor Frame:
editorFrame:addProgram():setPosition(2,2):setSize(w-2,h-3):execute("rom/programs/shell.lua"):show()

basalt.autoUpdate()