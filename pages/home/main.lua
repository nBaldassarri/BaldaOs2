local basalt = require("/sys/basalt")

basalt.setVariable("buttonClick", function()
    shell.run("sys/update")
end)
  
local main = basalt.createFrame():addLayout("template.xml")
  

basalt.autoUpdate()