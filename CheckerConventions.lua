-----------------------------------------------------------------------------------------
--
-- CheckerConventions.lua
--
-----------------------------------------------------------------------------------------
local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local ConventionsGroup = display.newGroup()

	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor(0,0,0)
	ConventionsGroup:insert(background)
	
	-- create a black background to fill screen
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	ConventionsGroup:insert(logo)

	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFont, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow
	ConventionsGroup:insert(title)

	local header = display.newText( "CHECKER CONVENTIONS", display.contentCenterX, title.y+75, native.systemFontBold, 20 )
	ConventionsGroup:insert(header)

	local scrollConvView = widget.newScrollView({
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
	ConventionsGroup:insert(scrollConvView)

	-- begin button styling
	local cLogo = display.newImageRect("img/CheckerLogo.png",display.contentWidth-60,100)
	cLogo.x = display.contentCenterX
	cLogo.y = header.y+97
	ConventionsGroup:insert(cLogo)

	local border = display.newRect(display.contentCenterX,display.contentCenterY-40, display.contentWidth-20,340,14 )
	border.strokeWidth = 2
	border:setFillColor( 0,0,0,.6 )
	border:setStrokeColor(.96,.91,.04)
	ConventionsGroup:insert(border)

	local borderWhite = display.newRect(display.contentCenterX
	,display.contentCenterY-40, display.contentWidth-30,330,14 )
	borderWhite.strokeWidth = 2
	borderWhite:setFillColor( 0,0,0,0 )
	borderWhite:setStrokeColor(1,1,1)
	ConventionsGroup:insert(borderWhite)

	local usOptions = {
		text = "August 3-6\nKalamazoo, Michigan ", 
		x = display.contentCenterX, 
		y = cLogo.y+30, 
		width = display.contentWidth,
		height = 160,
		font = native.systemFont, 
		fontSize = 18 ,		
		align = "center"
	}

	local usOptions2 = {
		text = "2022 Checker Car\nClub Convention ", 
		x = display.contentCenterX, 
		y = usOptions.y+60, 
		width = display.contentWidth,
		height = 160,
		font = native.systemFont, 
		fontSize = 18 ,		
		align = "center"
	}

	local btnBorder = display.newRect(display.contentCenterX,usOptions2.y+20, display.contentWidth-100,58,14 )
	ConventionsGroup:insert(btnBorder)

	local openRegBtn = widget.newButton({
		width = display.contentWidth-106,
		height = 50,
		label = "2022 Registration",
		labelColor = { default={255,255,255}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = handleregisterBtnEvent
	})
	ConventionsGroup:insert(openRegBtn)

	local btnBorder2 = display.newRect(display.contentCenterX,usOptions2.y+100, display.contentWidth-100,58,14 )
	ConventionsGroup:insert(btnBorder2)

	local hotelRegBtn = widget.newButton({
		width = display.contentWidth-106,
		height = 50,
		label = "Hotel Reservation",
		labelColor = { default={255,255,255}, over={.96,.91,.04} },
		strokeColor = { default={.96,.91,.04},over={.96,.91,.04} },
		strokeWidth = 3,
		fontSize = 18,
		defaultFile = "img/bannerBTN.png",
		overFile = "img/bannerBTN.png",
		onEvent = handleregisterBtnEvent
	})
	ConventionsGroup:insert(hotelRegBtn)
	
	local upcoming = display.newText(usOptions)
	ConventionsGroup:insert(upcoming)

	local upcoming2 = display.newText(usOptions2)
	ConventionsGroup:insert(upcoming2)

	upcoming:setFillColor(1,1,1)
	upcoming2:setFillColor(.96,.91,.04)
	openRegBtn.x = display.contentCenterX
	openRegBtn.y = usOptions2.y+20
	btnBorder.strokeWidth = 2
	btnBorder:setFillColor( 0 )
	btnBorder:setStrokeColor( .96,.91,.04 )
	hotelRegBtn.x = display.contentCenterX
	hotelRegBtn.y = usOptions2.y+100
	btnBorder2.strokeWidth = 2
	btnBorder2:setFillColor( 0,0,0 )
	btnBorder2:setStrokeColor( .96,.91,.04)
	-- end 

	-- begin prior years 
	local cLogo2 = display.newImageRect("img/CheckerLogo.png",display.contentWidth-60,100)
	cLogo2.x = display.contentCenterX
	cLogo2.y = hotelRegBtn.y+450
	ConventionsGroup:insert(cLogo2)

	local priorBorder = display.newRect(display.contentCenterX,display.contentCenterY+display.contentHeight/2+275, display.contentWidth-20,display.contentHeight*1.5,14 )
	priorBorder.strokeWidth = 2
	priorBorder:setFillColor( 0,0,0,.6 )
	priorBorder:setStrokeColor(.96,.91,.04)
	ConventionsGroup:insert(priorBorder)

	local priorBorderWhite = display.newRect(display.contentCenterX
	,display.contentCenterY+display.contentHeight/2+275, display.contentWidth-30,display.contentHeight*1.5-10,14 )
	priorBorderWhite.strokeWidth = 2
	priorBorderWhite:setFillColor( 0,0,0,0 )
	priorBorderWhite:setStrokeColor(1,1,1)
	ConventionsGroup:insert(priorBorderWhite)

	local priorOptions = {
		text = "Prior Years - 2020 was \na year we want to forget.\nNo Convention",
		x = display.contentCenterX,
		y = openRegBtn.y+240,
		width = display.contentWidth,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
	}
	local prior = display.newText(priorOptions)
	prior:setFillColor(1,1,1)
	ConventionsGroup:insert(prior)
	-- end
	
	local p2021Btn = widget.newButton({
		label = "2021 - Springfield, IL",
		labelColor = { default={.96,.91,.04}, over={.96,.91,.04} },
		fontSize = 24,
		onEvent = handleregisterBtnEvent
	})
	p2021Btn.x = display.contentCenterX
	p2021Btn.y = prior.y+75
	ConventionsGroup:insert(p2021Btn)

	local p2019Btn = widget.newButton({
		width = display.contentWidth-30,
		height = 50,
		label = "2019 - Chattanooga, TN",
		labelColor = { default={.96,.91,.04}, over={.96,.91,.04} },
		fontSize = 24,
		onEvent = handleregisterBtnEvent
	})
	p2019Btn.x = display.contentCenterX
	p2019Btn.y = p2021Btn.y+50
	ConventionsGroup:insert(p2019Btn)

	local p2018Btn = widget.newButton({
		width = display.contentWidth-30,
		label = "2018 - Elkhart,IN*",
		labelColor = { default={.96,.91,.04}, over={.96,.91,.04} },
		fontSize = 24,
		onEvent = handleregisterBtnEvent
	})
	p2018Btn.x = display.contentCenterX
	p2018Btn.y = p2019Btn.y+50
	ConventionsGroup:insert(p2018Btn)

	local p2017Btn = widget.newButton({
		label = "2017 - Kalamazoo, MI",
		labelColor = { default={.96,.91,.04}, over={.96,.91,.04} },
		fontSize = 24,
		onEvent = handleregisterBtnEvent
	})
	p2017Btn.x = display.contentCenterX
	p2017Btn.y = p2018Btn.y+50
	ConventionsGroup:insert(p2017Btn)

	local p2016Btn = widget.newButton({
		label = "2016 - Hershey, PA",
		labelColor = { default={.96,.91,.04}, over={.96,.91,.04} },
		fontSize = 24,
		onEvent = handleregisterBtnEvent
	})
	p2016Btn.x = display.contentCenterX
	p2016Btn.y = p2017Btn.y+50
	ConventionsGroup:insert(p2016Btn)

	local p2015Btn = widget.newButton({
		label = "2015 - South Bend, IN",
		labelColor = { default={.96,.91,.04}, over={.96,.91,.04} },
		fontSize = 24,
		onEvent = handleregisterBtnEvent
	})
	p2015Btn.x = display.contentCenterX
	p2015Btn.y = p2016Btn.y+50
	ConventionsGroup:insert(p2015Btn)

	local p2014Btn = widget.newButton({
		label = "2014 - New York City, NY",
		labelColor = { default={.96,.91,.04}, over={.96,.91,.04} },
		fontSize = 24,
		onEvent = handleregisterBtnEvent
	})
	p2014Btn.x = display.contentCenterX
	p2014Btn.y = p2015Btn.y+50
	ConventionsGroup:insert(p2014Btn)

	local p2013Btn = widget.newButton({
		label = "2013 - Atlanta, GA",
		labelColor = { default={.96,.91,.04}, over={.96,.91,.04} },
		fontSize = 24,
		onEvent = handleregisterBtnEvent
	})
	p2013Btn.x = display.contentCenterX
	p2013Btn.y = p2014Btn.y+50
	ConventionsGroup:insert(p2013Btn)

	local p2012Btn = widget.newButton({
		label = "2012 - Dayton, OH",
		labelColor = { default={.96,.91,.04}, over={.96,.91,.04} },
		fontSize = 24,
		onEvent = handleregisterBtnEvent
	})
	p2012Btn.x = display.contentCenterX
	p2012Btn.y = p2013Btn.y+50
	ConventionsGroup:insert(p2012Btn)

	local p2011Btn = widget.newButton({
		label = "2011 - Springfield, IL",
		labelColor = { default={.96,.91,.04}, over={.96,.91,.04} },
		fontSize = 24,
		onEvent = handleregisterBtnEvent
	})
	p2011Btn.x = display.contentCenterX
	p2011Btn.y = p2012Btn.y+50
	ConventionsGroup:insert(p2011Btn)

	local p2010Btn = widget.newButton({
		label = "2010 and earlier...",
		labelColor = { default={.96,.91,.04}, over={.96,.91,.04} },
		fontSize = 24,
		onEvent = handleregisterBtnEvent
	})
	p2010Btn.x = display.contentCenterX
	p2010Btn.y = p2011Btn.y+50
	ConventionsGroup:insert(p2010Btn)
	
	-- insert elements into the Scroll view
	scrollConvView:insert(cLogo)
	scrollConvView:insert(cLogo2)
	scrollConvView:insert(border)
	scrollConvView:insert(borderWhite)
	scrollConvView:insert(btnBorder)
	scrollConvView:insert(btnBorder2)
	scrollConvView:insert(openRegBtn)
	scrollConvView:insert(hotelRegBtn)
	scrollConvView:insert(upcoming)
	scrollConvView:insert(upcoming2)
	scrollConvView:insert(priorBorder)
	scrollConvView:insert(priorBorderWhite)
	scrollConvView:insert(prior)
	scrollConvView:insert(p2021Btn)	
	scrollConvView:insert(p2019Btn)	
	scrollConvView:insert(p2018Btn)	
	scrollConvView:insert(p2017Btn)
	scrollConvView:insert(p2016Btn)	
	scrollConvView:insert(p2015Btn)	
	scrollConvView:insert(p2014Btn)	
	scrollConvView:insert(p2013Btn)
	scrollConvView:insert(p2012Btn)	
	scrollConvView:insert(p2011Btn)	
	scrollConvView:insert(p2010Btn)

	sceneGroup:insert(ConventionsGroup)
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