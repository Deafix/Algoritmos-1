-- Código da terceira caixa
function codeChallenge3()
	if codeBox4 then
		love.graphics.setFont(love.graphics.newFont(15))
		love.graphics.setColor(0, 0.9, 0)
		love.graphics.print("x = 0", 10, 100)
		love.graphics.print("y = 1", 10, 120)
		love.graphics.print("while x <= 10 do", 10, 140)
		love.graphics.print("	y = x * y", 10, 160)
		love.graphics.print("	x = x + 1", 10, 180)
		love.graphics.print("end", 10, 200)
		love.graphics.print("-- A chave y deve ser igual a 5040", 10, 250)
		love.graphics.print("-- O comando 'while' repete um comando enquanto a condicao apos ele for verdadeira", 10, 270)
		love.graphics.print("Resposta =", 10, 380)
		love.graphics.setColor(1, 1, 1)
	end
end

-- Resposta da terceira caixa
function answerBottom(n)
	if n == "7" then
		return true
	else
		return false
	end
end
