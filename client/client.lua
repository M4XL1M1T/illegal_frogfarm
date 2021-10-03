local blip          = nil
local ESX           = nil
local coords         = GetEntityCoords(playerPed)
local playerPed = PlayerPedId()
local isPickingUp = false
local isProcessing = false
local cooking_pot = false
local ModelSpawned = false

AddEventHandler('playerSpawned', function()
    Citizen.CreateThread(function()
        while ESX == nil do
            Citizen.Wait(10)
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        end
    end)
end)


Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

local menu = MenuV:CreateMenu(false, 'Kröten Händler', 'bottomright', 0, 153, 0, 'size-150', 'default', 'menuv', 'example_namespace')
MenuV:CloseMenu(menu, function()
    print('Menu closed :(')
  end)


local confirm = menu:AddConfirm({ icon = '💊', label = 'Möchstest du die Bufotenin Kröten Verkaufen?', value = 'no' })

confirm:On('confirm', function(item) 
        ESX.ShowAdvancedNotification('Verkauft', '', 'Jo man! Danke für die Kröten, Hier ist Dein Schwarzgeld', 'CHAR_LESTER_DEATHWISH', 9, true, false, 210)
        UnregisterPedheadshot(mugshot)
        TriggerServerEvent("frog:sell")
        menu:Close()
end)

confirm:On('deny', function(item)
    ESX.ShowAdvancedNotification('Abgelehnt', '', 'Wenn du es dir anders überlegst komm einfach wieder.', 'CHAR_BLOCKED', 7, true, false, 130)
    UnregisterPedheadshot(mugshot)
    menu:Close()
end)


local Hookers = {
	{id = 1, VoiceName = "HOOKER_LEAVES_ANGRY", 
}}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(5000)
	if (not ModelSpawned) then
	  for i=1, #Hookers do
		RequestModel(GetHashKey(Config.NpcTyp))
        while not HasModelLoaded(GetHashKey(Config.NpcTyp)) do
          Citizen.Wait(0)
        end
		SpawnedPed = CreatePed(1, Config.NpcTyp, Config.blips[7].x, Config.blips[7].y, Config.blips[7].z, Config.blips[7].heading, true, true)
		FreezeEntityPosition(SpawnedPed, true)
		SetEntityInvincible(SpawnedPed, true)
		ModelSpawned = true
		TaskSetBlockingOfNonTemporaryEvents(SpawnedPed, true)
		Citizen.Wait(0)
		TaskStartScenarioInPlace(SpawnedPed, Config.NpcAnimation, 1, false)

	end
    end
	end
end)

Citizen.CreateThread(function()
while true do
    --HIER GUCKEN
  Citizen.Wait(0)
	local v2 = Config.blips[5]
	local pedCoords = GetEntityCoords(PlayerPedId(-1), true)
    local v3 = Config.blips[6]

  if (Vdist(pedCoords.x,pedCoords.y,pedCoords.z, v2.x,v2.y,v2.z) < 2) then
			ShowPedHelpDialog(_U('drug_sell'))
           DrawCustomMarker(32, v3, false, 0.4, 0.4, 0.3, true, true)
           menu:OpenWith('KEYBOARD', 'e') -- Press F1 to open Menu
  else
    menu:Close()
  end
  end
  end)
  

Citizen.CreateThread(function()
while true do
  Citizen.Wait(0)
  local v = Config.blips
  local  pedCoords = GetEntityCoords(PlayerPedId(-1), true)
  
   if (Vdist(pedCoords.x,pedCoords.y,pedCoords.z, v.x,v.y,v.z) < Config.DistanceToDraw) then
            DrawCustomMarker(31, v, false, 0.4, 0.4, 0.3, true, true)	 
   else
    Citizen.Wait(5000) 
       end
 end
end)


--PICKUP FROG
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        local playerCoords = GetEntityCoords(PlayerPedId(-1), true)
		local playerPos = GetEntityCoords(player)
		local targetPos = Config.blips[1]

		
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < Config.DistanceToPickup then
            if IsControlPressed(0, 51) and not isPickingUp then
					isPickingUp = true
						
						TriggerEvent("mythic_progbar:client:progress", {
                         name = "test",
                         duration = Config.PickupTime,
                         label = 'Du versuchst Frösche zu Fangen..',
                         useWhileDead = false,
                         canCancel = true,
                         controlDisables = {
                             disableMovement = true,
                             disableCarMovement = true,
                             disableMouse = false,
                             disableCombat = true,
                         },
                         animation = {
                             animDict = "amb@world_human_bum_wash@male@low@idle_a",
                             anim = "idle_c",
                         },
                         prop = {
                             model = "prop_buck_spade_03",
							 coords = { x = 0.2, y = -0.13, z = 0.1 },
							 rotation = { x = -150.0, y = 15.0, z = -18.0 },
                         }
                     }, function(status)
                         if not status then
                            TriggerServerEvent("frog:Catchloot")
                            Citizen.Wait(700)
							isPickingUp = false
                         end
                     end)
            else
			ShowPedHelpDialog(_U('start_farming'))
        end
        end
		end
end)



--PRE PROCESS THE FROG
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

		local targetPos = Config.blips[2]
		
		
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < Config.DistanceToPickup then
		DrawMarker(31, targetPos.x, targetPos.y, targetPos.z, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.4, 13, 132, 155, 155, 0, 0, 2, 0, 0, 0, 0)
            if IsControlPressed(0, 51) and not isProcessing then
                isProcessing = true
					
					
	                 	TriggerEvent("mythic_progbar:client:progress", {
                         name = "unique_action_name",
                         duration = Config.ProcessTime,
                         label = 'Du Verarbeitest gerade einen Frosch',
                         useWhileDead = false,
                         canCancel = true,
                         controlDisables = {
                             disableMovement = true,
                             disableCarMovement = true,
                             disableMouse = false,
                             disableCombat = true,
                         },
                         animation = {
                             animDict = "creatures@rottweiler@tricks@",
                             anim = "petting_franklin",
                         },
                         prop = {
                             model = "prop_cs_bowie_knife",
							 coords = { x = 0.06, y = 0.010, z = 0.023 },
							 rotation = { x = -80.0, y = 15.0, z = -18.0 },
                         }
                     }, function(status)
                         if not status then
							 TriggerServerEvent("frog:Processloot")
                             Citizen.Wait(700)
                             isProcessing = false
                         end
                     end)
            else
			ShowPedHelpDialog(_U('start_process'))
        end
        end
		end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
		local targetPos = Config.blips[3]
		
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < Config.DistanceToPickup then
		DrawMarker(31, targetPos.x, targetPos.y, targetPos.z, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.4, 13, 112, 115, 155, 0, 0, 2, 0, 0, 0, 0)
            if IsControlPressed(0, 51) and not isProcessing and cooking_pot then
                isProcessing = true
					
					TriggerEvent("mythic_progbar:client:progress", {
                         name = "unique_action_name",
                         duration = Config.PickupTime,
                         label = 'Du Verarbeitest gerade einen Frosch',
                         useWhileDead = false,
                         canCancel = true,
                         controlDisables = {
                             disableMovement = true,
                             disableCarMovement = true,
                             disableMouse = false,
                             disableCombat = true,
                         },
                         animation = {
                            animDict = "anim@amb@clubhouse@bar@drink@idle_a",
                             anim = "idle_a_bartender",
                         },
                         prop = {
                             model = "prop_kitch_pot_huge",
							 coords = { x = -0.02, y = 0.11, z = -0.11 },
							 rotation = { x = 11.0, y = 15.0, z = -18.0 },
                         }
                     }, function(status)
                         if not status then
							TriggerServerEvent("frog:getcookedfrog")
                            Citizen.Wait(700)
                            isProcessing = false
                         end
                     end) 
			else
			isProcessing = false
			cooking_pot = true
			ShowPedHelpDialog(_U('start_cooking'))
        end
        
		
		end
		end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

		local targetPos = Config.blips[4]

        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < Config.DistanceToPickup then
		DrawMarker(31, targetPos.x, targetPos.y, targetPos.z, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.4, 13, 172, 125, 175, 0, 0, 2, 0, 0, 0, 0)
			if IsControlPressed(0, 51) and not isProcessing then	
                isProcessing = true
					

					TriggerEvent("mythic_progbar:client:progress", {
                         name = "unique_action_name",
                         duration = Config.PickupTime,
                         label = 'Du Verarbeitest Das Hautsekret zu Bufotenin',
                         useWhileDead = false,
                         canCancel = true,
                         controlDisables = {
                             disableMovement = true,
                             disableCarMovement = true,
                             disableMouse = false,
                             disableCombat = true,
                         },
                         animation = {
                            animDict = "anim@amb@clubhouse@bar@drink@idle_a",
                             anim = "idle_a_bartender",
                         },
                         prop = {
                             model = "prop_kitch_pot_huge",
							 coords = { x = -0.02, y = 0.11, z = -0.11 },
							 rotation = { x = 11.0, y = 15.0, z = -18.0 },
                         }
                     }, function(status)
                         if not status then
                            TriggerServerEvent("frog:removepreprocessed")
							TriggerServerEvent("frog:getfinishfrogdrug")
                            Citizen.Wait(700)
                            isProcessing = false
                         end
                     end)
			else
			isProcessing = false
			ShowPedHelpDialog(_U('getdrugfrog'))
        end
        
		
		end
		end
end)























RegisterNetEvent('frog:EatFinishFrogDrug')
AddEventHandler('frog:EatFinishFrogDrug', function()
  
  local playerPed = GetPlayerPed(-1)
  local playerPed = PlayerPedId()
 
    RequestAnimSet("MOVE_M@QUICK") 
    while not HasAnimSetLoaded("MOVE_M@QUICK") do
      Citizen.Wait(0)
    end    
	exports["skeexsNotify"]:TriggerNotification({
							   ['type'] = "success",
							   ['message'] = '~r~Was ist das denn?'
})
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, 1)
	Citizen.Wait(2000)
	ClearPedTasksImmediately(playerPed)
	TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STRIP_WATCH_STAND", 0, 1)
    Citizen.Wait(2000)
	ClearPedTasksImmediately(playerPed)
	Citizen.Wait(2000)
		exports["skeexsNotify"]:TriggerNotification({
							   ['type'] = "success",
							   ['message'] = '~r~OH MEIN GOTT... FUCK IST DAS ZEUG GEIL'
})
    SetTimecycleModifier("spectator5")
	ShakeGameplayCam("LARGE_EXPLOSION_SHAKE", 2.0)
	Citizen.Wait(400)
    SetPedMovementClipset(playerPed, "MOVE_M@QUICK", true)
    SetPedIsDrunk(playerPed, true)
	SetPedMoveRateOverride(PlayerId(),10.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
    AnimpostfxPlay("DrugsMichaelAliensFight", 10000001, true)
    ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.3)
    Citizen.Wait(5000)
-- after wait stop all 
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end)