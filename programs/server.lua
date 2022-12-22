local modem = peripheral.find("modem") or error("No modem attached", 0)


if modem.isOpen(0) == true then
    modem.close(0)
else
    modem.open(0)
    print("CANALE 0 APERTO")
end

-- And wait for a reply
local event, side, channel, replyChannel, message, distance
repeat
    event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
until channel == 0

print("Received a reply: " .. tostring(message))
