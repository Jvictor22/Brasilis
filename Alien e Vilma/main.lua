local girl_walk  = require "girl"
local alien_move = require "alien"
 sucess = love.window.setMode(800, 600, {resizable = true})
          love.window.setTitle("Terra Brasilis")
          
function love.load()
  alien_move.load()
  
  girl_walk.load()
  
  imagem_Cloud = love.graphics.newImage ("mario_cloud.png")
  imagem_width = imagem_Cloud: getWidth()
  imagem_height = imagem_Cloud : getHeight()
  
  background = love.graphics.newImage("sao_paulo_background.png")
  largura = background: getWidth()
  altura  = background: getHeight()
  
  imagem_ground = love.graphics.newImage ("ground.png")
  imagem_width = imagem_ground: getWidth()
  imagem_height = imagem_ground : getHeight()
end 
function love.update(dt)
alien_move.update(dt, girl_pos_x, girl_pos_y)
girl_walk.update(dt)
end
function love.keyreleased(key)
 alien_move.keyreleased(key)
 girl_walk.keyreleased(key)
end




function love.draw()
 love.graphics.draw(background, 0, 00, 0,1.78,5)

 love.graphics.draw (imagem_Cloud,140,-50)
 love.graphics.draw (imagem_Cloud,490,-50)
 
 alien_move.draw()
 
 girl_walk.draw()
 
 love.graphics.draw (imagem_ground,0,487)
 love.graphics.draw (imagem_ground,220,487)
 love.graphics.draw (imagem_ground,440,487)
 love.graphics.draw (imagem_ground,660,487)
end 
function love.keypressed(key)
  girl_walk.keypressed(key)
  if (key=="escape") then
    love.event.quit()
    end
 end