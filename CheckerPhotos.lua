-----------------------------------------------------------------------------------------
--
-- CheckerPhotos.lua
--
-----------------------------------------------------------------------------------------
local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()
local onScreen = require "onScreen"
local imgList = table.load("imgList.txt") or {}

print(numImages)
if( #imgList >= _G.numImages ) then 
	local y = 0
	for i = 1, _G.numImages do 
		local curImage = imgList[i]
		local pic
		if( curImage[1] == 1) then
			pic = display.newRect( picsGroup, centerX, y, 1024/6, 1024/6 )
			pic.anchorY = 0
			y = y + 1024/6 + 5
		else
			pic = display.newRect( picsGroup, centerX, y, 1024/6, 768/6)
			pic.anchorY = 0
			y = y + 768/6 + 5
		end
		onScreen.frameFiller( pic, curImage[2], "img/fillW.png", nil, system.TemporaryDirectory, system.ResourceDirectory )
	end
	print(imgList[i])
else
	print("You did not initialize correctly.")
	print("Set _G.numImages to 1000 the first time you run this project")
end

function scene:create( event )
	local sceneGroup = self.view
	local picsGroup = display.newGroup()

	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)
	picsGroup:insert(background)
	
	-- create a black background to fill screen
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	picsGroup:insert(logo)
	
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFontBold, 20 )
	title:setFillColor( 244,233, 0)	-- yellow
	picsGroup:insert(title)
	
	local header = display.newText( "CHECKER PHOTOS", display.contentCenterX, title.y+75, native.systemFont, 20 )
	header:setFillColor( 244,233,0,1)	-- yellow
	picsGroup:insert(header)

	sceneGroup:insert(picsGroup)
end
function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
        local tabBar = composer.getVariable("savedTabBar")
        tabBar.isVisible = true
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	--
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene	