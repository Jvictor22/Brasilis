local camera = {}
camera.x = x
camera.y = y
camera.chao = love.graphics.newImage("ground.png")
camera.width = camera.chao : getWidth ()
camera.height = camera.chao : getHeight ()



  imagem_ground = love.graphics.newImage ("ground.png")
  imagem_width = imagem_ground: getWidth()
  imagem_height = imagem_ground : getHeight()
 love.graphics.draw (imagem_ground,0,487)
 love.graphics.draw (imagem_ground,220,487)
 love.graphics.draw (imagem_ground,440,487)
 love.graphics.draw (imagem_ground,660,487)