local basalt = require("/sys/basalt")

local main = basalt.createFrame()
local button = main --> Basalt returns an instance of the object on most methods, to make use of "call-chaining"
        :addButton() --> This is an example of call chaining
        :setPosition(4,4) 
        :setText("AGGIORNA")
        :onClick(
            function() 
                shell.run("/sys/update")
            end)

basalt.autoUpdate()