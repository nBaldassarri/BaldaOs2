local modem = peripheral.find("modem") or error("No modem attached", 0)

if modem.isOpen(1) == true then
  modem.transmit(1,1,"PRIMO MESSAGGIO INVIATO")
  i = 1
  while true do
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    print(("MESSAGGIO RICEVUTO %s on channel %d (reply to %d) from %f blocks away with message %s"):format(side, channel, replyChannel, distance, tostring(message)))
    i = i + 1
    modem.transmit(1,1,"messaggio n" .. tostring(int))
  end
else
  print("NON RIESCO A FARE UN CAZZO")
end
  

