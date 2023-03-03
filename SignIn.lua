-----------------------------------------------------------------------------------------
--
-- SignIn.lua
--
-----------------------------------------------------------------------------------------


local composer = require "composer"
local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()

-- database connection for signing in 
local sqllib = require( "sqlite3" )
local dbFile = 'CheckerWorldUsers.db'
local db = sqllib.open(dbFile)

local function textListener(event)
	-- "event.text" only exists during the editing phase to show what's being edited.
	-- it is NOT the field's ".text" attribute. that is "event.target.text"
	if ( event.phase == "begin" ) then
		-- user begins adding text to textField
	elseif ( event.phase == "ended" or event.phase == "submitted" ) then
		-- save textField's text
	elseif ( event.phase == "editing" ) then
		print( event.newCharacters )
		print( event.oldText )
		print( event.startPosition )
		print( event.text )
	end
end


function scene:create( event )
	local sceneGroup = self.view

	local pageGroup = display.newGroup()

    -- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)
	pageGroup:insert(background)

	-- create a logo
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	pageGroup:insert(logo)

	-- create some text for the site title
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFont, 20 )
	title:setFillColor( 244,233, 0)	-- yellow
	pageGroup:insert(title)

	--create some text for the page title
	local newTextParams = { text = "SIGN IN",
		x = display.contentCenterX,
		y = title.y + 200,
		width = 310, height = 100,
		font = native.systemFont, fontSize = 22,
		align = "center"
	}
	local summary = display.newText( newTextParams )
	summary:setFillColor( 255,255,255 ) -- white
	pageGroup:insert(summary)

	local signInGroup = display.newRoundedRect( display.contentCenterX,display.contentCenterY,display.contentWidth-20,200,12 )
	signInGroup.strokeWidth = 2
	signInGroup:setFillColor( 0 )
	signInGroup:setStrokeColor( 244,233,0 )
	pageGroup:insert( signInGroup )

	local userLabel = {
		text = "User Name",
		x = 75,
		y = signInGroup.y-65,
		width = display.ContentWidth,
		font = native.systemFont, fontSize = 16,
		align = "center"
	}

	local uLabel = display.newText( userLabel )
	uLabel:setFillColor( 255, 255, 255 ) -- white
	pageGroup:insert( uLabel )

	local passLabel = {
		text = "Password",
		x = 70,
		y = signInGroup.y+15,
		width = display.ContentWidth,
		font = native.systemFont, fontSize = 16,
		align = "center"
	}

	local pLabel = display.newText( passLabel )
	pLabel:setFillColor( 255,255,255 ) -- white
	pageGroup:insert( pLabel )

	uNameField = native.newTextField(
		display.contentCenterX,
		display.contentCenterY-30,
		display.contentWidth-70, 
		40
	)
	checkName = uNameField:addEventListener( "userInput", textListener )

	uPassField = native.newTextField(
		display.contentCenterX,
		display.contentCenterY+50,
		display.contentWidth-70,
		40
	)
	checkPass = uPassField:addEventListener( "userInput", textListener )
	-- user variables for sign in
	local uName
	local uPass

	-- ButtonSignIn click handling
	local function handleSignInBtnEvent( event )
		if ( "ended" == event.phase ) then
			-- validate credentials
			uName = sqllib.exec([=[SELECT UserName FROM Members;]=])
			uPass = sqllib.exec([=[SELECT uPass FROM Members;]=])
			if ( checkName == uName and checkPass == uPass ) then 
				-- grant access to rest of app
				composer.gotoScene("CarHome")
			-- elseif(checkName != uName or checkPass != uPass) then
				-- deny access to app and let user try again

			end
		end
	end

	ButtonSignIn = widget.newButton({
        width = 200,
        height = 50,
        label = "Sign In",
		labelColor = { default={0,0,0}, over={0,0,0} },
        defaultFile = "img/YellowBtn.png",
        overFile = "img/YellowBtnPress.png",
        onEvent = handleSignInBtnEvent
    })
	ButtonSignIn.x = display.contentCenterX
    ButtonSignIn.y = signInGroup.y + 150
	pageGroup:insert(ButtonSignIn)

	-- ButtonForgotPass click handling
	local function handleForgotPassBtnEvent( event )
		if ( "ended" == event.phase ) then
			-- begin password recovery process
		end
	end

	ButtonForgotPass = widget.newButton({
        width = 200,
        height = 50,
        label = "Forgot Password?",
		labelColor = { default={255,255,255}, over={244,233,0} },
        defaultFile = "img/blackBG.png",
        overFile = "img/blackBG.png",
        onEvent = handleForgotPassBtnEvent
    })
	ButtonForgotPass.x = display.contentCenterX
    ButtonForgotPass.y = signInGroup.y + 275
	pageGroup:insert(ButtonForgotPass)

	-- backBtn click handling
	local function handleButtonBackEvent( event )
		if ( "ended" == event.phase ) then
			composer.gotoScene( "home" )
		end
	end

	ButtonBack = widget.newButton({
        width = 100,
        height = 50,
        label = "< Back",
		labelColor = { default={255,255,255}, over={244,233,0} },
        defaultFile = "img/blackBG.png",
        overFile = "img/blackBG.png",
        onEvent = handleButtonBackEvent
    })
	ButtonBack.x = display.contentCenterX
	ButtonBack.y = 550
	pageGroup:insert(ButtonBack)

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( logo )
	sceneGroup:insert( title )
	sceneGroup:insert( summary )
	sceneGroup:insert( pageGroup )
	sceneGroup:insert( uNameField )
	sceneGroup:insert( uPassField )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
        local tabBar = composer.getVariable("savedTabBar")
        tabBar.isVisible = false

		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if (uNameField) then
		uNameField:removeSelf()
		uNameField = nil
	end

	if (uPassField) then
		uPassField:removeSelf()
		uPassField = nil
	end

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
	
	sceneGroup.remove()
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
