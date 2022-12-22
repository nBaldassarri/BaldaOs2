local modem = peripheral.find("modem") or error("No modem attached", 0)

if modem.isOpen(1) == true then
  print("IL CANALE 1 E APERTO")
  modem.close(1)
  print("CHIUSURA CANALE 1 IN CORSO")
  if modem.isOpen(1) == false then
      print("CANALE 1 CHIUSO")
      print("RIAPERTURA CANALE 1 IN CORSO")
      modem.open(1)
      if modem.isOpen(1) == true then
          print("CANALE 1 RIAPERTO")
      else
          print("RIAPERTURA CANALE 1 NON RIUSCITA")
      end 
  else
      print("ce qualcosa che non va")
  end
else
  modem.open(1)
  if modem.isOpen(1) == true then 
  print("CANALE 1 APERTO PER LA 1 VOLTA")
  end
end

if modem.isOpen(1) == true then
  modem.transmit(1,1,"PRIMO MESSAGGIO INVIATO")
  i = 1
  modem.transmit(1,1,"QUESTO E IL MESSAGGIO DI PARTENZA")
  while true do
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    print(("MESSAGGIO RICEVUTO %s on channel %d (reply to %d) from %f blocks away with message %s"):format(side, channel, replyChannel, distance, tostring(message)))
    i = i + 1
    modem.transmit(1,1,"messaggio n" .. tostring(int))
  end
else
  print("NON RIESCO A FARE UN CAZZO")
end
  

