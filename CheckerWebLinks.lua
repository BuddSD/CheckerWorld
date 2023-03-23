-----------------------------------------------------------------------------------------
--
-- CheckerWebLinks.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local LinksGroup = display.newGroup()

	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)
	LinksGroup:insert(background)
	
	-- create a black background to fill screen
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	LinksGroup:insert(logo)
	
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFont, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow
	LinksGroup:insert(title)

	local header = display.newText( "CHECKER WEB LINKS", display.contentCenterX, title.y+75, native.systemFontBold, 20 )
	LinksGroup:insert(header)

	local scrollLinksView = widget.newScrollView({
		top = 40,
		left = 0,
		width = display.contentWidth-20,
		height = display.contentHeight,
		scrollWidth = display.contentWidth,
		backgroundColor = { 0,0,0 },
		scrollHeight = 10,
		horizontalScrollDisabled = true,
		listener = scrollListener
	})
	LinksGroup:insert(scrollLinksView)
	-- BEGIN button creation
	-- left side
	local cLogo1 = display.newImageRect("img/CheckerLogo.png",display.contentWidth/2-10,60)
	cLogo1.x = 80
	cLogo1.y = header.y+125
	LinksGroup:insert(cLogo1)
	scrollLinksView:insert(cLogo1)

	local rentalsBorder = display.newRect(80,header.y+125, display.contentWidth/2-2,display.contentHeight/3-7,14 )
	LinksGroup:insert(rentalsBorder)
	scrollLinksView:insert(rentalsBorder)

	local rentalsBtn = widget.newButton({
		width = display.contentWidth/2,
		height = 50,
		label = "Checker\nRentals",
		labelColor = { default={255,255,255}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		onEvent = handleregisterBtnEvent
	})
	rentalsBtn.x = 80
	rentalsBtn.y = header.y+125
	rentalsBorder.strokeWidth = 2
	rentalsBorder:setFillColor( 0,0,0,.6 )
	rentalsBorder:setStrokeColor( .96,.91,.04 )
	LinksGroup:insert(rentalsBtn)
	scrollLinksView:insert(rentalsBtn)

	local cLogo2 = display.newImageRect("img/CheckerLogo.png",display.contentWidth/2-10,60)
	cLogo2.x = 80
	cLogo2.y = rentalsBtn.y+display.contentHeight/3-7
	LinksGroup:insert(cLogo2)
	scrollLinksView:insert(cLogo2)

	local modelsBorder = display.newRect(80,rentalsBtn.y+display.contentHeight/3-7, display.contentWidth/2-2,display.contentHeight/3-7,14 )
	LinksGroup:insert(modelsBorder)
	scrollLinksView:insert(modelsBorder)

	local modelsBtn = widget.newButton({
		width = display.contentWidth/2,
		height = 50,
		label = "     Checker\nScale Models",
		labelColor = { default={255,255,255}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		onEvent = handleregisterBtnEvent
	})
	modelsBtn.x = 80
	modelsBtn.y = rentalsBtn.y+display.contentHeight/3-7
	modelsBorder.strokeWidth = 2
	modelsBorder:setFillColor( 0,0,0,.6 )
	modelsBorder:setStrokeColor( .96,.91,.04 )
	LinksGroup:insert(modelsBtn)
	scrollLinksView:insert(modelsBtn)

	local cLogo3 = display.newImageRect("img/CheckerLogo.png",display.contentWidth/2-10,60)
	cLogo3.x = 80
	cLogo3.y = modelsBtn.y+display.contentHeight/3-7
	LinksGroup:insert(cLogo3)
	scrollLinksView:insert(cLogo3)

	local manualsBorder = display.newRect(80,modelsBtn.y+display.contentHeight/3-7, display.contentWidth/2-2,display.contentHeight/3-7,14 )
	LinksGroup:insert(manualsBorder)
	scrollLinksView:insert(manualsBorder)

	local manualsBtn = widget.newButton({
		width = display.contentWidth/2,
		height = 50,
		label = "Checker Manuals\n    & Brochures",
		labelColor = { default={255,255,255}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		onEvent = handleregisterBtnEvent
	})
	manualsBtn.x = 80
	manualsBtn.y = modelsBtn.y+display.contentHeight/3-7
	manualsBorder.strokeWidth = 2
	manualsBorder:setFillColor( 0,0,0,.6 )
	manualsBorder:setStrokeColor( .96,.91,.04 )	
	LinksGroup:insert(manualsBtn)
	scrollLinksView:insert(manualsBtn)
	-- end left side
	-- right side
	local cLogo4 = display.newImageRect("img/CheckerLogo.png",display.contentWidth/2-10,60)
	cLogo4.x = display.contentWidth-80
	cLogo4.y = header.y+125
	LinksGroup:insert(cLogo4)
	scrollLinksView:insert(cLogo4)
	
	local repairsBorder = display.newRect(display.contentWidth-80,header.y+125, display.contentWidth/2-2,display.contentHeight/3-7,14 )
	LinksGroup:insert(repairsBorder)
	scrollLinksView:insert(repairsBorder)

	local repairsBtn = widget.newButton({
		width = display.contentWidth/2,
		height = 50,
		label = "Checker\nRepairs",
		labelColor = { default={255,255,255}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		onEvent = handleregisterBtnEvent
	})
	repairsBtn.x = display.contentWidth-80
	repairsBtn.y = header.y+125
	repairsBorder.strokeWidth = 2
	repairsBorder:setFillColor( 0,0,0,.6 )
	repairsBorder:setStrokeColor( .96,.91,.04 )
	LinksGroup:insert(repairsBtn)
	scrollLinksView:insert(repairsBtn)

	local cLogo5 = display.newImageRect("img/CheckerLogo.png",display.contentWidth/2-10,60)
	cLogo5.x = display.contentWidth-80
	cLogo5.y = repairsBtn.y+display.contentHeight/3-7
	LinksGroup:insert(cLogo5)
	scrollLinksView:insert(cLogo5)

	local insBorder = display.newRect(display.contentWidth-80,repairsBtn.y+display.contentHeight/3-7, display.contentWidth/2-2,display.contentHeight/3-7,14 )
	LinksGroup:insert(insBorder)
	scrollLinksView:insert(insBorder)

	local insBtn = widget.newButton({
		width = display.contentWidth/2,
		height = 50,
		label = " Checker\nInsurance",
		labelColor = { default={255,255,255}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		onEvent = handleregisterBtnEvent
	})
	insBtn.x = display.contentWidth-80
	insBtn.y = repairsBtn.y+display.contentHeight/3-7
	insBorder.strokeWidth = 2
	insBorder:setFillColor( 0,0,0,.6 )
	insBorder:setStrokeColor( .96,.91,.04 )
	LinksGroup:insert(insBtn)
	scrollLinksView:insert(insBtn)

	local cLogo6 = display.newImageRect("img/CheckerLogo.png",display.contentWidth/2-10,60)
	cLogo6.x = display.contentWidth-80
	cLogo6.y = insBtn.y+display.contentHeight/3-7
	LinksGroup:insert(cLogo6)
	scrollLinksView:insert(cLogo6)

	local pandpBorder = display.newRect(display.contentWidth-80,insBtn.y+display.contentHeight/3-7, display.contentWidth/2-2,display.contentHeight/3-7,14 )
	LinksGroup:insert(pandpBorder)
	scrollLinksView:insert(pandpBorder)

	local pandpBtn = widget.newButton({
		width = display.contentWidth/2,
		height = 50,
		label = "    Checker\nPaint & Parts",
		labelColor = { default={255,255,255}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		onEvent = handleregisterBtnEvent
	})
	pandpBtn.x = display.contentWidth-80
	pandpBtn.y = insBtn.y+display.contentHeight/3-7
	pandpBorder.strokeWidth = 2
	pandpBorder:setFillColor( 0,0,0,.6 )
	pandpBorder:setStrokeColor( .96,.91,.04 )
	LinksGroup:insert(pandpBtn)
	scrollLinksView:insert(pandpBtn)

	-- end right side
	-- END 
	sceneGroup:insert(LinksGroup)
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