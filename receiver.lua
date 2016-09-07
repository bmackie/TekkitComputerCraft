rednet.open("back")
while true do
local senderId, message, protocol = rednet.receive()
print(message)
local h = fs.open("disk/read", fs.exists("disk/read") and "w")
h.writeLine(message)
h.close()
end