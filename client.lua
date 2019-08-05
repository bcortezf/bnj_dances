_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Menu de Bailes", "~b~Para bailar con estilo..")
_menuPool:Add(mainMenu)


----- VARIABLES PARA TODO EL SCRIPT
local quieto=49 -- 49: QUIETO COMPLETAMENTE, 1: PUEDES MOVERTE MIENTRAS BAILAS 
local jugador= GetPlayerPed(-1) 
local subirIntensidad = 54   -- LETRA E
local bajarIntensidad = 52    -- LETRA Q
local cambiarBaile = 21 -- TECLA SHIFT
local cancelarAnim = 120 -- TECLA X

--Tipo es un flag que pertenece a la funcion TaskPlayAnim.
-- 0 es normal
-- 1 la repite en bucle
--2 te detiene en el ultimo frame de estas
-- 16 solo se hace la parte de arriba
local tipo=4


Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)

          _menuPool:ProcessMenus() 
          if IsControlJustPressed(1, 57) then -- Si se presiona F10
              abrirMenu()
          end 
    end
end) 




function abrirMenu()
  mainMenu:Visible(not mainMenu:Visible())
end

function Bailes(menu)
local submenu = _menuPool:AddSubMenu(menu, "Bailes con Intensidad »", "[E y Q] Intensidad   [FLECHAS] Brazos   [SHIFT] Cambiar Baile   [X] Cancelar")
local opcion1 = NativeUI.CreateItem("Hombre", "Baile con estilo de hombre")
local opcion2 = NativeUI.CreateItem("Mujer", "Baile con estilo de mujer")
local opcion3 = NativeUI.CreateItem("Drogado", "Baile bajo estupefacientes de dudosa procedencia")

local intensidad=1  -- Se inicia la Intensidad en 0

local directorio=""
local animacion=""

ClearPedSecondaryTask( jugador )

-- En estas dos variables se almacenaran las animaciones y el directorio que se reproducirá
-- La intensidad depositará la animacion ahi dentro


submenu:AddItem(opcion1)
submenu:AddItem(opcion2)
submenu:AddItem(opcion3)
submenu.OnItemSelect = function(sender, item, index)

-- NOMBRES PARA ANIMACIONES DE BAILE
-- ESTOS NOMBRES SE REPITEN EN HOMBRE Y MUJER, INDEPENDIENTE SI ES VAR_A O VAR_b

local animacion1="low_center_down"
local animacion1d="low_right_down"
local animacion1i="low_left_down"

local animacion2="low_center"
local animacion2d="low_right"
local animacion2i="low_left"

local animacion3="low_center_up"
local animacion3d="low_right_up" 
local animacion3i="low_left_up"

local animacion4="med_center_down"
local animacion4d="med_right_down"
local animacion4i="med_left_down"

local animacion5="med_center"
local animacion5d="med_right"
local animacion5i="med_left"

local animacion6="med_center_up"
local animacion6d="med_right_up"
local animacion6i="med_left_up"

local animacion7="high_center_down"
local animacion7d="high_right_down"
local animacion7i="high_left_down"

local animacion8="high_center"
local animacion8d="high_right"
local animacion8i="high_left"

local animacion9="high_center_up"
local animacion9d="high_right_up"
local animacion9i="high_left_up"

-- BAILE HOMBRE, AMBOS ESTILOS
local directorio1="anim@amb@nightclub@mini@dance@dance_solo@male@var_a@"
local directorio2="anim@amb@nightclub@mini@dance@dance_solo@male@var_b@"

-- BAILE MUJER, AMBOS ESTILOS
local directorio3="anim@amb@nightclub@mini@dance@dance_solo@female@var_a@"
local directorio4="anim@amb@nightclub@mini@dance@dance_solo@female@var_b@"

--BAILE DROGADO
local directorio5="anim@amb@nightclub@dancers@black_madonna_entourage@"
local animacion10="li_dance_facedj_15_v2_male^2"
local animacion11="hi_dance_facedj_09_v2_male^5"





--////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////// BAILE HOMBRE //////////////////////////////////////////////////
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////   

if item == opcion1 then
limpiarAnimacion(jugador)
intensidad=1
bucle=true  -- para entrar en el bucle
bucle=true  -- true denuevo por si las moscas
directorio=directorio1 -- Establece var_a como el directorio a reproducir
animacion="" -- reinicia la animacion a ninguna
ClearPedSecondaryTask( jugador ) -- Limpia cualquier animacion para poder cambiar entre animaciones desde el mismo menu

Citizen.CreateThread(function() 

  while bucle do
  Citizen.Wait(1)


    if intensidad==1 then -- Si la intensidad es 1
      animacion=animacion1 -- Cambia la animacion a low_center_down
      if IsControlPressed(1, 175) then -- 175 FLECHA DERECHA
          animacion=animacion1d -- cambia la animacion a low_right_down
      elseif IsControlPressed(1, 174) then -- 174 FLECHA IZQUIERDA
          animacion=animacion1i -- cambia la animacion a low_left_down
      end
      bailar(directorio,animacion) -- Finalmente llama a la funcion bailar con los valores actuales..

      -- Esta funcion la ejecuto al final del if, para que reproducza la animacion si se apreta una tecla o no.
    end


    if intensidad==2 then -- Si la intencidad es 2
      animacion=animacion2 -- Cambia la animacion a low_center
      if IsControlPressed(1, 175) then -- si se apreta la tecla derecha
          animacion=animacion2d -- cambia la animacion actual a low_right
      elseif IsControlPressed(1, 174) then -- si se apreta la tecla izquierda
          animacion=animacion2i -- cambia la animacion a low_left
      end
      bailar(directorio,animacion)
    end

    if intensidad==3 then -- y asi sucesivamente...
      animacion=animacion3
      if IsControlPressed(1, 175) then 
          animacion=animacion3d 
      elseif IsControlPressed(1, 174) then 
          animacion=animacion3i 
      end
      bailar(directorio,animacion)
    end

    if intensidad==4 then
      animacion=animacion4
      if IsControlPressed(1, 175) then 
          animacion=animacion4d
      elseif IsControlPressed(1, 174) then 
          animacion=animacion4i 
      end
      bailar(directorio,animacion)
        
    end

    if intensidad==5 then
      animacion=animacion5
      if IsControlPressed(1, 175) then 
          animacion=animacion5d
      elseif IsControlPressed(1, 174) then 
          animacion=animacion5i
      end
      bailar(directorio,animacion)
    end

    if intensidad==6 then
      animacion=animacion6
      if IsControlPressed(1, 175) then 
          animacion=animacion6d 
      elseif IsControlPressed(1, 174) then 
          animacion=animacion6i 
      end
      bailar(directorio,animacion)
    end


    if intensidad==7 then
      animacion=animacion7
      if IsControlPressed(1, 175) then 
          animacion=animacion7d 
      elseif IsControlPressed(1, 174) then 
          animacion=animacion7i 
      end
      bailar(directorio,animacion)
    end

    if intensidad==8 then
      animacion=animacion8
      if IsControlPressed(1, 175) then 
          animacion=animacion8d 
      elseif IsControlPressed(1, 174) then
          animacion=animacion8i 
      end
      bailar(directorio,animacion)
    end

    if intensidad==9 then
      animacion=animacion9
      if IsControlPressed(1, 175) then 
          animacion=animacion9d 
      elseif IsControlPressed(1, 174) then
          animacion=animacion9i
      end
      bailar(directorio,animacion)
    end

    -- Seccion de controles para baile hombre

    if IsControlJustPressed(1, cambiarBaile) then -- Si se apreta SHIFT
        if directorio==directorio1 then
          directorio=directorio2
          bailar(directorio,animacion)
        else
          directorio=directorio1
          bailar(directorio,animacion)

        end
    end

    if IsControlJustReleased(1, subirIntensidad) then -- Si se apreta E
        if intensidad <9 then
          intensidad = intensidad + 1 -- Sube la intensidad hasta 9
        end
    end

    if IsControlJustReleased(1, bajarIntensidad) then-- Si se apreta Q
        if intensidad > 1 then
          intensidad = intensidad - 1 -- Baja la intensidad hasta 9
        end
    end

    if IsControlJustReleased(1, cancelarAnim) then -- Si se apreta X
        intensidad=1
        bucle=false
        ClearPedSecondaryTask(PlayerPedId())
      limpiarAnimacion(jugador)
     
    end



  end -- end del while true
end)
end -- End opcion


--////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////// BAILE MUJER //////////////////////////////////////////////////
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////   

if item == opcion2 then

limpiarAnimacion(jugador)
intensidad=1


bucle=true  -- para entrar o volver a entrar en el bucle
bucle=true  -- para entrar o volver a entrar en el bucle
directorio=directorio3 -- Establece var_a como el directorio a reproducir
animacion="" -- reinicia la animacion a ninguna

Citizen.CreateThread(function() 
  while bucle==true do
  Citizen.Wait(1)


    if intensidad==1 then -- Si la intensidad es 1
      animacion=animacion1 -- Cambia la animacion a low_center_down
      if IsControlPressed(1, 175) then -- 175 FLECHA DERECHA
          animacion=animacion1d -- cambia la animacion a low_right_down
      elseif IsControlPressed(1, 174) then -- 174 FLECHA IZQUIERDA
          animacion=animacion1i -- cambia la animacion a low_left_down
      end
      bailar(directorio,animacion) -- Finalmente llama a la funcion bailar con los valores actuales..
      -- Esta funcion la ejecuto al final del if, para que reproducza la animacion si se apreta una tecla o no.
    end


    if intensidad==2 then
      animacion=animacion2
      if IsControlPressed(1, 175) then 
          animacion=animacion2d 
      elseif IsControlPressed(1, 174) then 
          animacion=animacion2i 
      end
      bailar(directorio,animacion)
    end

    if intensidad==3 then
      animacion=animacion3
      if IsControlPressed(1, 175) then 
          animacion=animacion3d 
      elseif IsControlPressed(1, 174) then 
          animacion=animacion3i 
      end
      bailar(directorio,animacion)
    end

    if intensidad==4 then
      animacion=animacion4
      if IsControlPressed(1, 175) then 
          animacion=animacion4d
      elseif IsControlPressed(1, 174) then 
          animacion=animacion4i 
      end
      bailar(directorio,animacion)
        
    end

    if intensidad==5 then
      animacion=animacion5
      if IsControlPressed(1, 175) then 
          animacion=animacion5d
      elseif IsControlPressed(1, 174) then 
          animacion=animacion5i
      end
      bailar(directorio,animacion)
    end

    if intensidad==6 then
      animacion=animacion6
      if IsControlPressed(1, 175) then 
          animacion=animacion6d 
      elseif IsControlPressed(1, 174) then 
          animacion=animacion6i 
      end
      bailar(directorio,animacion)
    end


    if intensidad==7 then
      animacion=animacion7
      if IsControlPressed(1, 175) then 
          animacion=animacion7d 
      elseif IsControlPressed(1, 174) then 
          animacion=animacion7i 
      end
      bailar(directorio,animacion)
    end

    if intensidad==8 then
      animacion=animacion8
      if IsControlPressed(1, 175) then 
          animacion=animacion8d 
      elseif IsControlPressed(1, 174) then
          animacion=animacion8i 
      end
      bailar(directorio,animacion)
    end

    if intensidad==9 then
      animacion=animacion9
      if IsControlPressed(1, 175) then 
          animacion=animacion9d 
      elseif IsControlPressed(1, 174) then
          animacion=animacion9i
      end
      bailar(directorio,animacion)
    end



-- Seccion de controles para baile mujer

    if IsControlJustPressed(1, cambiarBaile) then -- Si se apreta SHIFT
        if directorio==directorio3 then --
          directorio=directorio4
        bailar(directorio,animacion)

        else
          directorio=directorio3
          bailar(directorio,animacion)
        end
    end

    if IsControlJustReleased(1, subirIntensidad) then -- Si se apreta E
        if intensidad <9 then
          intensidad = intensidad + 1
        end
    end

    if IsControlJustReleased(1, bajarIntensidad) then-- Si se apreta Q
        if intensidad > 1 then
          intensidad = intensidad - 1
        end
    end

    if IsControlJustReleased(1, cancelarAnim) then -- Si se apreta X
        intensidad=1
        bucle=false
        ClearPedSecondaryTask(PlayerPedId())

      limpiarAnimacion(jugador)
     
    end

  end -- end del while true
end)
end -- End opcion


--////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////// BAILE DROGADO //////////////////////////////////////////////////
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////   

if item == opcion3 then
limpiarAnimacion(jugador)
intensidad=1
bucle=true  -- para entrar o volver a entrar en el bucle
directorio=directorio5 -- Establece var_a como el directorio a reproducir




Citizen.CreateThread(function() 
  while bucle==true do
  Citizen.Wait(1)


    if intensidad==1 then -- Si la intensidad es 1
      animacion=animacion10 -- Cambia la animacion a low_center_down
      bailar(directorio,animacion) -- Finalmente llama a la funcion bailar con los valores actuales..
      -- Esta funcion la ejecuto al final del if, para que reproducza la animacion si se apreta una tecla o no.
    end


    if intensidad==2 then
      animacion=animacion11
      bailar(directorio,animacion)
    end





-- Seccion de controles para baile Drogado



    if IsControlJustReleased(1, subirIntensidad) then -- Si se apreta E
        if intensidad <2 then
          intensidad = intensidad + 1
        end
    end

    if IsControlJustReleased(1, bajarIntensidad) then-- Si se apreta Q
        if intensidad > 1 then
          intensidad = intensidad - 1
        end
    end

    if IsControlJustReleased(1, cancelarAnim) then -- Si se apreta X
        intensidad=1
        bucle=false
        --TriggerEvent('chatMessage', 'Se presiono X e Intensidad es', '', tostring(intensidad))
        ClearPedSecondaryTask(jugador)
      limpiarAnimacion(jugador)
    end

  end -- end del while true
end)
end -- End opcion





------- Estos dos end son de la funcion Bailar y de su sub-funcion
end
end



function DJ(menu)
local submenu2 = _menuPool:AddSubMenu(menu, "Bailes de DJ »", "Bailes para cuando un DJ está mezclando")
local opcion1 = NativeUI.CreateItem("Concentrado Mezclando", "Estas concentrado en la maquina, pero moviendo los pies al ritmo de la musica")
local opcion2 = NativeUI.CreateItem("Leve descanso", "Mezclas, te sacas los audifonos, y bailas un poco")
local opcion3 = NativeUI.CreateItem("Mezclas y bebes", "Dejas de mezclar un poco, y tomas un sorbo de una copa de atrás")
local opcion4 = NativeUI.CreateItem("Ponerse Audifonos y Bailar", "Te pones los audifonos y levantas las manos")
local opcion5 = NativeUI.CreateItem("Mezclar y Bailar", "Estas mezclando y te pones a bailar un poco")
local opcion6 = NativeUI.CreateItem("Mezclas y bailas", "Mezclas y aplaudes al ritmo de la musica")
local opcion7 = NativeUI.CreateItem("Motivado Mezclando", "Estas concentrado y motivado mezclando la musica")
-- local opcion8 = NativeUI.CreateItem("1", "1")
-- local opcion9 = NativeUI.CreateItem("1", "1")
-- local opcion10 = NativeUI.CreateItem("1", "1")
-- local opcion11 = NativeUI.CreateItem("1", "1")
-- local opcion12 = NativeUI.CreateItem("1", "1")
-- local opcion13 = NativeUI.CreateItem("1", "1")
-- local opcion14 = NativeUI.CreateItem("1", "1")



submenu2:AddItem(opcion1)
submenu2:AddItem(opcion2)
submenu2:AddItem(opcion3)
submenu2:AddItem(opcion4)
submenu2:AddItem(opcion5)
submenu2:AddItem(opcion6)
submenu2:AddItem(opcion7)

-- submenu2:AddItem(opcion8)
-- submenu2:AddItem(opcion9)
-- submenu2:AddItem(opcion10)
-- submenu2:AddItem(opcion11)
-- submenu2:AddItem(opcion12)
-- submenu2:AddItem(opcion13)
-- submenu2:AddItem(opcion14)
submenu2.OnItemSelect = function(sender, item, index)



    local directorio=""
    local directorio1="anim@amb@nightclub@djs@dixon@"
    local directorio2="anim@amb@nightclub@djs@tale_of_us@"
    local directorio3="mini@strip_club@idles@dj@idle_02" 
    local animacion=""
    local animacion1="dixn_idle_cntr_a_dix"
    local animacion2="dixn_dance_cntr_b_dix"
    local animacion3="dixn_dance_cntr_d_dix"
    local animacion4="dixn_dance_cntr_e_dix"
    local animacion5="dixn_dance_cntr_open_dix"
    local animacion6="dixn_dance_open_a_dix"
    local animacion7="dixn_idle_cntr_i_dix"
    -- local animacion8="idle_02"
    -- local animacion9="tou_dance_a_cc"
    -- local animacion10="tou_dance_b_cc"
    -- local animacion11="tou_dance_c_cc"
    -- local animacion12="tou_dance_d_cc"
    -- local animacion13="tou_dance_e_cc"
    -- local animacion14="tou_idle_mid_a_cc"


    if item==opcion1 then
      directorio=directorio1
      animacion=animacion1
      bailar(directorio,animacion)
    elseif item==opcion2 then
      directorio=directorio1
      animacion=animacion2
      bailar(directorio,animacion)
    elseif item==opcion3 then
      directorio=directorio1
      animacion=animacion3
      bailar(directorio,animacion)
    elseif item==opcion4 then
      directorio=directorio1
      animacion=animacion4
      bailar(directorio,animacion)
    elseif item==opcion5 then
      directorio=directorio1
      animacion=animacion5
      bailar(directorio,animacion)
    elseif item==opcion6 then
      directorio=directorio1
      animacion=animacion6
      bailar(directorio,animacion)
    elseif item==opcion7 then
      directorio=directorio1
      animacion=animacion7
      bailar(directorio,animacion)
    -- elseif item==opcion8 then
    --   directorio=directorio3
    --   animacion=animacion8
    --   bailar(directorio,animacion)
    --  elseif item==opcion9 then
    --   directorio=directorio2
    --   animacion=animacion9
    --   bailar(directorio,animacion)
    --  elseif item==opcion10 then
    --   directorio=directorio2
    --   animacion=animacion10
    --   bailar(directorio,animacion)
    --  elseif item==opcion11 then
    --   directorio=directorio2
    --   animacion=animacion11
    --   bailar(directorio,animacion)
    --  elseif item==opcion12 then
    --   directorio=directorio2
    --   animacion=animacion12
    --   bailar(directorio,animacion)
    --  elseif item==opcion13 then
    --   directorio=directorio2
    --   animacion=animacion13
    --   bailar(directorio,animacion)
    --  elseif item==opcion14 then
    --   directorio=directorio2
    --   animacion=animacion14
    --   bailar(directorio,animacion)


    end

end
end -- End opcion



function Animaciones(menu)
local submenu3 = _menuPool:AddSubMenu(menu, "Animaciones »", "Distintas Expresiones nuevas.")
local opcion1 = NativeUI.CreateItem("Puuuuta madre", "Suspiras al perder en algo..")
local opcion2 = NativeUI.CreateItem("Eeeesoooo!", "Ganaste en algo, y lo celebras")
local opcion3 = NativeUI.CreateItem("DJ1", "1")
local opcion4 = NativeUI.CreateItem("Asi de grande", "Indicas algo con tus brazos, asi de grande..")
local opcion5 = NativeUI.CreateItem("Eh, ven aca colega", "Levantas los brazos llamando a un amigo pasa saludarle")
-- local opcion6 = NativeUI.CreateItem("1", "1")
-- local opcion7 = NativeUI.CreateItem("1", "1")

-- local opcion8 = NativeUI.CreateItem("1", "1")
-- local opcion9 = NativeUI.CreateItem("1", "1")
-- local opcion10 = NativeUI.CreateItem("1", "1")
-- local opcion11 = NativeUI.CreateItem("1", "1")
-- local opcion12 = NativeUI.CreateItem("1", "1")
-- local opcion13 = NativeUI.CreateItem("1", "1")
-- local opcion14 = NativeUI.CreateItem("1", "1")



submenu3:AddItem(opcion1)
submenu3:AddItem(opcion2)
submenu3:AddItem(opcion3)
submenu3:AddItem(opcion4)
submenu3:AddItem(opcion5)
-- submenu3:AddItem(opcion6)
-- submenu3:AddItem(opcion7)
-- submenu3:AddItem(opcion8)
-- submenu3:AddItem(opcion9)
-- submenu3:AddItem(opcion10)
-- submenu3:AddItem(opcion11)
-- submenu3:AddItem(opcion12)
-- submenu3:AddItem(opcion13)
-- submenu3:AddItem(opcion14)

submenu3.OnItemSelect = function(sender, item, index)



  
    if item==opcion1 then
      directorio="mini@dartsoutro"
      animacion="darts_outro_03_guy1"
      tipo=0 -- 0: Normal | 1: Bucle | 120: Puedes Moverte
      hacerAnimacion(directorio,animacion,tipo)
    elseif item==opcion2 then
      directorio="mini@dartsoutro"
      animacion="darts_outro_03_guy2"
      tipo=0 
      hacerAnimacion(directorio,animacion,tipo)
    elseif item==opcion3 then
      directorio="mini@strip_club@idles@dj@idle_02" 
      animacion="idle_02"
      tipo=0 
      hacerAnimacion(directorio,animacion,tipo)
    elseif item==opcion4 then
      directorio="gestures@miss@dockssetup1"  
      animacion="trevor_dh1_aeaa_01_g2"
      tipo=120
      hacerAnimacion(directorio,animacion,tipo)

    elseif item==opcion5 then
      directorio="friends@frf@ig_1"
      animacion="over_here_idle_b"
      tipo=0 
      hacerAnimacion(directorio,animacion,tipo)



    end

end
end -- End opcion



   


   





Bailes(mainMenu)
DJ(mainMenu)
Animaciones(mainMenu)

_menuPool:RefreshIndex()
_menuPool:MouseControlsEnabled(false)
_menuPool:ControlDisablingEnabled(false)



function bailar(directorio,animacion)
local jugador= GetPlayerPed(-1) 
    if ( DoesEntityExist( jugador ) and not IsEntityDead( jugador )) then 
    loadAnimDict( directorio )


      if not ( IsEntityPlayingAnim( jugador, directorio, animacion, 3 ) ) then
        TaskPlayAnim( jugador, directorio, animacion, 8.0, 1.0, -1, 1, 0, 0, 0, 0 )        
        -- TriggerEvent('chatMessage', 'Se reprodujo TaskPlayAnim', '', animacion)
      end


      
    end
end


function hacerAnimacion(directorio,animacion,tipo)
  local usuario = PlayerPedId()
    loadAnimDict( directorio )
    TaskPlayAnim( jugador, directorio, animacion, 8.0, 1.0, -1, tipo, 0, 0, 0, 0 )  
end

function loadAnimDict(directorio)
  bucledirectorio=true


  while not HasAnimDictLoaded(directorio) do
    RequestAnimDict(directorio)
    Citizen.Wait(300)

    -- TriggerEvent('chatMessage', 'Cargando', '', directorio)
  end

end

function limpiarAnimacion(jugador)
  bucle=false
  ClearPedTasksImmediately(jugador)
  ClearPedTasks(jugador)
  ClearPedSecondaryTask(jugador)
end


