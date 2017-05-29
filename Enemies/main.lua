local alien_move = {}
local alien_anim_frame = 1
local alien_pos_x = 70
local alien_pos_y = 100
local alien_anim_time = 0
local alien_dir = 1
 function love.load()
  love.graphics.setBackgroundColor(126,189,252)
 for x=1,4,1 do
   alien_move[x] = love.graphics.newImage("alien_move_0" .. x .. ".png")
   end
 end
function love.update(dt)
   if love.keyboard.isDown("right") then 
    alien_pos_x = alien_pos_x + (100*dt)
    alien_anim_time = alien_anim_time + dt
     if alien_anim_time > 0.2 then
       alien_anim_frame = alien_anim_frame + 1
       if alien_anim_frame > 4 then
          alien_anim_frame = 1
       end
       alien_anim_frame = 0
     end
   end
end
function love.draw()
  love.graphics.draw(alien_move[alien_anim_frame], 70, 100, -0.100, 2.5*alien_dir, 2.5)
end