local modem = peripheral.find("modem") or error("No modem attached", 0)
local DEFAULT_CHANNEL = 20

if modem.isOpen(DEFAULT_CHANNEL) == true then
    modem.close(DEFAULT_CHANNEL)
else
    modem.open(DEFAULT_CHANNEL)
    print("CANALE " .. DEFAULT_CHANNEL .." APERTO")
end

modem.transmit(10, 20, "Hello, world!")

-- And wait for a reply
local event, side, channel, replyChannel, message, distance
repeat
    event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
until channel == DEFAULT_CHANNEL

print("Received a reply: " .. tostring(message))
