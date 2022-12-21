local modem = peripheral.find("modem") or error("No modem attached", 0)

statoChannel = modem.isOpen(1)
if statoChannel == true then
    print("CHANNEL APERTO")
    local event, side, channel, replyChannel, message, distance
    repeat
      event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
      print(("Messaggio Ricevuto questa è la risposta che ha scritto edo"):format(side, channel, replyChannel, distance, tostring(message)))
    until channel == 1
else
    print("CHANNEL CHIUSO")
end




