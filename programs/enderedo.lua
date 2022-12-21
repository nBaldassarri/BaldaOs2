local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")

local decoder = dfpwm.make_decoder()
for chunk in io.lines("programs/sounds/requestedproduction.dfpwm", 16 * 1024 * 2) do
    local buffer = decoder(chunk)

    while not speaker.playAudio(buffer) do
        os.pullEvent("speaker_audio_empty")
    end
end


peripheral.find("modem", rednet.open)
if rednet.isOpen == true then
    print("CASTE LICENZIATO")
else
    print("CHIAMA CASTE")
end
rednet.host(protosciutto, faro)
rednet.send(BESTIADISATANA, "DIOCANE PORCO DIO" , protosciutto)














/*
local modem = peripheral.find("modem") or error("No modem attached", 0)

for chunk in io.lines("programs/sounds/finishedproduction.dfpwm", 16 * 1024) do
    local buffer = decoder(chunk)

    while not speaker.playAudio(buffer) do
        os.pullEvent("speaker_audio_empty")
    end
end

print("funziona?")

nome = "--"
print(nome)
print("Apertura Channel")
modem.open(1)
statoChannel = modem.isOpen(1)
if statoChannel == true then
    print("CHANNEL APERTO")
    modem.transmit(1, 1, "Corvo chiama Roger Rispondete Roger")
    print("Messaggio Trasmesso")
    local event, side, channel, replyChannel, message, distance
    repeat
      event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 1
else
    print("CHANNEL CHIUSO")
end


