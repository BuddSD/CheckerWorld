-----------------------------------------------------------------------------------------
--
-- CheckerDocuments.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)
	
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFontBold, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow

	local header = display.newText( "CHECKER DOCUMENTS", display.contentCenterX, title.y+75, native.systemFont, 20 )

	local scrollDocsView = widget.newScrollView({
		top = 40,
		left = 10,
		width = display.contentWidth-20,
		height = display.contentHeight,
		scrollWidth = display.contentWidth,
		backgroundColor = { 0,0,0 },
		scrollHeight = 10,
		listener = scrollListener
	})
	scrollDocsView:insert( background )

	-- Documents intro text
	local intro = display.newText("Welcome to the Checker Document Library. Note that certain categories of documents are for CCCoA members only. We provide the most comprehensive collection of instantly available information about Checker vehicles and most of the technical materials that pertain to them. You will also find copies of every relevant article published in our newsletter since 1984. If you don't find what you are looking for, please feel free to send us a note via the Contact page of this web site. If you have a document that you'd like to contribute, please contact us via the Contact form. If you are looking for information about the history of Checker Motors, please visit the History page of this web site. ", display.contentCenterX, header.y+250, display.contentWidth-20,display.contentHeight,native.systemFont, 18 )
	intro:setFillColor(1,1,1,1)
	scrollDocsView:insert(intro)
	-- END intro
	-- BEGIN member access items
	
	local priceListImg = display.newImageRect("img/priceListthumb.png", 100, 100)
	priceListImg.x = display.contentCenterX
	priceListImg.y = intro.y+200
	scrollDocsView:insert(priceListImg)
	local priceListLabel = display.newText("Price Lists", display.contentCenterX,intro.y+75, 100,100, 16 )
	scrollDocsView:insert(priceListLabel)
	-- END member access items
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