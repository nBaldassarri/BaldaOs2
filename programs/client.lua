peripheral.find("modem", rednet.open)
print("INSERISCI IL MESSAGGIO DA INVIARE: ")
msg = read()
rednet.broadcast(os.computerID(), msg)