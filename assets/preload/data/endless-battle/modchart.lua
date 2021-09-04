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
        setCamZoom(.72)
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


end

function stepHit (step)

	if curStep == 128 then
		setCamZoom(1)
		swayingup4 = true
	end
	if curStep == 192 then
		setCamZoom(1)
		swayingup4 = false
	end
	if curStep == 126 then
		setCamZoom(1)
		swaying1 = true
	end
	if curStep == 512 then
		setCamZoom(1)
		swaying1 = false
		camerabeat = true
		swayingup3 = true
	end
	if curStep == 767 then
		setCamZoom(1)
		swaying1 = true
		camerabeat = false
		swayingup3 = false
	end
	if curStep == 832 then
		setCamZoom(1)
		swaying1 = false
		swayingup1 = true
	end
	if curStep == 1088 then
		setCamZoom(1)
		swayingup1 = false
		camerabeat = true
		swayingup4 = true
	end
	if curStep == 1280 then
		setCamZoom(1)
		swaying2 = true
		swayingup4 = false
	end
	if curStep == 1408 then
		setCamZoom(1)
		swaying2 = false
		swaying3 = true
	end
	if curStep == 1536 then
		setCamZoom(1)
		swaying3 = false
	end
	if curStep == 1664 then
		setCamZoom(1)
		swaying1 = false
		camerabeat = true
		swayingup3 = true
	end
	if curStep == 2111 then
		setCamZoom(1)
		swaying4 = true
		camerabeat = false
		swayingup3 = false
	end
	if curStep == 2176 then

		swaying4 = false
		swaying3 = true
	end
	if curStep == 2176 then

		swaying4 = false
		swaying3 = true
	end
	if curStep == 2239 then

		swaying3 = false
		swaying2 = true
	end
	if curStep == 2303 then
		setCamZoom(1)
		swaying2 = false
		camerabeat = true
		swayingup4 = true
	end
	if curStep == 2431 then
		setCamZoom(2)
		swaying2 = false
		camerabeat = false
		swayingup4 = false
	end
end