local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")
local decoder = dfpwm.make_decoder()

for chunk in io.lines("programs/sounds/requestedproduction.dfpwm", 16 * 1024) do
    local buffer = decoder(chunk)

    while not speaker.playAudio(buffer) do
        os.pullEvent("speaker_audio_empty")
    end
end



local modem = peripheral.find("modem") or error("No modem attached", 0)

for chunk in io.lines("programs/sounds/finischedproduction.dfpwm", 16 * 1024) do
    local buffer = decoder(chunk)

    while not speaker.playAudio(buffer) do
        os.pullEvent("speaker_audio_empty")
    end
end

print("funziona?")

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