local modem = peripheral.find("modem") or error("No modem attached", 0)
local DEFAULT_CHANNEL = 20

if modem.isOpen(DEFAULT_CHANNEL) == true then
  modem.close(DEFAULT_CHANNEL)
else
  modem.open(DEFAULT_CHANNEL)
  print("CANALE " .. DEFAULT_CHANNEL .." APERTO")
end


modem.transmit(10, DEFAULT_CHANNEL, "Hello, world!")