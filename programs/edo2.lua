local modem = peripheral.find("modem") or error("No modem attached", 0)

modem.transmit(45, 45 , "suono")