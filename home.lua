-----------------------------------------------------------------------------------------
--
-- home.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()

-- database connection for signing in
local sqlite = require( "sqlite3" )
path = system.pathForFile( "data.db", system.DocumentsDirectory )
db = sqlite.open(path)

function scene:create( event )
    local sceneGroup = self.view
    local pageGroup = display.newGroup()

    -- create a black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)

	-- create some text

	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 292, 214 )
	logo.x = display.contentCenterX
	logo.y = display.contentCenterY-150

    local title = display.newText( "Checker World", display.contentCenterX, 225, native.systemFont, 32 )
	title:setFillColor( 244,233, 0)	-- Yellow
	title:setFillColor( 244,233, 0)	-- Yellow

    SubTitle = {
        text = "Home of the \nChecker Car Club of America",
        x = display.contentCenterX,
        y = title.y + 115,
        width = 310,
        height = 150,
        font = native.systemFont,
        fontSize = 20,
        align = "center"
    }
    _subTitle = display.newText( SubTitle )
    _subTitle:setFillColor( 255,255,255 )

    function handleSignInBtnEvent( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene( "SignIn" )
        end
    end

    function handleSignUpBtnEvent( event )
        if ( "ended" == event.phase ) then
            composer.gotoScene( "SignUp" )
        end
    end

    ButtonSignIn = widget.newButton({
        width = 200,
        height = 50,
        label = "Sign In",
        labelColor = { default={0,0,0}, over={244,233,0} },
        defaultFile = "img/YellowBtn.png",
        overFile = "img/YellowBtnPress.png",
        onEvent = handleSignInBtnEvent
    })

    local function handleSignUpBtnEvent( event )
        if ( "ended" == event.phase ) then
            system.openURL("https://www.checkerworld.org/plans-pricing")
        end
    end

    ButtonSignUp = widget.newButton({
        width = 200,
        height = 50,
        label = "Sign Up",
        labelColor = { default={0,0,0}, over={244,233,0} },
        defaultFile = "img/YellowBtn.png",
        overFile = "img/YellowBtnPress.png",
        onEvent = handleSignUpBtnEvent
    })
    ButtonSignIn.x = display.contentCenterX
    ButtonSignIn.y = _subTitle.y + 75
    ButtonSignUp.x = display.contentCenterX
    ButtonSignUp.y = ButtonSignIn.y + 75

     sceneGroup:insert( background )
     sceneGroup:insert( logo )
     sceneGroup:insert( title )
     sceneGroup:insert( _subTitle )
     sceneGroup:insert( ButtonSignIn )
     sceneGroup:insert( ButtonSignUp )
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then

    elseif phase == "did" then

    end
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then

    elseif phase == "did" then

    end
end
function scene:destroy( event )
    local sceneGroup = self.view
    -- Called prior to the removal of scene's "view" (sceneGroup)
	--
    sceneGroup:remove();
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
