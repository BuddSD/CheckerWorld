-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.HiddenStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"

local labelColors = {
	default = { .96,.91,.04,1 },
	over = { 0, 0, 0, 1 }
}

-- event listeners for tab buttons:
local function CarViewEvent( event )
	if ( event.phase == "ended" ) then
		composer.gotoScene( "CarHome" )
	else
		composer.gotoScene( "ClubHome" )
	end
	return true
end
local function ClubViewEvent( event )
	if ( event.phase == "ended" ) then
		composer.gotoScene( "ClubHome" )
	else
		composer.gotoScene( "CarHome")
	end
	return true
end
-- initial state/page the app will start on
<<<<<<< HEAD
function onHomeView( event )
=======
local function onHomeView( event )
>>>>>>> 604223ba236ad3d242cac14ce9af561b0186bd61
	composer.gotoScene( "home" )
end
-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
local tabButtons = {
 	{
		width = display.contentWidth/2,
		height = 80,
		defaultFile = "img/blackBG.png",
		overFile = "img/yellowBG.png",
		label="THE CAR",
		id = "theCar",
        size = 22,
        labelColor = labelColors,
		labelYOffset = -35,
		onPress = CarViewEvent
    },
 	{
		width = display.contentWidth/2,
		height = 80,
		defaultFile = "img/blackBG.png",
		overFile = "img/yellowBG.png",
		label="THE CLUB",
		id = "theClub",
		selected = true,
        size = 22,
        labelColor = labelColors,
		labelYOffset = -35,
		onPress = ClubViewEvent
    }
 }

 -- create the actual tabBar widget

 local tabBar = widget.newTabBar
 {
	left = 0,
	top = display.contentHeight + 40,
	height = 80,
	width = display.contentWidth,
	buttons = tabButtons
 }
composer.setVariable("savedTabBar", tabBar)
tabBar.isVisible = false
onHomeView()	-- invoke first tab button's onPress event manually
