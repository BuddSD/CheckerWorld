-----------------------------------------------------------------------------------------
--
-- CheckerMarket.lua
--
-----------------------------------------------------------------------------------------
local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)
	
	-- create a black background to fill screen
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFont, 22 )
	title:setFillColor( 2.96,.91,.04 )	-- yellow
	
	local header = display.newText( "CHECKER CLUB NEWS", display.contentCenterX, title.y+75, native.systemFontBold, 20 )

	local scrollNewsView = widget.newScrollView({
		top = 40,
		left = 0,
		width = display.contentWidth,
		height = display.contentHeight,
		scrollWidth = display.contentWidth,
		scrollHeight = 10,
		backgroundColor = { 0,0,0 },
		horizontalScrollDisabled = true,
		listener = scrollListener
	})

	-- BEGIN post
	local postDate = display.newText( 
		"2022 February 3",
		80,
		header.y+25,
		native.systemFont,
		18
	)
	local postOptions = { 
		text = "Check out https://www.facebook.com/groups/checkerworld for current news. \n\nWe are unpaid volunteers who have other commitments, we have limited time to work on projects. If you would like to help, email webmaster@checkercarclub.org and let us know. We can always use and extra hand...\n\nChecker owners are not alone.", 
		x = display.contentCenterX, 
		y = postDate.y+150, 
		width = display.contentWidth-30,
		font = native.systemFont, 
		fontSize = 18,
		align = "left"
	}
	local postText = display.newText(postOptions)
	postText:setFillColor( 1,1,1 )
	local divider = display.newRect(display.contentCenterX,postText.y+150 ,display.contentWidth-50,2)
	divider:setFillColor( 1,1,1 )
	-- END
	-- BEGIN post
	local postDate2 = display.newText( 
		"2019 February 19",
		85,
		divider.y+25,
		native.systemFont,
		18
	)
	local postOptions2 = { 
		text = "How are we doing?\n\nAt CCCoA, we are always seeking new ways to provide value to our members. We are currently considering potential new links, and we would love your feedback on if this would be valuable to you.\n\nPlease give us nine minutes or less of your time to tell us what you think. We’ll use the real-world perspective of members like you to determine whether or not we should offer this new site information. If we do move forward, your feedback today will also help us tailor it to meet your needs.\n\nThank you so much for your time and consideration!\n\nA Checker Is Never Alone!. See you at the next convention.", 
		x = display.contentCenterX, 
		y = postDate2.y+250, 
		width = display.contentWidth-30,
		font = native.systemFont, 
		fontSize = 18,
		align = "left"
	}
	local postText2 = display.newText(postOptions2)
	postText2:setFillColor( 1,1,1 )
	local divider2 = display.newRect(display.contentCenterX,postText2.y+250,display.contentWidth-50,2)
	divider2:setFillColor( 1,1,1 )
	-- END
	-- BEGIN post
	local postDate3 = display.newText( 
		"2019 February 19",
		85,
		divider2.y+25,
		native.systemFont,
		18
	)
	local postOptions3 = { 
		text = "Due to George Laszlo illness and passing we have been unable to update many of the sections of this website. If you are visiting and want more information please send an email to membership@checkercarclub.org. Include the following:\n\nName\nEmail address\nQuestion that you would like answered", 
		x = display.contentCenterX, 
		y = postDate3.y+150, 
		width = display.contentWidth-30,
		font = native.systemFont, 
		fontSize = 18,
		align = "left"
	}
	local postText3 = display.newText(postOptions3)
	postText3:setFillColor( 1,1,1 )
	local divider3 = display.newRect(display.contentCenterX,postText3.y+150,display.contentWidth-50,2)
	divider3:setFillColor( 1,1,1 )
	-- END
	scrollNewsView:insert(postDate)
	scrollNewsView:insert(postDate2)
	scrollNewsView:insert(postDate3)
	scrollNewsView:insert(postText)
	scrollNewsView:insert(postText2)
	scrollNewsView:insert(postText3)
	scrollNewsView:insert(divider)
	scrollNewsView:insert(divider2)
	scrollNewsView:insert(divider3)
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