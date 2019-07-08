require("Menu")
require("hajime")
require("Level1")
require("CodeBox")
require("ibuki")
require("dialogue")
Talkies = require("talkies")
utf8 = require("utf8")
answer = ""

local gameFineshed = false -- Flag que verifica se o jogo acabou
local startMenu = true -- Flag do Menu

function love.load()
	love.window.setTitle("World Ender")
	love.physics.setMeter(32)
	reality = love.physics.newWorld(0, 9.8 * 32, true)
	love.window.setMode(800, 640)
	hajime = newHajime(reality, 150, 86, 66, "imgs/left2.png", "imgs/right2.png")
	hajime.hajimeBody.body:setFixedRotation(true)
	ibukiBody()
	Level1Physics()
	Level1Music()
	Intro()
end

function love.update(dt)
	if (not codeBox1
		and not codeBox2
		and not codeBox3
		and not codeBox4)
		and not startMenu
		and not Talkies.isOpen()
	then
		reality:update(dt)
		hajime:update(dt)
	end
	Talkies.update(dt)
end

function love.mousepressed(x, y, button, istouch)
	if startMenu then
		local clickedOpp = mousePressed(x, y)
		if clickedOpp == "Iniciar o Jogo" then
			startMenu = false
		elseif clickedOpp == "Sair do Jogo" then
			love.event.quit()
		end
	end
end

function love.keypressed(key, scancode, isrepeat)
	hajime:keypressed(key, scancode, isrepeat)
	if codeBox1
		or codeBox2
		or codeBox3
		or codeBox4
	then
		writeAnswer(key)
	else
		answer = ""
	end
	verifyAnswer(key)
	if key == "return" then Talkies.onAction() end
	if gameFineshed and key == "return" then love.event.quit() end
end

function love.keyreleased(key)
	hajime:keyreleased(key)
end

function love.draw()
	if startMenu then
		drawGameName()
		drawMenuStart()
		drawMenuQuit()
	else
		if not gameFineshed then
			Level1Draw()
			if not codeBox1
				and not codeBox2
				and not codeBox3
				and not codeBox4
			then
				--love.graphics.polygon("fill", bottomFloor.body:getWorldPoints(bottomFloor.shape:getPoints()))
				hajime:draw()
				if not checkTouch() then
					drawDeadIbuki("imgs/deadIbuki.png")
				else
					drawIbuki("imgs/ibuki.png")
					gameFineshed = true
				end
				Talkies.draw()
			end
			if codeBox1
				or codeBox2
				or codeBox3
				or codeBox4
			then
				love.graphics.print(answer, 100, 380)
			end
		else
			love.graphics.setFont(love.graphics.newFont(40))
			love.graphics.setColor(0, 1, 0)
			love.graphics.print("Mundo destruido com sucesso", 150, 300)
			love.graphics.setColor(0, 0.5, 0)
			love.graphics.print("Mundo destruido com sucesso", 153, 300)
			love.graphics.setColor(1, 1, 1)
		end
	end
end
