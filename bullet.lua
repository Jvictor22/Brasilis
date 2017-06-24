local tiro = {}

function tiro.load ()
  -- Tiros
  atira = true 
  delayTiro = 0.1
  tempoAteAtirar = delayTiro
  tiro = {}
  imgTiro = love.graphics.newImage("Projetil.png")
  --Tiros
end
function tiro.update (dt)
  tempoAteAtirar = tempoAteAtirar - (1*dt)
  if tempoAteAtirar < 0 then 
    atira = true
  end
  if love.keyboard.isDown("k") and atirar then
    novoTiro = { x = girl_pos_x, y = girl_pos_y, img = imgTiro}
    table.insert(tiros, novoTiro)
    atira = false
    tempoAteAtirar = delayTiro
  end
  for i, tiro in ipairs(tiros) do
    tiro.y = tiro.y - ( 500*dt )
    if tiro.y < 0 then 
      table.remove(tiros,1)
    end
  end
  end
  function tiro.draw ()
    for i, tiro in inpairs(tiros)do
      love.graphics.draw(tiro.img,tiro.x,tiro.y,0,1,1,imgTiro:getWidth()/2, imgTiro:getHeight() )
  end
  end
  return bullet