ESX = nil
CreateThread(function()
  while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
  end
	while not ESX.IsPlayerLoaded() do
    Wait(500)
  end

  ESX.PlayerData = ESX.GetPlayerData()
  PlayerLoaded = true
end)



local Config = {}


Config.AnimType = 49 -- 49: Can't move, 1: You can walk
Config.MoreIntensityKey = 54 -- E
Config.LessIntensityKey = 52 -- Q
Config.LeftKey = 174 -- LEFT ARROW
Config.RightKey = 175 -- RIGHT ARROW
Config.UpKey = 27 -- UP ARROW
Config.DownKey = 173 -- DOWN ARROW
Config.ChangeDance = 21 -- SHIFT
Config.CancelDance = 82 ---- ,
Config.ToggleMovement = 19


--################################################
--###                 VARIABLES                ###
--################################################

local playerPed = PlayerPedId()
local dancing = false
local willDance = false
local intensityIndex=1
local horizontal,vertical
local variation = "a@"
local lastAnim = ""
local intensities = {"low","med","high"}
local typeOfDance
local type = 0


--################################################
--###                  EVENTS                  ###
--################################################
RegisterNetEvent("bc_dancing:startDancingAsMen")
AddEventHandler("bc_dancing:startDancingAsMen",function()
  typeOfDance = "anim@amb@nightclub@mini@dance@dance_solo@male@var_"
  print("men")
  willDance = true
end)



RegisterNetEvent("bc_dancing:startDancingAsWoman")
AddEventHandler("bc_dancing:startDancingAsWoman",function()
  typeOfDance = "anim@amb@nightclub@mini@dance@dance_solo@female@var_"
  print("woman")
  willDance = true
end)

--[[
RegisterNetEvent("bc_dancing:startDancingAsAMotherfucker")
AddEventHandler(function ()
  willDance = true
end)]]



--################################################
--###                 FUNCTIONS                ###
--################################################
function startAnim(playerPed,dir, anim, type)
	ESX.Streaming.RequestAnimDict(dir, function()
    ClearPedTasks(playerPed)
		TaskPlayAnim(playerPed, dir, anim, 5.0, 5.0, -1,type, 1, false, false, false)
	end)
end


CreateThread(function ()
  while true do 
    Wait(1)


    if willDance then
     
      -- Handles Change of Variation
      if IsControlJustPressed(1,Config.ChangeDance) then
          if variation == "a@" then variation="b@" else variation="a@" end
      end

      -- Handles intensity
      if IsControlJustPressed(1,Config.LessIntensityKey) then
        if intensityIndex >1 then intensityIndex = intensityIndex - 1 end
      elseif IsControlJustPressed(1,Config.MoreIntensityKey)  then
        if intensityIndex <3 then intensityIndex = intensityIndex + 1 end
      end

      -- Handles horizontal
      if IsControlPressed(1,Config.RightKey) then horizontal = "right"
      elseif IsControlPressed(1,Config.LeftKey) then horizontal = "left"
      else if horizontal ~= "center" then horizontal = "center" end end

      -- Handles vertical
      if IsControlPressed(1,Config.UpKey) then vertical = "_up" 
      elseif IsControlPressed(1,Config.DownKey)  then vertical = "_down"
      else if vertical ~= "" then vertical = "" end end

      
      if IsControlJustPressed(1,Config.ToggleMovement) then
        if type==0 then type=49 else type=0 end
      end

      
      local animation = intensities[intensityIndex].."_".. horizontal..vertical
      local dir =  typeOfDance .. variation
      local currentAnim = dir .. "  " .. animation .. " " ..type

      if lastAnim ~= currentAnim then  
        lastAnim = dir .. "  " .. animation .. " " ..type
        dancing = true
        startAnim(playerPed,dir,animation,type)
      end

      if IsControlJustPressed(1,Config.CancelDance) and dancing then
        dancing = false
        lastAnim = false
        willDance=false
      end
    end
  end
end)

