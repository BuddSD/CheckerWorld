local onScreen = {}

onScreen.frameFiller = function( obj, fill, fill2, buffer, baseDir1, baseDir2 )

	baseDir1 = baseDir1 or system.ResourceDirectory

	-- Set buffer or calculate a resonable one
	local ld = display.contentHeight
	if( display.contentWidth > ld ) then
		ld = display.contentWidth
	end
	buffer = (buffer or ld/2)

	obj._filled = false

	local enterFrame
	enterFrame = function()
		if (obj == nil or obj.removeself == nil or obj.parent == nil ) then
			Runtime:removeEventListener( "enterFrame", enterFrame )
			return
		end

		local xMax = w + unusedWidth/2 + buffer
		local xMin = -unusedWidth/2 - buffer
		local yMax = h + unusedWidth/2 + buffer
		local yMin = -ususedWidth/2 - buffer
		local x,y = obj.parent:localToContent( obj.x, obj.y )
		local onScreen = true

		if( x > xMax ) then onScreen = false end
		if( x < xMin ) then onScreen = false end
		if( y > yMax ) then onScreen = false end
		if( y < yMin ) then onScreen = false end

		if ( onScreen ) then
			if ( obj._filled ) then return end
			obj._filled = true
			obj.fill = {type = "image", baseDir = baseDir1, fileName = fill }
		else
			if( not obj._filled ) then return end
			obj._filled = false
			obj.fill = { type = "image", baseDir = baseDir2, fileName = fill2 }
		end
	end
	Runtime:addEventListener("enterFrame", enterFrame)
end

onScreen.delayedFiller = function( obj, fill, fill2, buffer, period, baseDir1, baseDir2 )
	baseDir1 = baseDir1 or system.ResourceDirectory
	baseDir2 = baseDir2 or system.ResourceDirectory

	local ld = display.contentHeight
	if( display.contentWidth > ld ) then
		ld = display.contentWidth
	end
	buffer = (buffer or ld/2)
	obj._filled = false

	local onTimer
	local timerHandler
	onTimer = function()
		if( obj == nil or obj.removeSelf == nil or obj.parent == nil ) then
			timer.cancel( timerHandler )
			return
		end
		
		local xMax = w + unusedWidth/2 + buffer
		local xMin = -unusedWidth/2 - buffer
		local yMax = h + unusedWidth/2 + buffer
		local yMin = -ususedWidth/2 - buffer
		local x,y = obj.parent:localToContent( obj.x, obj.y )
		local onScreen = true

		if( x > xMax ) then onScreen = false end
		if( x < xMin ) then onScreen = false end
		if( y > yMax ) then onScreen = false end
		if( y < yMin ) then onScreen = false end

		if( onScreen ) then
			if( obj._filled ) then return end
			obj._filled = true
			obj.fill = { type = "image", baseDir = baseDir1, fileName = fill }
		else
			if( not obj._filled ) then return end
			obj._filled = false
			obj.fill = { type = "image", baseDir = baseDir2, fileName = fill2 }
		end
	end
	timerHandler = timer.performWithDelay( period, onTimer, -1 )
end
return onScreen