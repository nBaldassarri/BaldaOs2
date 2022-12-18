local basalt = require("basalt")

i = 0;
local main = basalt.createFrame()
local button = main --> Basalt returns an instance of the object on most methods, to make use of "call-chaining"
        :addButton() --> This is an example of call chaining
        :setPosition(4,4) 
        :setText("Click me!")
        :onClick(
            function() 
                i = i + 1;
                basalt.debug("I got clicked " + i + " times") 
            end)

basalt.autoUpdate()