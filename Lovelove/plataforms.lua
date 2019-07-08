local Plataform = {}
Plataform.__index = Plataform

function newPlataform(world, xBody, yBody, width, height)
	local a = {}

	a.body = love.physics.newBody(world, xBody, yBody, "static")
	a.shape = love.physics.newRectangleShape(width, height)
	a.fixture = love.physics.newFixture(a.body, a.shape)
	return setmetatable(a, Plataform)
end


