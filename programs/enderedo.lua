local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")

local decoder = dfpwm.make_decoder()
for chunk in io.lines("programs/sounds/requestedproduction.dfpwm", 16 * 1024 * 2) do
    local buffer = decoder(chunk)

    while not speaker.playAudio(buffer) do
        os.pullEvent("speaker_audio_empty")
    end
end

rednet.open("left")
peripheral.find("modem", rednet.open)
if rednet.isOpen == true then
    print("CASTE LICENZIATO")
else
    print("CHIAMA CASTE")
end
rednet.host("protosciutto", "faro")
rednet.send("BESTIADISATANA", "DIOCANE PORCO DIO" , protosciutto)


