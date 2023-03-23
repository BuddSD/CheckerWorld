local imgList = table.load("imgList.txt") or {}

local function genImages()
	local GGfile = require "GGFile"
	local fileManager = GGFile:new()

	local 1927GFiles = { "galleries/Models/G/1 - 1927 Checker G4 NYC Taxi.jpg",
		"galleries/Models/G/2 - 1927 Checker G Taxi.jpg",
		"galleries/Models/G/3 - 1927 Checker G6 Flyer 2",
		"galleries/Models/G/4 - 1927 Checker G Cab.jpg",
		"galleries/Models/G/5 - 1927 Checker G Taxi.jpg",
		"galleries/Models/G/6 - 1927 Checker G Taxi.jpg"
	}

	for i = 1, _G.numImages do
		local newName = math.getUID(12) .. ".jpg"
		local imgNum = math.random(#1927GFiles)
		local oldName = 1927GFiles[imgNum]

		fileManager:copyBinary( oldName, system.ResourceDirectory, newName, system.TemporaryDirectory )
		imgList[#imgList + 1] = { imgNum, newName }
	end
	table.save( imgList, "imgList.txt" )
end

if ( #imgList < _G.numImages ) then
	print("Generating images...")
	genImages()
end