local basalt = require("basalt")

local main = basalt.createFrame()
local button = main --> Basalt returns an instance of the object on most methods, to make use of "call-chaining"
        :addButton() --> This is an example of call chaining
        :setPosition(4,4) 
        :setText("FORMATTA IL PC")
        :onClick(
            function() 
                shell.run("sys/format")
            end)

basalt.autoUpdate()