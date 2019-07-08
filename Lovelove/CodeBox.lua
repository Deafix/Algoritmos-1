require("challenge1")
require("challenge2Ora")
require("challenge2Blu")
require("challenge3")
require("dialogue")

-- Verificar se está do lado da caixa de cima
function sideToUpperBox()
	if (hajime.hajimeBody:getX() >= 720 and hajime.hajimeBody:getY() < 160) then
		return true
	end
end

-- Verificar se está do lado da caixa do meio laranja
function sideToMiddleOrange()
	if hajime.hajimeBody:getX() <= 80 and (hajime.hajimeBody:getY() > 192 and hajime.hajimeBody:getY() < 320) then
		return true
	end
end

-- Verificar se está do lado da caixa do meio azul
function sideToMiddleBlue()
	if hajime.hajimeBody:getX() >= 720 and (hajime.hajimeBody:getY() > 192 and hajime.hajimeBody:getY() < 320) then
		return true
	end
end

-- Verificar se está do lado da caixa de baixo
function sideToBottomBox()
	if hajime.hajimeBody:getX() <= 80 and (hajime.hajimeBody:getY() > 352 and hajime.hajimeBody:getY() < 480) then
		return true
	end
end

-- Escrever na tela como entrar no código e como sair dele
function writeTip()
	if (sideToUpperBox()
		or sideToMiddleOrange()
		or sideToMiddleBlue()
		or sideToBottomBox())
		and (codeBox1 == false
		and codeBox2 == false
		and codeBox3 == false
		and codeBox4 == false)
	then
		love.graphics.setFont(love.graphics.newFont(30))
		love.graphics.print("Aperte F para acessar o codigo", 170, 40)
		love.graphics.setFont(love.graphics.newFont(12))
	end
	if codeBox1
		or codeBox2
		or codeBox3
		or codeBox4
	then
		love.graphics.setFont(love.graphics.newFont(30))
		love.graphics.print("Para sair aperte R", 260, 20)
		love.graphics.setFont(love.graphics.newFont(12))
	end
end

-- Desenhar o código da caixa superior na tela
function drawCodeUpBox()
	if sideToUpperBox() and love.keyboard.isDown("f") then
		codeBox1 = true
	end
	codeChallenge1()
end

--Desenhar o código da caixa laranja do piso do meio
function drawCodeMOrange()
	if sideToMiddleOrange() and love.keyboard.isDown("f") then
		codeBox2 = true
	end
	codeChallenge2Ora()
end

--Desenhar o código da caixa azul do piso do meio
function drawCodeMBlue()
	if sideToMiddleBlue() and love.keyboard.isDown("f") then
		codeBox3 = true
	end
	codeChallenge2Blu()
end

--Desenhar o código da caixa do ultimo piso
function drawCodeBottom()
	if sideToBottomBox() and love.keyboard.isDown("f") then
		codeBox4 = true
	end
	codeChallenge3()
end

-- Permitir a escrita da resposta
function writeAnswer(key)
	if key and key:match( '^[%w%s]$' ) then
		answer = answer..key
	end

	if key == "backspace" then
		local byteoffset = utf8.offset(answer, -1)
		if byteoffset then
			answer = string.sub(answer, 1, byteoffset - 1)
		end
	end
end

-- Verifica a resposta das caixas
function verifyAnswer(key)
	if codeBox1 and key == "return" then
		if tryChallenge1(answer) then
			Box1Fineshed = true
		end
	end

	if codeBox2 and key == "return" then
		if answerMiddle(answer) then
			Box2Fineshed = true
		end
	end

	if codeBox3 and key == "return" then
		if answerMiddle(answer) then
			Box3Fineshed = true
		end
	end

	if codeBox4 and key == "return" then
		if answerBottom(answer) then
			Box4Fineshed = true
		end
	end
end

-- Sair do código
function exitSourceCode()
	if codeBox1 and love.keyboard.isDown("r") then
		codeBox1 = false
	end
	if codeBox2 and love.keyboard.isDown("r") then
		codeBox2 = false
	end
	if codeBox3 and love.keyboard.isDown("r") then
		codeBox3 = false
	end
	if codeBox4 and love.keyboard.isDown("r") then
		codeBox4 = false
	end
end
