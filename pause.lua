local pause = {}
local botaoResume
local botaoMenu
local BGimage
local music

function pause.pauseReceiveMusic(m)
  music = m
end

function pause.load()
  BGimage = love.graphics.newImage('brasil.png')
  botaoResume = {
		x = 200,
		y = 100,
		width = 400,
		height = 150,
    
	}
   botaoMenu = {
		x = 200,
		y = 300,
		width = 400,
		height = 150,
    
	}
  
end

local function checkPoint(botao,x,y)
	return botao.x < x + 1 and x < botao.x + botao.width and botao.y < y + 1 and y < botao.y + botao.height
end

function pause.update(dt)
  
end


function pause.mousepressed(x,y,but)
	if checkPoint(botaoResume,x,y) then
		love.changeToGame()
	end
  if checkPoint(botaoMenu,x,y) then
    music:stop()
		love.changeToMenu()
	end
end


function pause.draw()
  love.graphics.draw(BGimage)
	love.graphics.rectangle('line',botaoResume.x,botaoResume.y,botaoResume.width,botaoResume.height)
  love.graphics.rectangle('line',botaoMenu.x,botaoMenu.y,botaoMenu.width,botaoMenu.height)
end

function pause.keypressed()
end

function pause.keyreleased()
end

return pause