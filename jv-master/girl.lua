local girl_walk       = {}
local girl_anim_frame = 1
girl_pos_x      = 70
girl_pos_y      = 100
local girl_anim_time  = 1
local girl_dir        = 1
local gravity         = 200
local girl_vel_y      = 200
local collided        = false

bullet = {}
bullet.anim_frame =  1
bullet.x      = girl_pos_x
bullet.y      = girl_pos_y
bullet.anim_time = 1
bullet.dir =  1
bullet.vel_y = 200

tiros = {}
tiro_dir = girl_dir
atirar = true
delayTiro = 0.1
timeAtirar = delayTiro
imgTiro = love.graphics.newImage( "tiro.png" )
 
function checaColisao (x1, y1, w1, h1, x2, y2, w2, h2)
return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end 
function girl_walk.load()
  for x = 1,9,1 do
    girl_walk[x] = love.graphics.newImage("girl_walk_0" .. x .. ".png")
  end
    for i = 1,3,1 do
    bullet[i] = love.graphics.newImage("Shoot_0" .. i .. ".png")
  end
end
function girl_walk.update(dt)
 if girl_pos_x - 50 < 0 then
     girl_pos_x = 50
   end 
 if girl_pos_y > 487 - 0.253*girl_walk[1]:getHeight()/2 + 5 then
     girl_pos_y = 487 - 0.253 *girl_walk[1]:getHeight()/2 + 5
     collided = true
   end
 if not collided then
    girl_vel_y = girl_vel_y + gravity*dt
    girl_pos_y = girl_pos_y + girl_vel_y*dt
    end
 --Vilma andando
 if love.keyboard.isDown("d") then
    girl_dir = 1
    girl_pos_x = girl_pos_x + (170 * dt)
    girl_anim_time = girl_anim_time + dt
    if girl_anim_time > 0.2 then
      girl_anim_frame = girl_anim_frame + 1
      if girl_anim_frame > 9 then
        girl_anim_frame = 2
      end
      girl_anim_time = 0.14
    end
  end
 if love.keyboard.isDown("a") then
    girl_dir = -1
    girl_pos_x = girl_pos_x + (170 * girl_dir* dt)
    girl_anim_time = girl_anim_time + dt
    if girl_anim_time > 0.2 then
      girl_anim_frame = girl_anim_frame + 1
      if girl_anim_frame > 9 then
        girl_anim_frame = 2
      end
      girl_anim_time = 0.14
     end
end
 if love.keyboard.isDown("k") then
    bullet.dir = girl_dir
    bullet.x = girl_pos_x + (dt)
    bullet.anim_time = bullet.anim_time + dt
    if bullet.anim_time > 0.2 then
      bullet.anim_frame = bullet.anim_frame + 1
      if bullet.anim_frame > 3 then
        bullet.anim_frame = 1
      end
      bullet.anim_time = 0.14
    end
  end
  
--Vilma andando

--Tiro andando 
timeAtirar = timeAtirar - ( 1*dt )
if timeAtirar < 0 then
  atirar = true
end 
if love.keyboard.isDown("k") and atirar then
   novoTiro = { x = girl_pos_x + 300, y = girl_pos_y + 180, img = imgTiro } 
   table.insert( tiros, novoTiro)
   atirar = false 
   timeAtirar = delayTiro
 end
 for i, tiro in ipairs (tiros) do
   tiro.x = tiro.x + (500*tiro_dir*dt) 
   if tiro.x < 0 then
     table.remove(tiros, i)
   end 
 end 
 --Tiro Andando
end
function girl_walk.keypressed(key) 
  if (key == "w") and collided then
    collided   = false
    girl_vel_y = -200
 end
end 
function girl_walk.keyreleased(key)
   if key == "a" or key == "d" then
      girl_anim_frame = 1
   end
 end
function girl_walk.draw()
  -- Desenho dela andando e atirando
  if love.keyboard.isDown("d") then 
    love.graphics.draw(girl_walk[girl_anim_frame], girl_pos_x, girl_pos_y,0,0.253 * girl_dir,0.253,girl_walk[girl_anim_frame]:getWidth()/2, girl_walk[girl_anim_frame]:getHeight ()/2)
  elseif love.keyboard.isDown("a") then
    love.graphics.draw(girl_walk[girl_anim_frame], girl_pos_x, girl_pos_y,0,0.253 * girl_dir,0.253,girl_walk[girl_anim_frame]:getWidth()/2, girl_walk[girl_anim_frame]:getHeight ()/2)
    elseif love.keyboard.isDown("k") then
              love.graphics.draw(bullet[bullet.anim_frame], girl_pos_x, girl_pos_y,0,0.253 * bullet.dir,0.253,bullet[bullet.anim_frame]:getWidth()/2, bullet[bullet.anim_frame]:getHeight ()/2)
  else
    love.graphics.draw(girl_walk[girl_anim_frame], girl_pos_x, girl_pos_y,0,0.253 * girl_dir,0.253,girl_walk[girl_anim_frame]:getWidth()/2, girl_walk[girl_anim_frame]:getHeight ()/2)
  end 
  -- Desenho dela andando e atirando
  
  -- Desenho do tiro
  for i, tiro in ipairs( tiros ) do 
    love.graphics.draw( tiro.img, tiro.x , tiro.y , 0, 1*tiro_dir, 1, imgTiro:getWidth(), imgTiro:getHeight())
  end 
  -- Desenho do tiro
end
  return girl_walk