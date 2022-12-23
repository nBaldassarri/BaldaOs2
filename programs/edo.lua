local modem = peripheral.find("modem") or error("No modem attached", 0)

if modem.isWireless == true then
    print("IL MODEM E WIRELESS")
else
    print("IL MODEM NON e WIRELESS")
end

i = 1
while i <= 50 do
    local channel = i
    if modem.isOpen(channel) == true then 
        modem.close(channel)
    end
    modem.open(i)
    print("CHANNEL" .. i .. "OPENED")
    i = i + 1
end

while true do
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    

    print(("Message received on side %s on channel %d (reply to %d) from %f blocks away with message %s"):format(side, channel, replyChannel, distance, tostring(message)))
    i = i + 1
    modem.transmit(1, 1, "Risposta n" .. tostring(i))
  end
  