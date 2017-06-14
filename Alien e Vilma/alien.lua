 local alien_move = {}
 local alien_anim_frame = 1
 local alien_pos_x = 630
 local alien_pos_y = 370
 local alien_anim_time = 0
 local alien_dir= -1
 local function hipotenusa(x1, x2, y1, y2)
   local dist = math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1))
   return dist
   end 
function alien_move.load()
 for x=1,4,1 do
   alien_move[x] = love.graphics.newImage("alien_move_0" .. x .. ".png")
   end
 end
function alien_move.update(dt, girl_pos_x, girl_pos_y)
   if alien_pos_x - 125 < 0 then
      alien_pos_x = 125
     end
   d = hipotenusa(alien_pos_x, girl_pos_x, alien_pos_y, girl_pos_y)
   dir = girl_pos_x - alien_pos_x
   if dir ~= 0 then
alien_dir = dir / math.abs(dir)
   if d< 400 then
     alien_pos_x = alien_pos_x + (100*dt*alien_dir)
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
 --[[
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
     ]]--
end
function alien_move.keyreleased(key)
   if key == "left" or key == "right" then
     alien_anim_frame = 1
   end
  end
function alien_move.draw()
  love.graphics.draw(alien_move[alien_anim_frame], alien_pos_x, alien_pos_y, 0, 2.5*alien_dir, 2.5,alien_move[alien_anim_frame]:getWidth()/2, alien_move[alien_anim_frame]:getHeight ()/2)
end
 return alien_move