local wbfb = false
local waitForTween = false
local move = false
local camerabeat = false
local swaying1 = false
local swaying2 = false
local swaying3 = false
local swaying4 = false
local swayingup1 = false
local swayingup2 = false
local swayingup3 = false
local swayingup4 = false
local swayingbiggest = false
local swayingbiggest2 = false
local swayingdown = false

function beatHit (beat)
    if wbfb then
	    waitForBeat = false
    end
    if camerabeat then
        setCamZoom(.8)
    end
end

function resetTween()
	waitForTween = false
end

function setDefault(id)
	move = true
	swayingForce = 0
	_G['defaultStrum'..id..'X'] = getActorX(id)
	print('angle 0')
	setActorAngle(0,id)
end

function update (elapsed)
    local currentBeat = (songPos / 1000)*(bpm/60)
if shakearrow == true then
	for i=0,7 do
		setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0) * math.pi), i)
		setActorY(_G['defaultStrum'..i..'Y'] + 0 * math.cos((currentBeat + i*0) * math.pi), i)
	end
end
if shakearrow2 == true then
	for i=0,7 do
		setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0) * math.pi), i)
		setActorY(_G['defaultStrum'..i..'Y'] + 0 * math.cos((currentBeat + i*0) * math.pi), i)
	end
end
if shakearrow3 == true then
	for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat + i*0) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0) * math.pi), i)
	end
end
	if swaying1 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 12 * math.sin((currentBeat + i*0.06)), i)
		end
	end
	if swaying2 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 24 * math.sin((currentBeat + i*0.08)), i)
		end
	end
	if swaying3 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.12)), i)
		end
	end
	if swaying4 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0.04) * math.pi), i)
		end
	end
	if swayingup1 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 18 * math.sin((currentBeat + i*0.08) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 4 * math.cos((currentBeat + i*0.04) * math.pi) ,i)
		end
	end
	if swayingup2 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 6 * math.sin((currentBeat + i*0.06) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 12 * math.cos((currentBeat + i*0.10) * math.pi) ,i)
		end
	end
	if swayingup3 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 8 * math.sin((currentBeat + i*0.07) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 14 * math.cos((currentBeat + i*0.11) * math.pi) ,i)
		end
	end
	if swayingup4 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 12 * math.sin((currentBeat + i*0.10) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*0.16) * math.pi) ,i)
		end
	end
	if swayingbiggest then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 280 * math.sin((currentBeat + i*0)) + 350, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 50 * math.cos((currentBeat + i*5) * math.pi),i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 170 * math.sin((currentBeat + i*0)) - 275, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 50 * math.cos((currentBeat + i*5) * math.pi),i)
		end
	end
	if swayingbiggest2 then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 310 * math.sin((currentBeat + i*0)) + 350, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 60 * math.cos((currentBeat + i*5.4) * math.pi),i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 310 * math.sin((currentBeat + i*0)) - 275, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 60 * math.cos((currentBeat + i*5.4) * math.pi),i)
		end
	end
	if swayingdown then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin((currentBeat + i*0.8) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] - 20 * math.cos((currentBeat + i*0.12) * math.pi) ,i)
		end
	end
	if swayingbiggest3 then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 320 * math.sin((currentBeat + i*0)) + 350, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 70 * math.cos((currentBeat + i*5.45) * math.pi),i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 320 * math.sin((currentBeat + i*0)) - 275, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 79 * math.cos((currentBeat + i*5.45) * math.pi),i)
		end
	end
end

function start (song)
    hudX = getHudX()
    hudY = getHudY()

	BlackFade = makeSprite('BlackFade','blackfade', false)

	setActorX(350,'blackfade')
	setActorY(500,'blackfade')
	setActorAlpha(0,'blackfade')
	setActorScale(2,'blackfade')
end

function stepHit (step)
    if step == 1 then
		showOnlyStrums = true
	end
	if step == 2371 then
		tweenFadeIn(BlackFade,1,0.01)	
        end
	if step == 2369 then
		strumLine1Visible = true
        end
	if step == 2369 then
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
    end
	if step == 2625 then
		tweenFadeOut(BlackFade,0,0.01)	
	end
	if step == 834 then
		swayingdown = true
		camerabeat = true
		showOnlyStrums = true
	end
	if curStep == 832 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 3136 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 3392 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 960 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 1088 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 1216 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 1344 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if step == 1344 then
		camerabeat = false
		swayingdown = false
	end
	if curStep == 1600 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 1856 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 1984 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 2112 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 2240 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 2368 then
		setCamZoom(1)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if step == 1856 then
		camerabeat = true
		swayingdown = true
		showOnlyStrums = true
	end
	if step == 2368 then
		swayingdown = false
		camerabeat = false
                swaying1 = true
		showOnlyStrums = false	
        end 
	if step == 2624 then
		setCamZoom(2)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if step == 3712 then
		swayingdown = true
		camerabeat = true
		showOnlyStrums = true
	end
	if step == 4224 then
		swayingdown = false
		camerabeat = false
		showOnlyStrums = false
                swaying1 = true
	end
	if step == 3712 then
		setCamZoom(2)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if step == 3840 then
		setCamZoom(2)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if step == 3968 then
		setCamZoom(2)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if step == 4096 then
		setCamZoom(2)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if step == 4224 then
		setCamZoom(2)
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.7, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.3, 'setDefault')
		end
	end
	if curStep == 10 or curStep == 260 or curStep == 770 or curStep == 1028 or curStep == 1285 or curStep == 1540 or curStep == 1796 or curStep == 2058 or curStep == 2431 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.6, 'setDefault')
        end
    end   
end