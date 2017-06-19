local bullet = {}
bullet.anim_frame =  1
bullet.x      = 70
bullet.y      = 100
bullet.anim_time = 1
bullet.dir =  1
bullet.vel_y    = 200
local gravity         = 200
local collided        = false

function bullet.load()
  for x = 1,3,1 do
    bullet[x] = love.graphics.newImage("Shoot_0" .. x .. ".png")
  end
end
function bullet.update(dt)
  if bullet.x - 50 < 0 then
     bullet.x = 50
   end 
  if bullet.y > 487 - 0.253*bullet[1]:getHeight()/2 + 5 then
     bullet.y = 487 - 0.253*bullet[1]:getHeight()/2 + 5
     collided = true
   end
  if not collided then
    bullet.vel_y = bullet.vel_y + gravity*dt
    bullet.y = bullet.y + bullet.vel_y*dt
    end
  if love.keyboard.isDown("k") then
    bullet.dir = 1
    bullet.anim_time = bullet.anim_time + dt
    if bullet.anim_time > 0.2 then
      bullet.anim_frame = bullet.anim_frame + 1
      if bullet.anim_frame > 3 then
        bullet.anim_frame = 1
      end
      bullet.anim_time = 0.14
    end
  end
end
function bullet.keyreleased(key)
   if key == "a" or key == "d" then
      bullet.anim_frame = 1
   end
 end
function bullet.draw()
    love.graphics.draw(bullet[bullet.anim_frame], bullet.x, bullet.y,0,0.253 * bullet.dir,0.253,bullet[bullet.anim_frame]:getWidth()/2, bullet[bullet.anim_frame]:getHeight ()/2)
end
  return bullet