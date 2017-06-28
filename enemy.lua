local enemy = {}
enemy.delay = 1
enemy.SpawnTime = enemy.delay

imgEnemy = {}

function enemy.load()
  for x=1,8,1 do
  imgEnemy[x] = love.graphics.newImage("robo_0" .. x .. ".png")
   end 
end 
function enemy.update(dt)
  enemy.SpawnTime = enemy.SpawnTime - (1*dt)
   if enemy.SpawnTime < 0 then
      enemy.SpawnTime = enemy.delay
      newEnemy = { x= 800, y= 425, img = imgEnemy[x], frame = 1, timer = 0}
      table.insert(enemy, newEnemy)
    end 
   for x, enemies in ipairs(enemy) do 
     enemies.x = enemies.x - (200*dt)
      if enemies.x < 0 then
        table.remove(enemy, x)
      else
        enemies.timer = enemies.timer + dt
        if enemies.timer > 0.2 then
          enemies.timer = 0
          enemies.frame = enemies.frame + 1
          if enemies.frame > 8 then
            enemies.frame = 1
          end
        end
      end
   end 
  end 
function enemy.draw()
    for x, enemies in ipairs(enemy) do 
      love.graphics.draw(imgEnemy[enemies.frame], enemies.x, enemies.y,0,-0.253, 0.253, imgEnemy[enemies.frame]:getWidth()/2, imgEnemy[enemies.frame]:getHeight()/2)
    end 
   end 
   return enemy