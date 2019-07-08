function codeChallenge1()
	if codeBox1 then
		love.graphics.setFont(love.graphics.newFont(15))
		love.graphics.setColor(0, 0.9, 0)
		love.graphics.print("x = 0", 10, 100)
		love.graphics.print("y = 1", 10, 120)
		love.graphics.print("if x >= 10 then", 10, 140)
		love.graphics.print("	y = x * 3 + 3", 10, 160)
		love.graphics.print("end", 10, 180)
		love.graphics.print("-- A chave y deve ser igual a 39", 10, 250)
		love.graphics.print("-- Sua resposta vai atribuir um valor a x", 10, 270)
		love.graphics.print("-- O comando if acima executa algo caso a condicao apos ele seja verdadeira", 10, 290)
		love.graphics.print("-- Pressione 'enter' para verificar sua resposta", 10, 310)
		love.graphics.print("Resposta =", 10, 380)
		love.graphics.setColor(1, 1, 1)
	end
end

function tryChallenge1(try)
	local x = 0
	local x = tonumber(try)
	local y = 1
	if type(x) == "number" then
		if x >= 10 then
			y = x * 3 + 3
		end
	end

	if y == 39 then
		return true
	else
		return false
	end
end
