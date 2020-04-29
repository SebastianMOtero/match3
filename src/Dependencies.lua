Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/StateMachine'
require 'src/Util'

require 'src/board'
require 'src/tile'

--states
require 'src/states/BaseState'
require 'src/states/StartState'
require 'src/states/BeginGameState'
require 'src/states/PlayState'
require 'src/states/GameOverState'

gTextures = {
	['background'] = love.graphics.newImage('graphics/background-space.png'),
	['earth-side'] = love.graphics.newImage('graphics/EarthSide.png'),
	['main'] = love.graphics.newImage('graphics/spaceItems.png')
}

gFrames = {
	['tiles'] = GenerateTileQuads(gTextures['main'])
}

gFonts = {
	['small'] = love.graphics.newFont('fonts/font.ttf', 8),
	['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
	['large'] = love.graphics.newFont('fonts/font.ttf', 32)
}

gSounds = {
	['music'] = love.audio.newSource('sounds/music3.mp3', 'static'),
	['select'] = love.audio.newSource('sounds/select.wav', 'static'),
	['error'] = love.audio.newSource('sounds/error.wav', 'static'),
	['match'] = love.audio.newSource('sounds/match.wav', 'static'),
	['clock'] = love.audio.newSource('sounds/clock.wav', 'static'),
	['game-over'] = love.audio.newSource('sounds/game-over.wav', 'static'),
	['next-level'] = love.audio.newSource('sounds/next-level.wav', 'static')
}