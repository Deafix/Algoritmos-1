function codeChallenge2Blu()
	if codeBox3 then
		love.graphics.setFont(love.graphics.newFont(15))
		love.graphics.setColor(0, 0.9, 0)
		love.graphics.print("x = 0", 10, 100)
		love.graphics.print("y = 1", 10, 120)
		love.graphics.print("if x >= 1 then", 10, 140)
		love.graphics.print("	y = 3 * x", 10, 160)
		love.graphics.print("end", 10, 180)
		love.graphics.print("-- A chave y deve ter valor igual ao valor do y da caixa laranja no outro lado da sala", 10, 250)
		love.graphics.print("Resposta =", 10, 380)
		love.graphics.setColor(1, 1, 1)
	end
end
