local girl_walk       = {}
local girl_anim_frame = 1
local girl_pos_x      = 70
local girl_pos_y      = 100
local girl_anim_time  = 1
local girl_dir        = 1
local gravity         = 200
local girl_vel_y      = 200
local collided        = false

function girl_walk.load()
  for x = 1,9,1 do
    girl_walk[x] = love.graphics.newImage("girl_walk_0" .. x .. ".png")
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
    love.graphics.draw(girl_walk[girl_anim_frame], girl_pos_x, girl_pos_y,0,0.253 * girl_dir,0.253,girl_walk[girl_anim_frame]:getWidth()/2, girl_walk[girl_anim_frame]:getHeight ()/2)
end
  return girl_walk