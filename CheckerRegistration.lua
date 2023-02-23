-----------------------------------------------------------------------------------------
--
-- CheckerRegistration.lua
--
-----------------------------------------------------------------------------------------

local composer = require "composer" 
local widget = require "widget"
local scene = composer.newScene()

function scene:create( event )
	-- create black background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight+60 )
	background:setFillColor(0,0,0)
	
	local logo = display.newImageRect( "img/CheckerWorldLogo.png", 95, 65 )
	logo.x = display.contentCenterX-100
	logo.y = display.contentCenterY-300
	
	-- create some text
	local title = display.newText( "CHECKER WORLD", logo.x+155, logo.y, native.systemFont, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow

	local header = display.newText( "CHECKER REGISTRATION", display.contentCenterX, title.y+75, native.systemFontBold, 20 )
	title:setFillColor( .96,.91,.04 )	-- yellow

	local scrollRegView = widget.newScrollView({
		top = 40,
		left = 10,
		width = display.contentWidth-20,
		height = display.contentHeight,
		scrollWidth = display.contentWidth,
		scrollHeight = 1,
		backgroundColor = {0,0,0},
		horizontalScrollDisabled = true,
		listener = scrollListener
	})

	-- Documents intro text
	local intro = display.newText("Your Checker will be shown and described on one or more web sites of the Checker Car Club such as Checker World and/or the Checker World Facebook Group. It may also be used in the Checker Car Club quarterly newsletter 'Checkerboard News'.\n\nYour personal information will not be shared with anyone (e.g. name, address, email, phone number, VIN, Purchase Price) without your permission.\n\nAttach at least one photo of your car although the more photos you submit the better.\n\nBy clicking the SUBMIT button, you agree to share this information with the public except for the personal information listed above.\n\n\n", display.contentCenterX-10, header.y+250, display.contentWidth-20,display.contentHeight,native.systemFont, 18 )
	
	-- END intro
	local instructions = display.newText("Instructions: \nSubmit only one car per form!",display.contentCenterX-30, intro.y+275, native.systemFont, 18)
	local num1 = display.newText("1. Review the form to see what \ninformation we need to register \nyour Checker.",display.contentCenterX-20, instructions.y+75, native.systemFont, 18)
	local num2 = display.newText("2. Collect the information.",display.contentCenterX-45, num1.y+75, native.systemFont, 18)
	local num3 = display.newText("3. Take digital photos of your \ncar (at least one photo is \nrequired).",display.contentCenterX-30, num2.y+75, native.systemFont, 18)
	local num4 = display.newText("4. Fill out the form and attach \nthe photos.",display.contentCenterX-27, num3.y+75, native.systemFont, 18)
	local num5 = display.newText("5. Click the SUBMIT button.",display.contentCenterX-35, num4.y+75, native.systemFont, 18)
	-- Create Registration Form
	local RegFormGrp = display.newGroup()
	RegFormGrp.y = num5.y+325
	local regBorder = display.newRect(display.contentCenterX-10,num5.y+360, display.contentWidth-20,display.contentHeight*3.15,14 )
	regBorder.strokeWidth = 2
	regBorder:setFillColor( 0 )
	regBorder:setStrokeColor(.96,.91,.04)
	local formHeader = display.newText("CHECKER REGISTRATION",display.contentCenterX-10, num5.y-350, native.systemFontBold, 20)
	local formIntro = display.newText(
		"Use the TAB button to move from field to field. You can also scroll down to move between fields. You are not finished until you have clicked on the SUBMIT button!",
		display.contentCenterX+5, 
		formHeader.y+75,
		display.contentWidth-24,
		0,
		native.systemFont, 
		18)
		-- begin vehicle info
		local submitDateLbl = display.newText("SUBMIT DATE (yyyy-mm-dd)",display.contentCenterX-65, formIntro.y+80, native.systemFont, 12)
		local submitDateFld = native.newTextField(display.contentCenterX-10,submitDateLbl.y+27,display.contentWidth-40, 30)
		local modelLbl = display.newText("MODEL",40, submitDateFld.y+40, native.systemFont, 12)
		local modelFld = native.newTextField(display.contentCenterX-10,modelLbl.y+27,display.contentWidth-40, 30)
		local yearLbl = display.newText("YEAR",35, modelFld.y+40, native.systemFont, 12)
		local yearFld = native.newTextField(display.contentCenterX-10,yearLbl.y+27,display.contentWidth-40, 30)
		local descriptionLbl = display.newText("DESCRIPTION",60, yearFld.y+40, native.systemFont, 12)
		local descriptionFld = native.newTextBox(display.contentCenterX-10,descriptionLbl.y+60,display.contentWidth-40, 100)
		local vinLbl = display.newText("VIN",35, descriptionFld.y+70, native.systemFont, 12)
		local vinFld = native.newTextField(display.contentCenterX-10,vinLbl.y+27,display.contentWidth-40, 30)
		local purchaseDateLbl = display.newText("YEAR PURCHASED",75, vinFld.y+40, native.systemFont, 12)
		local purchaseDateFld = native.newTextField(display.contentCenterX-10,purchaseDateLbl.y+27,display.contentWidth-40, 30)
		local purchasePriceLbl = display.newText("PURCHASE PRICE (USD)",90, purchaseDateFld.y+40, native.systemFont, 12)
		local purchasePriceFld = native.newTextField(display.contentCenterX-10,purchasePriceLbl.y+27,display.contentWidth-40, 30)
		-- end vehicle info
		-- begin owner info
		local lNameLbl = display.newText("LAST NAME",50, purchasePriceFld.y+40, native.systemFont, 12)
		local lNameFld = native.newTextField(display.contentCenterX-10,lNameLbl.y+27,display.contentWidth-40, 30)
		local fNameLbl = display.newText("FIRST NAME",50, lNameFld.y+40, native.systemFont, 12)
		local fNameFld = native.newTextField(display.contentCenterX-10,fNameLbl.y+27,display.contentWidth-40, 30)
		local custCityLbl = display.newText("CITY / TOWN",50, fNameFld.y+40, native.systemFont, 12)
		local custCityFld = native.newTextField(display.contentCenterX-10,custCityLbl.y+27,display.contentWidth-40, 30)
		local stateLbl = display.newText("STATE",35, custCityFld.y+40, native.systemFont, 12)
		local stateFld = native.newTextField(display.contentCenterX-10,stateLbl.y+27,display.contentWidth-40, 30)
		local countryLbl = display.newText("COUNTRY",45, stateFld.y+40, native.systemFont, 12)
		local countryFld = native.newTextField(display.contentCenterX-10,countryLbl.y+27,display.contentWidth-40, 30)
		local zipLbl = display.newText("ZIP",25, countryFld.y+40, native.systemFont, 12)
		local zipFld = native.newTextField(display.contentCenterX-10,zipLbl.y+27,display.contentWidth-40, 30)
		local emailLbl = display.newText("EMAIL",35, zipFld.y+40, native.systemFont, 12)
		local emailFld = native.newTextField(display.contentCenterX-10,emailLbl.y+27,display.contentWidth-40, 30)
		local phoneLbl = display.newText("PHONE",40, emailFld.y+40, native.systemFont, 12)
		local phoneFld = native.newTextField(display.contentCenterX-10,phoneLbl.y+27,display.contentWidth-40, 30)
		local clubIdLbl = display.newText("CCCoA ID",45, phoneFld.y+40, native.systemFont, 12)
		local clubIdFld = native.newTextField(display.contentCenterX-10,clubIdLbl.y+27,display.contentWidth-40, 30)
		local mapBoxLbl = display.newText("MAPBOX LINK",60, clubIdFld.y+40, native.systemFont, 12)
		local mapBoxFld = native.newTextField(display.contentCenterX-10,mapBoxLbl.y+27,display.contentWidth-40, 30)
		-- end owner info

		submitBtn = widget.newButton({
        width = 200,
        height = 50,
        label = "SUBMIT",
        labelColor = { default={0,0,0}, over={0,0,0} },
        defaultFile = "img/YellowBtn.png",
        overFile = "img/YellowBtnPress.png",
        onEvent = handleSignInBtnEvent
		})
		submitBtn.x = display.contentCenterX-20
		submitBtn.y = mapBoxFld.y+75
	-- Insert elements into the ScrollView

	scrollRegView:insert(intro)	
	scrollRegView:insert(instructions)
	scrollRegView:insert(num1)
	scrollRegView:insert(num2)
	scrollRegView:insert(num3)
	scrollRegView:insert(num4)
	scrollRegView:insert(num5)

	scrollRegView:insert(RegFormGrp)
	scrollRegView:insert(regBorder)
	scrollRegView:insert(formHeader)
	scrollRegView:insert(formIntro)
	scrollRegView:insert(submitDateLbl)
	scrollRegView:insert(submitDateFld)
	scrollRegView:insert(modelLbl)
	scrollRegView:insert(modelFld)
	scrollRegView:insert(yearLbl)
	scrollRegView:insert(yearFld)
	scrollRegView:insert(descriptionLbl)
	scrollRegView:insert(descriptionFld)
	scrollRegView:insert(vinLbl)
	scrollRegView:insert(vinFld)
	scrollRegView:insert(purchaseDateLbl)
	scrollRegView:insert(purchaseDateFld)
	scrollRegView:insert(purchasePriceLbl)
	scrollRegView:insert(purchasePriceFld)
	scrollRegView:insert(lNameLbl)
	scrollRegView:insert(lNameFld)
	scrollRegView:insert(fNameLbl)
	scrollRegView:insert(fNameFld)
	scrollRegView:insert(custCityLbl)
	scrollRegView:insert(custCityFld)
	scrollRegView:insert(stateLbl)
	scrollRegView:insert(stateFld)
	scrollRegView:insert(countryLbl)
	scrollRegView:insert(countryFld)
	scrollRegView:insert(zipLbl)
	scrollRegView:insert(zipFld)
	scrollRegView:insert(emailLbl)
	scrollRegView:insert(emailFld)
	scrollRegView:insert(phoneLbl)
	scrollRegView:insert(phoneFld)
	scrollRegView:insert(clubIdLbl)
	scrollRegView:insert(clubIdFld)
	scrollRegView:insert(mapBoxLbl)
	scrollRegView:insert(mapBoxFld)
	scrollRegView:insert(submitBtn)

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