HajimeBody = {}
HajimeBody.__index = HajimeBody

--Corpo do personagem
function newHajimeBody(world, x, y, w, h)
	local a = {}
	a.body = love.physics.newBody(world, x, y, "dynamic")
	a.shape = love.physics.newRectangleShape(w, h)
	a.fixture = love.physics.newFixture(a.body, a.shape,500)
	return setmetatable(a, HajimeBody)
end

--Função que retorna o x do corpo do personagem
function HajimeBody:getX()
	return self.body:getX()
end

--Função que retorna o y do corpo do personagem
function HajimeBody:getY()
	return self.body:getY()
end
