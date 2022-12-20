local modem = peripheral.find("modem") or error("chiama caste va........", 0)
nome = "--"
print(nome)
print("Ora il vero nome")
nome = isWireless()
print(nome-)
modem.open(1)
controllo = 0
controllo = isOpen(1)	
if controllo == 0 then
    print("Channel Chiuso")
end
elseif controllo == 1 then
    print("Channel Aperto")
modem.transmit(1, 1, "Corvo chiama Roger Rispondete Roger")
end

local event, side, channel, replyChannel, message, distance
repeat
  event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
until channel == 1

print("Ricevuto Corvo" .. tostring(message))
