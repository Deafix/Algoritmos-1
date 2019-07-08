-- Código da segunda caixa
function codeChallenge2Ora()
	if codeBox2 then
		love.graphics.setFont(love.graphics.newFont(15))
		love.graphics.setColor(0, 0.9, 0)
		love.graphics.print("x = 0", 10, 100)
		love.graphics.print("y = 1", 10, 120)
		love.graphics.print("if x <= 4 then", 10, 140)
		love.graphics.print("	y = (x ^ 2)", 10, 160)
		love.graphics.print("end", 10, 180)
		love.graphics.print("-- A chave y deve ter valor igual ao valor do y da caixa azul no outro lado da sala", 10, 200)
		love.graphics.print("Resposta =", 10, 380)
		love.graphics.setColor(1, 1, 1)
	end
end

-- Resposta da segunda e terceira caixa
function answerMiddle(n)
	if n == "3" then
		return true
	else
		return false
	end
end
