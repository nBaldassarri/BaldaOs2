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


