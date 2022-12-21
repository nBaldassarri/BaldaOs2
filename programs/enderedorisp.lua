peripheral.find("modem", rednet.open)
nomepc = rednet.computerID()
print("questo e id pc NNM")
print(nomepc)

labelpc = rednet.getComputerLabel()
print("questo e label pc NNM")
print(labelpc)

rednet.setComputerLabel(BESTIADISATANA)
print("questo e label pc MODIFIED")
print(labelpc)

print("questo e id pc MODIFIED")
print(nomepc)


