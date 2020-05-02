Tile = Class{}

function Tile:init(x, y, item)
	self.gridX = x
	self.gridY = y

	self.x = (self.gridX - 1) * 32
	self.y = (self.gridY - 1) * 32

	self.item = item
end

function Tile:render(x, y)
	love.graphics.setColor(0.1, 0.1, 0.1, 0.9)
	love.graphics.draw(gTextures['main'], gFrames['tiles'][self.item][1], self.x + x + 2, self.y + y + 2)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.draw(gTextures['main'], gFrames['tiles'][self.item][1], self.x + x, self.y + y)
end