local basalt = require("/sys/basalt")

basalt.setVariable("buttonClick", function()
    shell.run("sys/update")
end)
  
local main = basalt.createFrame():addLayout("example.xml")
  

basalt.autoUpdate()