local tArgs = { ... }
if #tArgs ~= 1 then
  print( "Usage: Client <Text>" )
end
rednet.open("back")
rednet.send(8, tArgs[1])