local basalt = require("/sys/basalt")

local w, h = term.getSize()

local main = basalt.createFrame("mainFrame")
local homeFrame = main:addFrame("homeFrame"):setPosition(1,2):setBackground(colors.lightGray):setSize(w, h-1)
local programFrame = main:addFrame("programFrame"):setPosition(1,2):setBackground(colors.lightGray):setSize(w, h-1):hide()
local editorFrame = main:addFrame("editorFrame"):setPosition(1,2):setBackground(colors.lightGray):setSize(w, h-1):hide()

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
homeFrame:addLabel("titleLabel"):setText("BALDA OS"):setFontSize(2):setPosition(14,1)
visualButton(homeFrame:addButton("updateButton"):setText("AGGIORNA"):setSize(13,3):setPosition(2,6):onClick(function()
    shell.run("./sys/update.lua")
end):show())

--Program Frame:

-- Editor Frame:
editorFrame:addTextfield("exampleTextfield"):setPosition(2,2):setBackground(colors.black):setSize(w-2,h-3):setForeground(colors.white):show()

basalt.autoUpdate()