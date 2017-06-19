local menu = {}

local botaoStart

function menu.load()
	botaoStart = {
		x = 200,
		y = 100,
		width = 400,
		height = 100
	}
end

function menu.update(dt)
end

local function checkPoint(botao,x,y)
	return botao.x < x + 1 and x < botao.x + botao.width and botao.y < y + 1 and y < botao.y + botao.height
end

function menu.mousepressed(x,y,but)
	if checkPoint(botaoStart,x,y) then
		love.changeToGame()
	end
end

function menu.draw()
  
	love.graphics.rectangle('fill',botaoStart.x,botaoStart.y,botaoStart.width,botaoStart.height)
 
end

return menu