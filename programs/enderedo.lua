local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")

local decoder = dfpwm.make_decoder()
for chunk in io.lines("programs/sounds/requestedproduction.dfpwm", 16 * 1024 * 2) do
    local buffer = decoder(chunk)

    while not speaker.playAudio(buffer) do
        os.pullEvent("speaker_audio_empty")
    end
end

local modem = peripheral.find("modem") or error("No modem attached", 0)

if modem.isWireless == true then
    print("IL MODEM E WIRELESS")
else
    print("IL MODEM NON e WIRELESS")
end

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
i = 1
while true do
    local event, channel, replyChannel, message = os.pullEvent("modem_message")
    print(("Message received on side %s on channel %d (reply to %d) from %f blocks away with message %s"):format(side, channel, replyChannel, distance, tostring(message)))
    i = i + 1
    modem.transmit(1,1,"Risposta n" .. tostring(int))
  end
