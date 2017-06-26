local menu = require "menu"
local game = require "game"
local pause = require "pause"

function love.load()
  menu.load()
  game.load()
  pause.load()
  state = menu
end

function love.update(dt)
  state.update(dt)
end

function love.draw()
  state.draw()
end

function love.changeToGame()
	state = game
end

function love.changeToPause()
  state = pause
end

function love.mousepressed(x,y,but)
	state.mousepressed(x,y,but)
end

function love.keypressed(key)
  state.keypressed(key)
 end
 
function love.keyreleased(key)
 state.keyreleased(key)
end

function love.changeToMenu()
  state = menu
  end