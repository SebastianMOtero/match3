Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/StateMachine'

--states
require 'src/states/BaseState'
require 'src/states/StartState'

gTextures = {
	['background'] = love.graphics.newImage('graphics/background.png')
}