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
local sqlite = require( "sqlite3" )

path = system.pathForFile( "CheckerWorldUsers.db", system.DocumentsDirectory )
db = sqlite.open(path)

function checkCredentials(_name, _pass)
	-- copy the db locally
	local users = {}
	for row in db:nrows( "SELECT * FROM Members" ) do
		print("Row: ", row.UserID)
		users[#users+1] = {checkName = row.UserName, checkPass = row.uPass}
	end
	print(users)
end


function textListener(event)
	-- "event.text" only exists during the editing phase to show what's being edited.
	-- it is NOT the field's ".text" attribute. that is "event.target.text"
	if ( event.phase == "begin" ) then
		-- user begins adding text to textField
		event.target.text = ""
	elseif ( event.phase == "ended" or event.phase == "submitted" ) then
		-- save textField's text
		print( event.name, event.phase, "Final Text: ", event.target.text )
		text = event.target.text
	elseif ( event.phase == "editing" ) then
		print( event.newCharacters )
		print( event.oldText )
		print( event.startPosition )
		print( event.text )
	end
end

local labelColors = {
	default = { .96,.91,.04,1 },
	over = { 0, 0, 0, 1 }
}

-- event listeners for tab buttons:
function CarView( event )
	if ( event.phase == "ended" ) then
		composer.gotoScene( "CarHome" )
	else
		composer.gotoScene( "ClubHome" )
	end
	return true
end
function ClubView( event )
	if ( event.phase == "ended" ) then
		composer.gotoScene( "ClubHome" )
	else
		composer.gotoScene( "CarHome")
	end
	return true
end
-- initial state/page the app will start on
function onHomeView( event )
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
