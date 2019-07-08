local AlterEgo = nil

--A introdução e o que será falado nas caixas de dialogo feito com a biblioteca Talkies
function Intro()
	AlterEgo = love.graphics.newImage("imgs/AlterEgo.png")
	Talkies.say("AlterEgo", "Bem Vindo ao Neo World Program, voce deve ser o Hajime ou voce e o Izuru?", {image = AlterEgo})
	Talkies.say("World Ender", "Eu sou ambos, e o que meu mestre diria.")
	Talkies.say("World Ender", "Eu sou uma inteligencia artificial, criada para recuperar os dados das memorias das pessoas que ficaram presas nesse mundo virtual.")
	Talkies.say("World Ender", "Nesse mundo deve estar as memorias de Ibuki Mioda.")
	Talkies.say("AlterEgo", "Sim os dados da memoria dela estao no final dessa sala.", {image = AlterEgo})
	Talkies.say("AlterEgo", "Mas acho que nao sera tao facil conseguir eles.", {image = AlterEgo})
	Talkies.say("AlterEgo", "O programa criou barreiras em volta dos dados, e o choque da morte pode ter deixado as memorias em um estado ainda mais protegido criando mundos inteiros na consciencia dessas pessoas.", {image = AlterEgo})
	Talkies.say("World Ender", "Minha missao aqui e destuir esses mundos e trazer em seguranca suas memorias.")
	Talkies.say("AlterEgo", "Ok, deixei algumas dicas de como passar pela seguranca do sistema, mas nao serei de muita ajuda dessa vez, desculpe.", {image = AlterEgo})
	Talkies.say("World Ender", "Ja e mais que suficiente.")
	Talkies.say("AlterEgo", "Boa sorte.", {image = AlterEgo})
end

