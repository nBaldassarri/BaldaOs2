local modem = peripheral.find("modem") or error("No modem attached", 0)
local dfpwm = require("cc.audio.dfpwm")
local decoder = dfpwm.make_decoder()
local speaker = peripheral.find("speaker")

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
    if message == "suono" then
        for chunk in io.lines("programs/sounds/requestedproduction.dfpwm", 16 * 1024 * 2) do
            local buffer = decoder(chunk)

            while not speaker.playAudio(buffer) do
                os.pullEvent("speaker_audio_empty")
            end
        end
        modem.transmit(channel, channel , "Ho risposto")


    end
  end
  