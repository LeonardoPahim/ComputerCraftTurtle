local server_id = 2
rednet.open('left')
rednet.send(server_id, "Done")
rednet.close()