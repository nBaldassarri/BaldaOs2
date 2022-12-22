peripheral.find("modem", rednet.open)

msg = read()
rednet.broadcast(msg)