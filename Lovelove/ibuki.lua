
--Fun��o que cria o corpo da personagem(Ibuki)
function ibukiBody()
	ibukiBody = love.physics.newBody(reality, 80, 590, "static")
	ibukiShape = love.physics.newRectangleShape(52, 58)
	ibukiFixture = love.physics.newFixture(ibukiBody, ibukiShape)
end

--Fun��o que desenha a personagem(Ibuki) em p�
function drawIbuki(filename)
	ibuki = love.graphics.newImage(filename)
	love.graphics.draw(ibuki, ibukiBody:getX() - 26, ibukiBody:getY() - 38)
end

--Fun��o que desenha a personagem(Ibuki) "morta" no ch�o
function drawDeadIbuki(filename)
	ibuki = love.graphics.newImage(filename)
	love.graphics.draw(ibuki, ibukiBody:getX() - 30, ibukiBody:getY() - 20)
end

--Fun��o que checa se o corpo do personagem principal(World Ender) e o corpo da personagem(Ibuki) est�o se tocando hehe
function checkTouch()
	if hajime.hajimeBody.body:isTouching(ibukiBody) then
		return true
	end
end
