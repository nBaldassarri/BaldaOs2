peripheral.find("modem", rednet.open)
nomepc = os.computerID()
print("questo e id pc NNM")
print(nomepc)

labelpc = os.getComputerLabel()
print("questo e label pc NNM")
print(labelpc)

os.setComputerLabel("BESTIADISATANA")
print("questo e label pc MODIFIED")
print(labelpc)

print("questo e id pc MODIFIED")
print(nomepc)

while true then
  local id, message = rednet.receive(nil, )
  if not id then
      printError("No message received")
  else
      print(("Computer %d sent message %s"):format(id, message))
  end
end


