-----------------------------------------------------------------------------------------
--
-- CheckerMembership.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local MemberGroup = display.newGroup()

	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)
	MemberGroup:insert(background)
	
	-- create a black background to fill screen
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	MemberGroup:insert(logo)
	
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFont, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow
	MemberGroup:insert(title)

	local header = display.newText( "CHECKER MEMBERSHIP", display.contentCenterX, title.y+75, native.systemFontBold, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow
	MemberGroup:insert(header)

	local scrollMembershipView = widget.newScrollView({
		top = 40,
		left = 0,
		width = display.contentWidth,
		height = display.contentHeight,
		scrollWidth = display.contentWidth,
		scrollHeight = 10,
		backgroundColor = {0,0,0},
		horizontalScrollDisabled = true,
		listener = scrollListener
	})
	MemberGroup:insert(scrollMembershipView)

	-- begin button styling
	local cLogo = display.newImageRect("img/CheckerWorldLogo.png",175,130)
	cLogo.x = display.contentCenterX
	cLogo.y = header.y+97
	MemberGroup:insert(cLogo)

	local usMemberBorder = display.newRect(display.contentCenterX,header.y+100, display.contentWidth-20,160,14 )
	usMemberBorder.strokeWidth = 2
	usMemberBorder:setFillColor( 0,0,0,.6 )
	usMemberBorder:setStrokeColor(.96,.91,.04)
	MemberGroup:insert(usMemberBorder)

	local usMemberBorderWhite = display.newRect(display.contentCenterX
	,header.y+100, display.contentWidth-30,146,14 )
	usMemberBorderWhite.strokeWidth = 2
	usMemberBorderWhite:setFillColor( 0,0,0,0 )
	usMemberBorderWhite:setStrokeColor(1,1,1)
	MemberGroup:insert(usMemberBorderWhite)

	local usMemberBtn = widget.newButton({
		width = display.contentWidth-20,
		height = 160,
		label = "US Membership\n\n       $25.00",
		labelColor = {default={255,255,255}, over={244,233,0} },
		fontSize = 24,
		labelAlign = "center",
		onEvent = handleForSaleBtnEvent
	})	
	usMemberBtn.x = display.contentCenterX
	usMemberBtn.y = header.y+100
	MemberGroup:insert(usMemberBtn)

	local cLogo2 = display.newImageRect("img/CheckerWorldLogo.png",175,130)
	cLogo2.x = display.contentCenterX
	cLogo2.y = cLogo.y+195
	MemberGroup:insert(cLogo2)

	local intlMemberBorder = display.newRect(display.contentCenterX,cLogo.y+195, display.contentWidth-20,160,14 )
	intlMemberBorder.strokeWidth = 2
	intlMemberBorder:setFillColor( 0,0,0,.6 )
	intlMemberBorder:setStrokeColor(.96,.91,.04)
	MemberGroup:insert(intlMemberBorder)

	local intlMemberBorderWhite = display.newRect(display.contentCenterX,cLogo.y+195, display.contentWidth-30,146,14 )
	intlMemberBorderWhite.strokeWidth = 2
	intlMemberBorderWhite:setFillColor( 0,0,0,0 )
	intlMemberBorderWhite:setStrokeColor(1,1,1)
	MemberGroup:insert(intlMemberBorderWhite)

	local intlMemberBtn = widget.newButton({
		width = display.contentWidth-20,
		height = 160,
		label = "Rest of World\n Membership\n\n      $30.00",
		labelColor = {default={255,255,255}, over={244,233,0} },
		fontSize = 24,
		labelAlign = "center",
		onEvent = handleForSaleBtnEvent
	})	
	intlMemberBtn.x = display.contentCenterX
	intlMemberBtn.y = cLogo.y+195
	MemberGroup:insert(intlMemberBtn)

	local cLogo3 = display.newImageRect("img/CheckerWorldLogo.png",175,130)
	cLogo3.x = display.contentCenterX
	cLogo3.y = cLogo2.y+192
	MemberGroup:insert(cLogo3)

	local CalendarBorder = display.newRect(display.contentCenterX,cLogo2.y+195, display.contentWidth-20,160,14 )
	CalendarBorder.strokeWidth = 2
	CalendarBorder:setFillColor( 0,0,0,.6 )
	CalendarBorder:setStrokeColor(.96,.91,.04)
	MemberGroup:insert(CalendarBorder)

	local CalendarBorderWhite = display.newRect(display.contentCenterX,cLogo2.y+195, display.contentWidth-30,146,14 )
	CalendarBorderWhite.strokeWidth = 2
	CalendarBorderWhite:setFillColor( 0,0,0,0 )
	CalendarBorderWhite:setStrokeColor(1,1,1)
	MemberGroup:insert(CalendarBorderWhite)

	local calendarBtn = widget.newButton({
		width = display.contentWidth-20,
		height = 160,
		label = "Checker Calendar\n\n          $15.00",
		labelColor = {default={255,255,255}, over={244,233,0} },
		fontSize = 24,
		onEvent = handleForSaleBtnEvent
	})	
	calendarBtn.x = display.contentCenterX
	calendarBtn.y = cLogo2.y+195
	MemberGroup:insert(calendarBtn)
	-- end
	-- insert elements into the Scroll view
	scrollMembershipView:insert(cLogo)
	scrollMembershipView:insert(cLogo2)
	scrollMembershipView:insert(cLogo3)
	scrollMembershipView:insert(usMemberBorder)
	scrollMembershipView:insert(intlMemberBorder)
	scrollMembershipView:insert(CalendarBorder)
	scrollMembershipView:insert(usMemberBorderWhite)
	scrollMembershipView:insert(intlMemberBorderWhite)
	scrollMembershipView:insert(CalendarBorderWhite)
	scrollMembershipView:insert(usMemberBtn)
	scrollMembershipView:insert(intlMemberBtn)
	scrollMembershipView:insert(calendarBtn)

	sceneGroup:insert(MemberGroup)
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