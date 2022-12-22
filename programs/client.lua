local modem = peripheral.find("modem") or error("No modem attached", 0)

if modem.isOpen(DEFAULT_CHANNEL) == true then
  modem.close(DEFAULT_CHANNEL)
else
  modem.open(DEFAULT_CHANNEL)
  print("CANALE " .. DEFAULT_CHANNEL .." APERTO")
end


modem.transmit(10, 20, "Hello, world!")