BeginGameState = Class{__includes = BaseState}

function BeginGameState:init()
	self.transitionAlpha = 1

	self.board = Board(VIRTUAL_WIDTH - 272, 16)

	self.levelLabelY = -64
end

function BeginGameState:enter(def)
	self.level = def.level

	--Transition screen foreground
	Timer.tween(1, {
		[self] = {transitionAlpha = 0}
	}):finish(function() 
		--show Level Label
		Timer.tween(0.25, {
			[self] = {levelLabelY = VIRTUAL_HEIGHT / 2 - 8}
		}):finish(function() 
			--wait 1 second
			Timer.after(1, function() 
				--hide the level label
				Timer.tween(0.25, {
					[self] = {levelLabelY = VIRTUAL_HEIGHT + 30}
				}):finish(function() 
					--Start game
					gStateMachine:change('play', {
						level = self.level,
						board = self.board
					})
				end)
			end)
		end)
	end)
end

function BeginGameState:update(dt)
	Timer.update(dt)
end

function BeginGameState:render()
	self.board:render()

	--Level label
	love.graphics.setColor(95, 205, 228, 0.1)
	love.graphics.rectangle('fill', 0, self.levelLabelY - 8, VIRTUAL_WIDTH, 48)
	love.graphics.setColor(255, 255, 255, 1)
	love.graphics.printf('Level ' .. tostring(self.level), 0, self.levelLabelY, VIRTUAL_WIDTH, 'center')

	--Transition screen foreground
	love.graphics.setColor(255, 255, 255, self.transitionAlpha)
	love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end