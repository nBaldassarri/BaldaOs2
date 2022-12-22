peripheral.find("modem", rednet.open)
print("MODEM APERTO")

while true do
    id, msg, pro = rednet.receive()
    print("Computer ID: " .. id)
    print(msg)
    print("---------------------")
end