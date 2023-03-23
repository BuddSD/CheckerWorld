-----------------------------------------------------------------------------------------
--
-- CheckerContacts.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local ContactGroup = display.newGroup()

	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight+75 )
	background:setFillColor(0,0,0)
	ContactGroup:insert(background)
	
	-- create a black background to fill screen
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	ContactGroup:insert(logo)
	
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFont, 22 )
	title:setFillColor( .96,.91,.04 )	-- yellow
	ContactGroup:insert(title)

	local header = display.newText( "CONTACT US", display.contentCenterX, title.y+75, native.systemFont, 20 )
	ContactGroup:insert(header)

	local scrollContactView = widget.newScrollView({
		top = 40,
		left = 10,
		width = display.contentWidth-20,
		height = display.contentHeight,
		scrollWidth = display.contentWidth,
		backgroundColor = { 0,0,0 },
		scrollHeight = 1,
		listener = scrollListener
	})
	ContactGroup:insert(scrollContactView)

	-- Documents intro text
	local intro = display.newText("Please click the officers name or title below to be put in contact with these individuals. Mention the name of the person you want to reach in the note. ", display.contentCenterX, header.y+250, display.contentWidth-35,display.contentHeight,native.systemFont, 18 )
	intro:setFillColor(1,1,1,1)
	scrollContactView:insert(intro)
	ContactGroup:insert(intro)
	-- END intro
	local president = display.newText("President: \nPaul Worth\npresident@checkercarclub.org\n\n",display.contentCenterX-25, intro.y-30, native.systemFont, 18)
	ContactGroup:insert(president)

	local vp = display.newText("Vice President: \nOpen\n\n",75, president.y+75, native.systemFont, 18)
	ContactGroup:insert(vp)

	local secEditor = display.newText("Secretary & Journal Editor: \nJohn Weinhoeft\nsecretary@checkercarclub.org\n\n",display.contentCenterX-25, vp.y+75, native.systemFont, 18)
	ContactGroup:insert(secEditor)

	local treasurer = display.newText("Treasurer: \nAnthony (Tony) Mattern\ntreasurer@checkercarclub.org\n\n",display.contentCenterX-25, secEditor.y+75, native.systemFont, 18)
	ContactGroup:insert(treasurer)

	local memberChairs = display.newText("Membership Co-Chairs: \nBecky Carlson & Anthony Mattern\nmembership@checkercarclub.org\n\n",display.contentCenterX-10, treasurer.y+75, native.systemFont, 18)
	ContactGroup:insert(memberChairs)

	local directors = display.newText("Directors:\nEd Ball\nBecky Carlson\nBrad Lohsen\nPhillip Arnold\nEdward Fox\n\n",75, memberChairs.y+110, native.systemFont, 18)
	ContactGroup:insert(directors)

	local webmaster = display.newText("Webmaster: \nOpen Office (Are you interested?)\nwebmaster@checkercarclub.org\n\n",display.contentCenterX-10, directors.y+110, native.systemFont, 18)
	ContactGroup:insert(webmaster)
	local prevPres = display.newText("Previous President: \nGary Lohsen\n\n",display.contentCenterX-60, webmaster.y+75, native.systemFont, 18)
	ContactGroup:insert(prevPres)

	local convChair = display.newText("Convention Chair: \nJames P Garrison",display.contentCenterX-65, prevPres.y+50, native.systemFont, 18)
	ContactGroup:insert(convChair)

	scrollContactView:insert(president)
	scrollContactView:insert(vp)
	scrollContactView:insert(secEditor)
	scrollContactView:insert(treasurer)
	scrollContactView:insert(memberChairs)
	scrollContactView:insert(directors)
	scrollContactView:insert(webmaster)
	scrollContactView:insert(prevPres)
	scrollContactView:insert(convChair)

	sceneGroup:insert(ContactGroup)
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