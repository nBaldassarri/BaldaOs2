local modem = peripheral.find("modem") or error("No modem attached", 0)
modem.transmit(0, 0, "Hello, world!")