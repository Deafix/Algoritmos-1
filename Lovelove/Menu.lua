require("mousePosition")

local backgroundMenu = nil

--Função que desenha o nome do jogo no menu inicial
function drawGameName()
	backgroundMenu = love.graphics.newImage("imgs/Binary.jpg")
	love.graphics.draw(backgroundMenu, 0, 0)
	love.graphics.setFont(love.graphics.newFont(64))
	love.graphics.setColor(0.98, 0.5, 0.45)
	love.graphics.print("World Ender", 228, 100)
	love.graphics.setColor(0, 1, 1)
	love.graphics.print("World Ender", 232, 100)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("World Ender", 230, 100)
	love.graphics.setColor(1, 1, 1)
	love.graphics.setFont(love.graphics.newFont(12))
end

--Função que desenha o botão de iniciar o jogo
function drawMenuStart()
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("fill", 320 - 1, 300 - 1, 150 + 2, 40 + 2)
	love.graphics.setColor(0, 0.75, 0.75)
	love.graphics.rectangle("fill", 320, 300, 150, 40)
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("Iniciar o Jogo", 330, 305)

end

--Função que desenha o botão de sair do jogo
function drawMenuQuit()
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("fill", 319, 349, 152, 42)
	love.graphics.setColor(0, 0.75, 0.75)
	love.graphics.rectangle("fill", 320, 350, 150, 40)
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("Sair do Jogo", 330, 355)

end

--Função que verifica se foi clicado dentro dos botões do menu
function mousePressed(mouseX, mouseY)
	if checkMousePos(mouseX, mouseY, 320, 300, 150, 40) then
		return "Iniciar o Jogo"
	end

	if checkMousePos(mouseX, mouseY, 320, 350, 150, 40) then
		return "Sair do Jogo"
	end
	return ""
end
