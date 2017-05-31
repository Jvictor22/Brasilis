local girl_walk = {}
local girl_anim_frame = 1
local girl_pos_x = 70
local girl_pos_y = 100
local girl_anim_time = 1
local girl_dir = 1
local hasShot = false
local gravity = 200
local girl_vel_y = 200
local collided = false
local girl_walk_1  = require "girl"
local alien_move = require "alien"

function love.load()
  love.graphics.setBackgroundColor(126,189,252)
  imagem_Cloud = love.graphics.newImage ("mario_cloud.png")
  imagem_width = imagem_Cloud: getWidth()
  imagem_height = imagem_Cloud : getHeight()
  
   background = love.graphics.newImage("sao_paulo_background.png")
  largura = background: getWidth()
  altura  = background: getHeight()
  
  imagem_ground = love.graphics.newImage ("ground.png")
  imagem_width = imagem_ground: getWidth()
  imagem_height = imagem_ground : getHeight()
  for x = 1,9,1 do
    girl_walk[x] = love.graphics.newImage("girl_walk_0" .. x .. ".png")
  end
   alien_move.load()
end
function love.update(dt)
  alien_move.update(dt,girl_pos_x,girl_pos_y)
  if girl_pos_x - 65/2 < 0 then
    girl_pos_x = 65/2
  end
  
  if girl_pos_y > 487 - 0.253*girl_walk[1]:getHeight()/2 + 5 then
    girl_pos_y = 487 - 0.253 *girl_walk[1]:getHeight()/2 + 5
    collided = true
  end
  
  if not collided then
    girl_vel_y = girl_vel_y + gravity*dt
    girl_pos_y = girl_pos_y + girl_vel_y*dt
  end
  
  if love.keyboard.isDown("d") then
    girl_dir = 1
    girl_pos_x = girl_pos_x + (200 * dt)
    girl_anim_time = girl_anim_time + dt
    if girl_anim_time > 0.2 then
      girl_anim_frame = girl_anim_frame + 1
      if girl_anim_frame > 9 then
        girl_anim_frame = 2
      end
      girl_anim_time = 0.14
    end
  end
  
  if hasShot then
    
  end
  
  if love.keyboard.isDown("a") then
    girl_dir = -1
    girl_pos_x = girl_pos_x + (200 * girl_dir* dt)
    girl_anim_time = girl_anim_time + dt
    if girl_anim_time > 0.2 then
      girl_anim_frame = girl_anim_frame + 1
      if girl_anim_frame > 9 then
        girl_anim_frame = 2
      end
      girl_anim_time = 0.14
    end
  end
end
 
 function love.keyreleased(key)
   if key == "a" or key == "d" then
     girl_anim_frame = 1
   end
 end
 
 function love.keypressed(key)
   if key == "k" then
     --spawn bullet
     hasShot = true
   end
   if (key == "w" or key == " ") and collided then
     collided = false
     girl_vel_y = -200
   end
 end
function love.draw ()
   love.graphics.draw(background, 0, 00, 0,1.78,5)
  if not hasShot then
    love.graphics.draw(girl_walk[girl_anim_frame], girl_pos_x, girl_pos_y,0,0.253 * girl_dir,0.253, girl_walk[girl_anim_frame]:getWidth()/2, girl_walk[girl_anim_frame]:getHeight ()/2)
  else
    
  end

   love.graphics.draw (imagem_Cloud,140,-50)
 love.graphics.draw (imagem_Cloud,490,-50)
 love.graphics.draw (imagem_ground,0,487)
 love.graphics.draw (imagem_ground,220,487)
 love.graphics.draw (imagem_ground,440,487)
 love.graphics.draw (imagem_ground,660,487)
 
  alien_move.draw()
  end