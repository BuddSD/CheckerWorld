-----------------------------------------------------------------------------------------
--
-- CarHome.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local CarHomeGroup = display.newGroup()

	-- Functions to control the buttons
	local function forSaleBtnEvent ( event )
		composer.gotoScene( "CheckerMarket")
	end
	local function photosBtnEvent ( event )
		composer.gotoScene( "CheckerPhotos")
	end
	local function docsBtnEvent ( event )
		composer.gotoScene( "CheckerDocuments")
	end
	local function historyBtnEvent ( event )
		composer.gotoScene( "CheckerHistory")
	end
	local function mediaBtnEvent ( event )
		composer.gotoScene( "CheckerMedia")
	end
	local function contactBtnEvent ( event )
		composer.gotoScene( "ContactUs")
	end
	-- end button functions
	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)
	CarHomeGroup:insert(background)
	
	-- create a black background to fill screen
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	CarHomeGroup:insert(logo)
	
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFontBold, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow
	CarHomeGroup:insert(title)

	
	-- Button display combo
	-- Checkers for Sale button begin
	local fsBorder = display.newRect(display.contentCenterX,40, display.contentWidth-24,58,14 )
	local forSaleBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "CHECKERS FOR SALE",
		labelColor = {default={1,1,1}, over={.96,.91,.04} },
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = forSaleBtnEvent
	})
	forSaleBtn.x = display.contentCenterX
	forSaleBtn.y = title.y+100
	fsBorder.strokeWidth = 2
	fsBorder:setFillColor( 0 )
	fsBorder:setStrokeColor( .96,.91,.04 )
	CarHomeGroup:insert(fsBorder)
	CarHomeGroup:insert(forSaleBtn)
	-- end
	-- Checker Photos button begin
	local photoBorder = display.newRect(display.contentCenterX,fsBorder.y+75, display.contentWidth-24,58,14 )
	local photosBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "CHECKER PHOTOS",
		labelColor = { default={1,1,1}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = photosBtnEvent
	})
	photosBtn.x = display.contentCenterX
	photosBtn.y = fsBorder.y+75
	photoBorder.strokeWidth = 2
	photoBorder:setFillColor( 0 )
	photoBorder:setStrokeColor(.96,.91,.04)
	CarHomeGroup:insert(photoBorder)
	CarHomeGroup:insert(photosBtn)
	-- end
	-- Checker Documents button begin
	local docsBorder = display.newRect(display.contentCenterX,photoBorder.y+75, display.contentWidth-24,58,14 )
	local docsBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "CHECKER DOCUMENTS",
		labelColor = { default={1,1,1}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = docsBtnEvent
	})
	docsBtn.x = display.contentCenterX
	docsBtn.y = photoBorder.y+75
	docsBorder.strokeWidth = 2
	docsBorder:setFillColor( 0 )
	docsBorder:setStrokeColor( .96,.91,.04 )
	CarHomeGroup:insert(docsBorder)
	CarHomeGroup:insert(docsBtn)
	-- end
	-- Checker History button begin
	local historyBorder = display.newRect(display.contentCenterX,docsBorder.y+75, display.contentWidth-24,58,14 )
	local historyBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "CHECKER HISTORY",
		labelColor = { default={1,1,1}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = historyBtnEvent
	})
	historyBtn.x = display.contentCenterX
	historyBtn.y = docsBorder.y+75
	historyBorder.strokeWidth = 2
	historyBorder:setFillColor( 0 )
	historyBorder:setStrokeColor( .96,.91,.04 )
	CarHomeGroup:insert(historyBorder)
	CarHomeGroup:insert(historyBtn)
	-- end	
	-- Checker Media button begin
	local mediaBorder = display.newRect(display.contentCenterX,historyBorder.y+75, display.contentWidth-24,58,14 )
	local mediaBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "MOVIES | TV | VIDEO",
		labelColor = { default={1,1,1}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = mediaBtnEvent
	})
	mediaBtn.x = display.contentCenterX
	mediaBtn.y = historyBorder.y+75
	mediaBorder.strokeWidth = 2
	mediaBorder:setFillColor( 0 )
	mediaBorder:setStrokeColor( .96,.91,.04 )
	CarHomeGroup:insert(mediaBorder)
	CarHomeGroup:insert(mediaBtn)
	-- end
	-- Checker Contact button begin
	local contactBorder = display.newRect(display.contentCenterX,mediaBorder.y+75, display.contentWidth-24,58,14 )
	local contactBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "CONTACT US",
		labelColor = { default={1,1,1}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = contactBtnEvent
	})
	contactBtn.x = display.contentCenterX
	contactBtn.y = mediaBorder.y+75
	contactBorder.strokeWidth = 2
	contactBorder:setFillColor( 0 )
	contactBorder:setStrokeColor( .96,.91,.04 )
	CarHomeGroup:insert(contactBorder)
	CarHomeGroup:insert(contactBtn)
	-- end

	-- all objects must be added to  sceneGroup (e.g. self.view)
	sceneGroup:insert( CarHomeGroup )
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
	CarHomeGroup:remove()
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene