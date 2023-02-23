-----------------------------------------------------------------------------------------
--
-- SignIn.lua
--
-----------------------------------------------------------------------------------------

<<<<<<< HEAD
local composer = require "composer"
=======
local composer = require "composer" 
>>>>>>> 604223ba236ad3d242cac14ce9af561b0186bd61
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

<<<<<<< HEAD
	local pageGroup = display.newGroup()

    -- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)


=======
    -- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)
>>>>>>> 604223ba236ad3d242cac14ce9af561b0186bd61
	-- create a black background to fill screen
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
<<<<<<< HEAD

	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFont, 20 )
	title:setFillColor( 244,233, 0)	-- yellow
=======
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFont, 20 )
	title:setFillColor( 244,233, 0)	-- yellow 
>>>>>>> 604223ba236ad3d242cac14ce9af561b0186bd61


	local newTextParams = { text = "SIGN IN",
						x = display.contentCenterX,
						y = title.y + 200,
						width = 310, height = 100,
						font = native.systemFont, fontSize = 22,
						align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 255,255,255 ) -- white
<<<<<<< HEAD

	local signInGroup = display.newRoundedRect( display.contentCenterX,display.contentCenterY,display.contentWidth-20,200,12 )
	signInGroup.strokeWidth = 2
	signInGroup:setFillColor( 0 )
	signInGroup:setStrokeColor( 244,233,0 )
	pageGroup:insert( signInGroup )

=======
	
	local signInGroup = display.newRoundedRect( display.contentCenterX,display.contentCenterY,display.contentWidth-20,200,12 )
	signInGroup.strokeWidth = 3
	signInGroup:setFillColor( 0 )
	signInGroup:setStrokeColor( 244,233,0 )
	
>>>>>>> 604223ba236ad3d242cac14ce9af561b0186bd61
	local userLabel = {
		text = "User Name",
		x = 75,
		y = signInGroup.y-65,
		width = display.ContentWidth,
		font = native.systemFont, fontSize = 16,
		align = "center"
	}
<<<<<<< HEAD

	local uLabel = display.newText( userLabel )
	uLabel:setFillColor( 255, 255, 255 ) -- white
	pageGroup:insert( uLabel )

	local uNameField = native.newTextField(display.contentCenterX,display.contentCenterY-30,display.contentWidth-70, 40)
	uNameField.strokeWidth = 1
	uNameField:setFillColor( 0 )
	uNameField:setStrokeColor( 244, 233, 0 )
	pageGroup:insert( uNameField )

=======
	local uLabel = display.newText( userLabel )
	uLabel:setFillColor( 255, 255, 255 ) -- white 
	
	local uNameField = native.newTextField(display.contentCenterX,display.contentCenterY-30,display.contentWidth-70, 40)
	local uPassField = native.newTextField(display.contentCenterX,display.contentCenterY+50,display.contentWidth-70, 40)
	
>>>>>>> 604223ba236ad3d242cac14ce9af561b0186bd61
	local passLabel = {
		text = "Password",
		x = 70,
		y = signInGroup.y+15,
		width = display.ContentWidth,
		font = native.systemFont, fontSize = 16,
		align = "center"
	}
<<<<<<< HEAD
	local uPassField = native.newTextField(display.contentCenterX,display.contentCenterY+50,display.contentWidth-70, 40)
	pageGroup:insert( uPassField )

	local pLabel = display.newText( passLabel )
	pLabel:setFillColor( 255,255,255 ) -- white
	pageGroup:insert( pLabel )

	-- ButtonSignIn click handling
	local function handleSignInBtnEvent( event )
		if ( "ended" == event.phase ) then
			-- validate credentials
		end
	end

=======
	local pLabel = display.newText( passLabel )
	pLabel:setFillColor( 255,255,255 ) -- white
	
>>>>>>> 604223ba236ad3d242cac14ce9af561b0186bd61
	ButtonSignIn = widget.newButton({
        width = 200,
        height = 50,
        label = "Sign In",
        defaultFile = "img/YellowBtn.png",
        overFile = "img/YellowBtnPress.png",
        onEvent = handleSignInBtnEvent
    })
	ButtonSignIn.x = display.contentCenterX
    ButtonSignIn.y = signInGroup.y + 200
<<<<<<< HEAD

	-- ButtonForgotPass click handling
	local function handleForgotPassBtnEvent( event )
		if ( "ended" == event.phase ) then
			-- begin password recovery process
		end
	end

=======
	
>>>>>>> 604223ba236ad3d242cac14ce9af561b0186bd61
	ButtonForgotPass = widget.newButton({
        width = 200,
        height = 50,
        label = "Forgot Password?",
        defaultFile = "img/blackBG.png",
        overFile = "img/blackBG.png",
        onEvent = handleForgotPassBtnEvent
    })
	ButtonForgotPass.x = display.contentCenterX
    ButtonForgotPass.y = signInGroup.y + 275

<<<<<<< HEAD
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
        defaultFile = "img/blackBG.png",
        overFile = "img/blackBG.png",
        onEvent = handleButtonBackEvent
    })
	ButtonBack.x = display.contentCenterX
	ButtonBack.y = 550

=======
>>>>>>> 604223ba236ad3d242cac14ce9af561b0186bd61
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( logo )
	sceneGroup:insert( title )
	sceneGroup:insert( summary )
<<<<<<< HEAD
	sceneGroup:insert( signInGroup )
	sceneGroup:insert( uLabel )
	sceneGroup:insert( uNameField )
	sceneGroup:insert( uPassField )
	sceneGroup:insert( pLabel )
	sceneGroup:insert( ButtonBack )
	sceneGroup:insert( ButtonForgotPass )
	sceneGroup:insert( ButtonSignIn )
	sceneGroup:insert( pageGroup )
=======
>>>>>>> 604223ba236ad3d242cac14ce9af561b0186bd61
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
<<<<<<< HEAD
	sceneGroup.remove()
=======
>>>>>>> 604223ba236ad3d242cac14ce9af561b0186bd61
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
