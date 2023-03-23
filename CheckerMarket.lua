-----------------------------------------------------------------------------------------
--
-- CheckerMarket.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local MarketGroup = display.newGroup()

	-- Functions to control the buttons
	local function sellBtnEvent ( event )
		composer.gotoScene( "CheckerMarket")
	end
	local function buyBtnEvent ( event )
		composer.gotoScene( "CheckerMarket")
	end
	local function CarViewEvent ( event )
		composer.gotoScene( "CheckerMarket")
	end
	local function ClubViewEvent ( event )
		composer.gotoScene( "CheckerMarket")
	end
	-- end button functions
	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)
	MarketGroup:insert(background)
	
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	MarketGroup:insert(logo)
	
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFontBold, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow
	MarketGroup:insert(title)

	local header = display.newText( "CHECKER MARKET", display.contentCenterX, title.y+75, native.systemFont, 20 )
	MarketGroup:insert(header)
	
	-- Sell button Begin
	local cLogo1 = display.newImageRect("img/CheckerLogo.png",300,130)
	MarketGroup:insert(cLogo1)

	local sellBorder = display.newRect(display.contentCenterX,40, 300,200,14 )
	cLogo1.x = display.contentCenterX
	cLogo1.y = header.y+150
	sellBorder.x = display.contentCenterX
	sellBorder.y = header.y+150
	sellBorder.strokeWidth = 2
	sellBorder:setFillColor(0,0,0,.6)
	sellBorder:setStrokeColor( .96,.91,.04)
	MarketGroup:insert(sellBorder)

	local sellBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 160,
		label = "Sell Your Checker",
		labelColor = {default={ 1,1,1 }, over={ .96,.91,.04 } },
		fontSize = 30,
		onEvent = sellBtnEvent
	})	
	sellBtn.x = display.contentCenterX
	sellBtn.y = header.y+150
	MarketGroup:insert(sellBtn)
	-- end
	
	-- Buy button Begin
	local cLogo2 = display.newImageRect("img/CheckerLogo.png",300,130)	
	MarketGroup:insert(cLogo2)

	local buyBorder = display.newRect(display.contentCenterX,40,300,200,14 )
	cLogo2.x = display.contentCenterX
	cLogo2.y = sellBorder.y+200
	buyBorder.x = display.contentCenterX
	buyBorder.y = sellBorder.y+199
	buyBorder.strokeWidth = 2
	buyBorder:setFillColor(0,0,0,.6)
	buyBorder:setStrokeColor(.96,.91,.04)
	MarketGroup:insert(buyBorder)

	local buyBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 160,
		label = "Buy Your Checker",
		labelColor = {default={ 1,1,1 }, over={.96,.91,.04} },
		fontSize = 30,
		onEvent = buyBtnEvent
	})
	
	buyBtn.x = display.contentCenterX
	buyBtn.y = sellBorder.y+200
	MarketGroup:insert(buyBtn)
	--end

	sceneGroup:insert(MarketGroup)	
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