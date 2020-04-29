love.graphics.setDefaultFilter('nearest', 'nearest')

require 'src/Dependencies'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

BACKGROUND_SCROLL_SPEED = 60

function love.load()

	love.window.setTitle('Match 3')
	
	math.randomseed(os.time())

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizable = true,
		canvas = true
	})

	gSounds['music']:setLooping(true)
	gSounds['music']:play()

	gStateMachine = StateMachine {
		['start'] = function() return StartState() end,
		['begin-game'] = function() return BeginGameState() end,
		['play'] = function() return PlayState() end,
		['game-over'] = function() return GameOverState() end
	}
	gStateMachine:change('start')

	backgroundX = 0

	love.keyboard.keysPressed = {}
end

function love.resize(w, h)
	push:resize(w, h)
end

function love.keypressed(key)
	love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
	return love.keyboard.keysPressed[key]
end

function love.update(dt)
	backgroundX = backgroundX - BACKGROUND_SCROLL_SPEED * dt

	if backgroundX <= -1024 + VIRTUAL_WIDTH then
		backgroundX = 0
	end
	
	gStateMachine:update(dt)

	love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()

	love.graphics.draw(gTextures['background'], backgroundX, 0)
	love.graphics.draw(gTextures['earth-side'], 0, 0)
	gStateMachine:render()

	push:finish()
end

