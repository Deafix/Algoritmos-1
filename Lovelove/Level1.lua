require("plataforms")
require("CodeBox")
require("dialogue")

codeBox1 = false	-- Flag que indica se o usuário está no código da primeira caixa
codeBox2 = false	-- Flag que indica se o usuário está no código da segunda caixa
codeBox3 = false	-- Flag que indica se o usuário está no código da terceira caixa
codeBox4 = false	-- Flag que indica se o usuário está no código da quarta caixa
Box1Fineshed = false	-- Flag responsavel por verificar a conclusão da primeira caixa e abrir a primeira porta
Box2Fineshed = false	-- Flag responsavel por verificar a conclusão da segunda caixa e abrir a segunda porta
Box3Fineshed = false	-- Flag responsavel por verificar a conclusão da terceira caixa e abrir a segunda porta
Box4Fineshed = false	-- Flag responsavel por verificar a conclusão da quarta caixa e abrir a terceira porta
local Level1Map = love.graphics.newImage("imgs/Level1.png")
local HiddenDoor1 = love.graphics.newImage("imgs/door1.png")
local HiddenDoor2 = love.graphics.newImage("imgs/door2.png")
local HiddenDoor3 = love.graphics.newImage("imgs/door3.png")
local gameBackground = love.graphics.newImage("imgs/gameBackground.jpg")
local music = nil


function Level1Music()
	music = love.audio.newSource("sound/Tech.mp3", "stream")
	music:setLooping(true)
	love.audio.play(music)
end

-- Física dos blocos da primeira fase
function Level1Physics()
	ceiling = newPlataform(reality, 400, 16, 800, 32)
	ground = newPlataform(reality, 400, 624, 800, 32)
	wallLeft = newPlataform(reality, 16, 320, 32, 640)
	wallRight = newPlataform(reality, 784, 268, 32, 544)
	topFloor = newPlataform(reality, 448, 176, 704, 32)
	middleFloorOrange = newPlataform(reality, 192, 336, 384, 32)
	middleFloorBlue = newPlataform(reality, 624, 336, 352, 32)
	botFloor = newPlataform(reality, 352, 496, 704, 32)
	door1Body = newPlataform(reality, 64, 176, 64, 32)
	door2Body = newPlataform(reality, 416, 336, 64, 32)
	door3Body = newPlataform(reality, 736, 496, 64, 32)
	sideToUpperBox()
	sideToMiddleOrange()
	sideToMiddleBlue()
	sideToBottomBox()
end

-- Desenho da primeira fase
function Level1Draw()
	if not codeBox1
		and not codeBox2
		and not codeBox3
		and not codeBox4
	then
		love.graphics.draw(gameBackground, 0, 0)
		love.graphics.draw(Level1Map, 0, 0)
		if Box1Fineshed == false then
			love.graphics.draw(HiddenDoor1, 32, 160)
		else
			door1Body.body:setX(900)
		end
		if Box2Fineshed == false or Box3Fineshed == false then
			love.graphics.draw(HiddenDoor2, 384, 320)
		else
			door2Body.body:setX(900)
		end
		if Box4Fineshed == false then
			love.graphics.draw(HiddenDoor3, 704, 480)
		else
			door3Body.body:setX(900)
		end
	end
	writeTip()
	drawCodeUpBox()
	drawCodeMOrange()
	drawCodeMBlue()
	drawCodeBottom()
	exitSourceCode()
end
