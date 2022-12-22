peripheral.find("modem", rednet.open)
while true do
    id, msg, pro = rednet.receive()
    print("Computer ID: " .. id)
    print(msg)
    print("---------------------")
end