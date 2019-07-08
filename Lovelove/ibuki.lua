
--Função que cria o corpo da personagem(Ibuki)
function ibukiBody()
	ibukiBody = love.physics.newBody(reality, 80, 590, "static")
	ibukiShape = love.physics.newRectangleShape(52, 58)
	ibukiFixture = love.physics.newFixture(ibukiBody, ibukiShape)
end

--Função que desenha a personagem(Ibuki) em pé
function drawIbuki(filename)
	ibuki = love.graphics.newImage(filename)
	love.graphics.draw(ibuki, ibukiBody:getX() - 26, ibukiBody:getY() - 38)
end

--Função que desenha a personagem(Ibuki) "morta" no chão
function drawDeadIbuki(filename)
	ibuki = love.graphics.newImage(filename)
	love.graphics.draw(ibuki, ibukiBody:getX() - 30, ibukiBody:getY() - 20)
end

--Função que checa se o corpo do personagem principal(World Ender) e o corpo da personagem(Ibuki) estão se tocando hehe
function checkTouch()
	if hajime.hajimeBody.body:isTouching(ibukiBody) then
		return true
	end
end
