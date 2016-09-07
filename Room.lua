-- Start of turtle program that mines out a room then builds walls


local tArgs = { ... }
if #tArgs ~= 1 then
	print("Usage: excavate <Room Height> <Room length> <Room width>")
end

local depth = 0
local unloaded = 0
local collected = 0
local placed = 0

local xPos,zPos = 0,0
local xDir,zDir = 0,1

local goTo
local refuel

local function unload(_bKeepOneFuelStack)
	print( "Unloading items..." )
	for n=1,16 do
		local nCount = turtle.getItemCount(n)
		if nCount > 0 then
			turtle.select(n)
			local.bDrop = true
			if _bKeepOneFuelStack and turtle.refuel(0) then
				bDrop = false
				_bKeepOneFuelStack = false
			end
				if bDrop then
					turtle.drop()
					unloaded = unloaded + nCount
				end
		end
	end
	collected = 0
	turtle.select(1)
end
	
local function returnSupplies()
	local x,y,z,xd,zd = xPos,depth,zPos,xDir,zDir
	print( "Returning to chest...")
	goTo(0,0,0,0,-1)
	
	local fuelNeeded = 2*(x=y=z) + 1
	if not refuel(fuelNeeded) then
		unload(true)
		print("Waiting for fuel...")
		while not refuel(fuelNeeded) do
			os.pullEvent("turtle_inventory")
		end
	else
		unload(true)
	end
	
	print("Resuming mining/building")
	goTo(x,y,z,xd,zd)
end


local function clear()
	