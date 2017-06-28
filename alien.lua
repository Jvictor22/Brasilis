alien = {}
alien.anim_frame = 1
alien.posX = 630
alien.posY = 370
alien.anim_time = 0
alien.dir= -1

local enemy_bullets = {}

local cauda = {}
cauda.anim_frame =  1
cauda.x      = alien.posX
cauda.y      = alien.posY
cauda.anim_time = 1
cauda.dir =  1

local tiroAlien = {} 
atirar = true
delayTiro = 0.1
timeAtirar = delayTiro
imgTiroAlien = love.graphics.newImage( "tiro_alien.png" )

function bulletSpawn(x,y)
  table.insert(enemy_bullets, {x=x, y=y})
end

local function hipotenusa(x1, x2, y1, y2)
   local dist = math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1))
   return dist
   end 
function alien.load()
 for x=1,4,1 do
   alien[x] = love.graphics.newImage("alien_move_0" .. x .. ".png")
 end
 for i=1,6,1 do
   cauda[i] = love.graphics.newImage("cauda_0" .. i .. ".png")
 end
 end 
function alien.update(dt, girl_pos_x, girl_pos_y)
   if alien.posX - 125 < 0 then
      alien.posX = 125
     end
   d = hipotenusa(alien.posX, girl_pos_x, alien.posY, girl_pos_y)
   dir = girl_pos_x - alien.posX
   if dir ~= 0 then
alien.dir = dir / math.abs(dir)
 if d < 400 then
     alien.posX = alien.posX + (100*dt*alien.dir)
     alien.anim_time = alien.anim_time + dt
     if alien.anim_time > 0.2 then
       alien.anim_frame = alien.anim_frame + 1
       if alien.anim_frame > 4 then
          alien.anim_frame = 1
       end
       alien.anim_time = 0
     end 
   end 
   d2 = d / 2
  if d2 < 250 then
    cauda.dir = alien.dir
    cauda.x = alien.posX + (dt)
    cauda.anim_time = cauda.anim_time + dt
    if cauda.anim_time > 0.2 then
      cauda.anim_frame = cauda.anim_frame + 1
      if cauda.anim_frame > 6 then
        cauda.anim_frame = 1
      end
      cauda.anim_time = 0.0001
    end
   end 
 end
 for i=1, #enemy_bullets do
   --fazer a bullet andar
   
 end
end
function alien.keyreleased(key)
   if key == "left" or key == "right" then
     alien.anim_frame = 1
   end
  end
function alien.draw()
 if d < 400 then 
    love.graphics.draw(alien[alien.anim_frame], alien.posX, alien.posY, 0, 2.5*alien.dir, 2.5,alien[alien.anim_frame]:getWidth()/2, alien[alien.anim_frame]:getHeight ()/2)
 elseif d2 < 250 then 
      love.graphics.draw(cauda[cauda.anim_frame], alien.posX, alien.posY, 0, 2.5*cauda.dir, 2.5,cauda[cauda.anim_frame]:getWidth()/2, cauda[cauda.anim_frame]:getHeight ()/2)
    else 
       love.graphics.draw(alien[alien.anim_frame], alien.posX, alien.posY, 0, 2.5*alien.dir, 2.5,alien[alien.anim_frame]:getWidth()/2, alien[alien.anim_frame]:getHeight ()/2)
      end 
end
 return alien