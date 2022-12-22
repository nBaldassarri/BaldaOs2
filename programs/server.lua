local modem = peripheral.find("modem") or error("No modem attached", 0)


if modem.isOpen(1) == true then
    modem.close(1)
else
    modem.open(1)
    print("CANALE 1 APERTO")
end


while true do
    event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    print("Received a reply: " .. tostring(message))
  end
