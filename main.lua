-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
oniOS = ( system.getInfo("platformName") == "iPhone OS")
onAndroid = (system.getInfo("platformName") == "Android")
onOSX = (system.getInfo("platformName") == "Mac OS X")
onWin = (system.getInfo("platformName") == "Win")

require "ssk2.loadSSK"
ssk.init()

io.output():setvbuf("no")
-- show default status bar (iOS)
display.setStatusBar( display.HiddenStatusBar )
system.activate("multitouch")

numImages = 1000

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"
local sqlite = require( "sqlite3" )

path = system.pathForFile( "CheckerWorldUsers.db", system.DocumentsDirectory )
db = sqlite.open(path)

-- credCheckName & credCheckPass need to be check against the entries in the lua table below (userCheck) this table will be populated by iterating through the database table.
-- Database : CheckerWorldUsers.db
-- Table	: Members
-- Column 1	: UserName
-- Column 2 : uPass


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

labelColors = {
	default = { .96,.91,.04,1 },			-- Yellow
	over = { 0, 0, 0, 1 }					-- Black
}

-- event listeners for tab buttons:
function ClubView( event )
	if ( event.phase == "ended" ) then
		composer.gotoScene( "CarHome" )
	else
		composer.gotoScene( "ClubHome" )
	end
	return true
end

function CarView( event )
	if ( event.phase == "ended" ) then
		composer.gotoScene( "ClubHome" )
	else
		composer.gotoScene( "CarHome")
	end
	return true
end
-- initial state/page the app will start on
function onStartView( event )
	composer.gotoScene( "start" )
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
		onPress = CarView
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
		onPress = ClubView
    }
 }

 -- create the actual tabBar widget

 local tabBar = widget.newTabBar
 {
	left = 0,
	right = 0,
	bottom = 0,
	top = display.contentHeight + 40,
	height = 80,
	width = display.contentWidth,
	buttons = tabButtons
 }
composer.setVariable("savedTabBar", tabBar)
tabBar.isVisible = false
onStartView()	-- invoke first tab button's onPress event manually
