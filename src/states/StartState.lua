local positions = {}
local colorTitleTimer = 0.15

StartState = Class{__includes = BaseState}

function StartState:init()
	self.currentMenuItem = 1

	self.colors = {
		[1] = {255, 0, 0, 1},
		[2] = {255, 127, 0, 1},
		[3] = {255, 255, 0, 1},
		[4] = {0, 255, 0, 1},
		[5] = {0, 0, 255, 1},
		[6] = {75, 0, 130, 1},
	}
	
	self.letterTable = {
		{'M', -108},
		{'A', -68},
		{'T', -28},
		{'C', 12},
		{'H', 52},
		{'3', 112}
	}

	self.colorTimer = Timer.every(colorTitleTimer, function()		self.colors[0] = self.colors[6]
	
		for i = 6, 1, -1 do
			self.colors[i] = self.colors[i - 1]
		end
	end)

	self.transitionAlpha = 0

	self.pauseInput = false
end

function StartState:update(dt)
	if love.keyboard.wasPressed('escape') then
		love.event.quit()
	end

	Timer.update(dt)
end

function StartState:render()
	self:drawTitleText(-60)
end

function StartState:drawTitleText(y)
	love.graphics.setColor(255, 255, 255, 0.5)
	love.graphics.rectangle('fill', VIRTUAL_WIDTH /2 - 76, VIRTUAL_HEIGHT / 2 + y - 11, 150, 58, 6)

	-- love.graphics.setFont(gFonts['large'])
	-- self:drawblabl

	for i = 1, 6 do
		love.graphics.setColor(self.colors[i])
		love.graphics.printf(self.letterTable[i][1], 0, VIRTUAL_HEIGHT / 2 + y, VIRTUAL_WIDTH + self.letterTable[i][2], 'center')
	end
end
