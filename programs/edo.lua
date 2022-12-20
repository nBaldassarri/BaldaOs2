local dfpwm = require("cc.audio.dfpwm")

local encoder = dfpwm.make_encoder()
local decoder = dfpwm.make_decoder()

local out = fs.open("requestedproduction.dfpwm", "wb")
for input in io.lines("programs/sounds/requestedproduction.dfpwm", 16 * 1024 * 2) do
  local decoded = decoder(input)
  local output = {}

  -- Read two samples at once and take the average.
  for i = 1, #decoded, 2 do
    local value_1, value_2 = decoded[i], decoded[i + 1]
    output[(i + 1) / 2] = (value_1 + value_2) / 2
  end

  out.write(encoder(output))

  sleep(0) -- This program takes a while to run, so we need to make sure we yield.
end
out.close()