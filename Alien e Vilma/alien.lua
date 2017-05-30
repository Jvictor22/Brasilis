local alien_move = {}
local alien_anim_frame = 1
local alien_pos_x = 812
local alien_pos_y = 230
local alien_anim_time = 0
local alien_dir= -1
 function alien_move.load()
  love.graphics.setBackgroundColor(126,189,252)
 for x=1,4,1 do
   alien_move[x] = love.graphics.newImage("alien_move_0" .. x .. ".png")
   end
 end
function alien_move.update(dt)
   if alien_pos_x - 280 < 0 then
      alien_pos_x = 280
     end 
   if love.keyboard.isDown("right") then
     alien_dir = 1
     alien_pos_x = alien_pos_x + (100*dt)
     alien_anim_time = alien_anim_time + dt
     if alien_anim_time > 0.2 then
       alien_anim_frame = alien_anim_frame + 1
       if alien_anim_frame > 4 then
          alien_anim_frame = 1
       end
       alien_anim_time = 0
     end
   end
   if love.keyboard.isDown("left") then
     alien_dir = -1
     alien_pos_x = (alien_pos_x) - (100*dt)
     alien_anim_time = alien_anim_time + dt
      if alien_anim_time > 0.2 then
         alien_anim_frame = alien_anim_frame + 1
         if alien_anim_frame > 4 then
            alien_anim_frame = 1
           end
         alien_anim_time = 0
       end
     end 
end
 function alien_move.keyreleased(key)
   if key == "left" or key == "right" then
     alien_anim_frame = 1
   end
  end
function alien_move.draw()
  love.graphics.draw(alien_move[alien_anim_frame], alien_pos_x, alien_pos_y, 0, 2.5*alien_dir, 2.5)
end
return alien_move