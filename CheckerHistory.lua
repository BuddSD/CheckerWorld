-----------------------------------------------------------------------------------------
--
-- CheckerHistory.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY+display.contentHeight, display.contentWidth, display.contentHeight)
	background:setFillColor(0,0,0)
	
	-- create a black background to fill screen
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFont, 22 )
	title:setFillColor( .96,.91,.04 )	-- yellow

	local header = display.newText( "CHECKER HISTORY", display.contentCenterX, title.y+75, native.systemFont, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow

	local scrollDocsView = widget.newScrollView({
		top = 40,
		left = 10,
		width = display.contentWidth-20,
		height = display.contentHeight,
		scrollWidth = display.contentWidth,
		scrollHeight = 1,
		backgroundColor = {0,0,0},
		horizontalScrollDisabled = true,
		listener = scrollListener
	})

	-- Documents intro text
	local intro = display.newText("Welcome to the Checker World History page, the place for special exhibits about Checker taxis, cars and specialty vehicles produced between 1921 and 1982. You will also get access to our permanent collection and former special exhibits here.We are open 24x7 to all interested parties around the world. Admission is free!", display.contentCenterX, header.y+250, display.contentWidth-20,display.contentHeight,native.systemFont, 18 )
	intro:setFillColor(1,1,1,1)
	-- END intro
	-- Insert elements to be located in ScrollDocsView
	scrollDocsView:insert( intro)
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