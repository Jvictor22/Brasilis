local menu = {}
local BGimage
local botaoStart
local botaoQuit
image = love.graphics.newImage('iniciar.png')
function menu.load()
  BGimage = love.graphics.newImage('brasil.png')
  botaoStart = {
		x = 200,
		y = 100,
		width = 400,
		height = 150,
    
	}
   botaoQuit = {
		x = 200,
		y = 300,
		width = 400,
		height = 150,
    
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
  if checkPoint(botaoQuit,x,y) then
		love.event.quit()
	end
end

function menu.draw()
  love.graphics.draw(BGimage)
	love.graphics.rectangle('line',botaoStart.x,botaoStart.y,botaoStart.width,botaoStart.height)
  love.graphics.draw(image, 200, 100)
  love.graphics.rectangle('line',botaoQuit.x,botaoQuit.y,botaoQuit.width,botaoQuit.height)
end

function menu.keypressed()
end

function menu.keyreleased()
end

return menu