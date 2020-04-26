Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/StateMachine'

--states
require 'src/states/BaseState'
require 'src/states/StartState'

gTextures = {
	['background'] = love.graphics.newImage('graphics/background-space.png')
}

gFonts = {
	['small'] = love.graphics.newFont('fonts/font.ttf', 8),
	['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
	['large'] = love.graphics.newFont('fonts/font.ttf', 32)
}

gSounds = {
	['select'] = love.audio.newSource('sounds/select.wav', 'static')
}