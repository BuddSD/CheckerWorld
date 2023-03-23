-----------------------------------------------------------------------------------------
--
-- CheckerMedia.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local MediaGroup = display.newGroup()

	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight+60 )
	background:setFillColor(0,0,0)
	MediaGroup:insert(background)
	
	-- create a black background to fill screen
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	MediaGroup:insert(logo)

	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFontBold, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow
	MediaGroup:insert(title)

	local header = display.newText( "CHECKERS IN MOVIES, \n TV SHOWS, & VIDEOS", display.contentCenterX, title.y+75, native.systemFont, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow
	MediaGroup:insert(header)

	local scrollMediaView = widget.newScrollView({
		top = 40,
		left = 10,
		width = display.contentWidth-20,
		height = display.contentHeight,
		scrollWidth = display.contentWidth,
		backgroundColor = { 0,0,0 },
		scrollHeight = 10,
		horizontalScrollDisabled = true,
		listener = scrollListener
	})
	MediaGroup:insert(scrollMediaView)

	-- Documents intro text
	local intro = display.newText("Checker Cars and Taxis have been used in Movies and TV Shows since 1922. Nearly every model(from H to A-11) has shown up in nearly 1000 productions in the past 94 years. With the advent of the internet, numerous videos featuring Checkers can be found on sites like YouTube and Vimeo. Using data gathered from the web sites imdb.com and icmdb.com we list her the most important subset of the ever-growing film and videogrphy of Checker Cars.", display.contentCenterX, header.y+250, display.contentWidth-15,display.contentHeight,native.systemFont, 18 )
	intro:setFillColor(1,1,1,1)
	MediaGroup:insert(intro)
	scrollMediaView:insert(intro)
	-- END intro

	-- media buttons for the Checkers

	-- BEGIN Early Model Checkers Btn
	local cLogo1 = display.newImageRect("img/CheckerLogo.png",250,75)
	MediaGroup:insert(cLogo1)

	local emBorder = display.newRect(display.contentCenterX-10,intro.y+125, display.contentWidth-40,100,14 )
	cLogo1.x = display.contentCenterX-10
	cLogo1.y = intro.y+125
	emBorder.x = display.contentCenterX-10
	emBorder.y = intro.y+125
	emBorder.strokeWidth = 2
	emBorder:setFillColor(0,0,0,.6)
	emBorder:setStrokeColor(.96,.91,.04)
	MediaGroup:insert(emBorder)

	local emBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 100,
		label = "Early Model Checkers",
		labelColor = {default={255,255,255}, over={255,255,255}},
		fontSize = 24,
		onEvent = handleEmBtnEvent
	})
	emBtn.x = display.contentCenterX-10
	emBtn.y = intro.y+125
	MediaGroup:insert(emBtn)
	
	scrollMediaView:insert(cLogo1)
	scrollMediaView:insert(emBorder)
	scrollMediaView:insert(emBtn)
	-- END
	-- BEGIN Late Model Checkers Btn
	local cLogo2 = display.newImageRect("img/CheckerLogo.png",250,75)
	MediaGroup:insert(cLogo2)
	
	local lmBorder = display.newRect(display.contentCenterX-10,emBorder.y+125, display.contentWidth-40,100,14 )
	cLogo2.x = display.contentCenterX-10
	cLogo2.y = emBorder.y+125
	lmBorder.x = display.contentCenterX-10
	lmBorder.y = emBorder.y+125
	lmBorder.strokeWidth = 2
	lmBorder:setFillColor(0,0,0,.6)
	lmBorder:setStrokeColor(.96,.91,.04)
	MediaGroup:insert(lmBorder)

	local lmBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 100,
		label = "Late Model Checkers",
		labelColor = {default={255,255,255}, over={255,255,255}},
		fontSize = 24,
		onEvent = handleEmBtnEvent
	})
	lmBtn.x = display.contentCenterX-10
	lmBtn.y = emBorder.y+125
	MediaGroup:insert(lmBtn)

	scrollMediaView:insert(cLogo2)
	scrollMediaView:insert(lmBorder)
	scrollMediaView:insert(lmBtn)
	-- END
	-- BEGIN Fashion Shots Btn
	local cLogo3 = display.newImageRect("img/CheckerLogo.png",250,75)
	MediaGroup:insert(cLogo3)

	local vBorder = display.newRect(display.contentCenterX-10,lmBorder.y+125, display.contentWidth-40,100,14 )
	cLogo3.x = display.contentCenterX-10
	cLogo3.y = lmBorder.y+125
	vBorder.x = display.contentCenterX-10
	vBorder.y = lmBorder.y+125
	vBorder.strokeWidth = 2
	vBorder:setFillColor(0,0,0,.6)
	vBorder:setStrokeColor(.96,.91,.04)
	MediaGroup:insert(vBorder)

	local vBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 100,
		label = "Fashion Shots",
		labelColor = {default={255,255,255}, over={255,255,255}},
		fontSize = 24,
		onEvent = handleEmBtnEvent
	})
	vBtn.x = display.contentCenterX-10
	vBtn.y = lmBorder.y+125
	MediaGroup:insert(vBtn)

	scrollMediaView:insert(cLogo3)
	scrollMediaView:insert(vBorder)
	scrollMediaView:insert(vBtn)
	-- END
	sceneGroup:insert(MediaGroup)
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