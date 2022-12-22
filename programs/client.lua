local modem = peripheral.find("modem") or error("No modem attached", 0)
modem.transmit(10, 20, "Hello, world!")