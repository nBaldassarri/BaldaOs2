shell.run("rm /sys")
shell.run("rm /startup")

term.clear()
term.setCursorPos(1,1)
print("Sistema Operativo Formattato. Riavvio del PC.")
sleep(3)
shell.run("reboot")