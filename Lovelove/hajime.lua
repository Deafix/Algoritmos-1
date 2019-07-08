require("AnAL")
require("hajimeBody")

Hajime = {}
Hajime.__index = Hajime

--Função que cria o personagem
function newHajime(world, xSpeed, charWidth, charHeight, leftFilename, rightFilename)
	local a = {}

	a.xSpeed = xSpeed
	a.jumpHeight = jumpHeight
	a.widthImg = charWidth
	a.heigthImg = charHeight
	a.leftImg = love.graphics.newImage(leftFilename)
	a.rightImg = love.graphics.newImage(rightFilename)
	a.hajimeAnimationLeft = newAnimation(a.leftImg, a.widthImg, a.heigthImg, 0.2, 0)
	a.hajimeAnimationRight = newAnimation(a.rightImg, a.widthImg, a.heigthImg, 0.2, 0)
	a.hajimeAnimation = a.hajimeAnimationRight
	a.lastdt = 0
	a.dir = nil
	a.move = false
	a.hajimeBody = newHajimeBody(world, 70, 120, 50, charHeight)
	return setmetatable(a, Hajime)
end

--Função que verifica se as teclas de movimento foram pressionadas
function Hajime:keypressed(key, scancode, isrepeat)
	if key == "d" then
		self.dir = "right"
		self.move = true
		self.hajimeAnimation:update(self.lastdt * 20)
		self.hajimeAnimation = self.hajimeAnimationRight
	end
	if key == "a" then
		self.dir = "left"
		self.move = true
		self.hajimeAnimation:update(self.lastdt * 20)
		self.hajimeAnimation = self.hajimeAnimationLeft
	end
end

--Função que verifica se as teclas de movimento foram soltas
function Hajime:keyreleased(key)
	if key == "d" then
		if self.dir == "right" then
			self.dir = nil
			self.move = false
			self.hajimeBody.body:setLinearVelocity(0, 0)
		end
		self.hajimeAnimation:seek(1)
	end
	if key == "a" then
		if self.dir == "left" then
			self.dir = nil
			self.move = false
			self.hajimeBody.body:setLinearVelocity(0, 0)
		end
		self.hajimeAnimation:seek(1)
	end
end

--Função que atualiza a posiçao do personagem no espaço de acordo com o tempo
function Hajime:update(dt)
	self.lastdt = dt
	if self.move == true then
		if self.dir == "right" then
			self.hajimeBody.body:setLinearVelocity(self.xSpeed, 0)
		elseif self.dir == "left" then
			self.hajimeBody.body:setLinearVelocity(-self.xSpeed, 0)
		end
		self.hajimeAnimation:update(dt)
	end
end

--Função que desenha o personagem na tela
function Hajime:draw()
	self.hajimeAnimation:draw(self.hajimeBody:getX() - 44, self.hajimeBody:getY() - 33)
end
