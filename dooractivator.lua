while true do
  local h = fs.open("disk/read", "r")
  input = h.readLine()
  print(input)
  if input == "on" then
    redstone.setOutput("right", true)
  else
    redstone.setOutput("right", false)
  end
  sleep(1)
end