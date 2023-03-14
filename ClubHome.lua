-----------------------------------------------------------------------------------------
--
-- ClubHome.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local pageGroup = display.newGroup()

	-- Functions to control the buttons
	local function registerBtnEvent ( event )
		composer.gotoScene( "CheckerRegistration")
	end
	local function MembershipBtnEvent ( event )
		composer.gotoScene( "CheckerMembership")
	end
	local function ConventionsBtnEvent ( event )
		composer.gotoScene( "CheckerConventions")
	end
	local function linksBtnEvent ( event )
		composer.gotoScene( "CheckerWebLinks")
	end
	local function newsBtnEvent ( event )
		composer.gotoScene( "CheckerClubNews")
	end
	local function contactBtnEvent ( event )
		composer.gotoScene( "ContactUs")
	end
	-- end button functions
	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)
	pageGroup:insert(background)
	
	-- create a black background to fill screen
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	pageGroup:insert(logo)
	
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFont, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow
	pageGroup:insert(title)
	--
	-- Start of OnScreen buttons for navigating the rest of the site
	--
	-- Button display combo
	-- Register Checker Sale button begin
	local registerBorder = display.newRect(display.contentCenterX,40, display.contentWidth-24,58,14 )
	local registerBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "REGISTER YOUR CHECKER",
		labelColor = {default={1,1,1}, over={.96,.91,.04} },
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = registerBtnEvent
	})
	registerBtn.x = display.contentCenterX
	registerBtn.y = title.y+100
	registerBorder.strokeWidth = 2
	registerBorder:setFillColor( 0 )
	registerBorder:setStrokeColor( .96,.91,.04 )
	pageGroup:insert(registerBorder)
	pageGroup:insert(registerBtn)
	-- end
	-- Checker Photos button begin
	local memberBorder = display.newRect(display.contentCenterX,registerBorder.y+75, display.contentWidth-24,58,14 )
	local memberBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "MEMBERSHIP",
		labelColor = { default={1,1,1}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = MembershipBtnEvent
	})
	memberBtn.x = display.contentCenterX
	memberBtn.y = registerBorder.y+75
	memberBorder.strokeWidth = 2
	memberBorder:setFillColor( 0 )
	memberBorder:setStrokeColor( .96,.91,.04 )
	pageGroup:insert(memberBorder)
	pageGroup:insert(memberBtn)
	-- end
	-- Checker Documents button begin
	local convBorder = display.newRect(display.contentCenterX,memberBorder.y+75, display.contentWidth-24,58,14 )
	local convBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "CONVENTIONS",
		labelColor = { default={1,1,1}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = ConventionsBtnEvent
	})
	convBtn.x = display.contentCenterX
	convBtn.y = memberBorder.y+75
	convBorder.strokeWidth = 2
	convBorder:setFillColor( 0 )
	convBorder:setStrokeColor( .96,.91,.04 )
	pageGroup:insert(convBorder)
	pageGroup:insert(convBtn)
	-- end
	-- Checker Documents button begin
	local linksBorder = display.newRect(display.contentCenterX,convBorder.y+75, display.contentWidth-24,58,14 )
	local linksBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "WEB LINKS",
		labelColor = { default={1,1,1}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = linksBtnEvent
	})
	linksBtn.x = display.contentCenterX
	linksBtn.y = convBorder.y+75
	linksBorder.strokeWidth = 2
	linksBorder:setFillColor( 0 )
	linksBorder:setStrokeColor( .96,.91,.04 )
	pageGroup:insert(linksBorder)
	pageGroup:insert(linksBtn)
	-- end	
	-- Checker Documents button begin
	local newsBorder = display.newRect(display.contentCenterX,linksBorder.y+75, display.contentWidth-24,58,14 )
	local newsBtn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "CLUB NEWS",
		labelColor = { default={1,1,1}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = newsBtnEvent
	})
	newsBtn.x = display.contentCenterX
	newsBtn.y = linksBorder.y+75
	newsBorder.strokeWidth = 2
	newsBorder:setFillColor( 0 )
	newsBorder:setStrokeColor( .96,.91,.04 )
	pageGroup:insert(newsBorder)
	pageGroup:insert(newsBtn)
	-- end
	-- Checker Documents button begin
	local contactBorder = display.newRect(display.contentCenterX,newsBorder.y+75, display.contentWidth-24,58,14 )
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
	contactBtn.y = newsBorder.y+75
	contactBorder.strokeWidth = 2
	contactBorder:setFillColor( 0 )
	contactBorder:setStrokeColor( .96,.91,.04 )
	pageGroup:insert(contactBorder)
	pageGroup:insert(contactBtn)
	-- end

	-- all objects must be added to  sceneGroup (e.g. self.view)
	sceneGroup:insert( pageGroup )
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
	pageGroup:remove()
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene