local blip          = nil
local ESX           = nil
local coords         = GetEntityCoords(playerPed)
local playerPed = PlayerPedId()
local isPickingUp = false
local isProcessing = false
local cooking_pot = false





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


Citizen.CreateThread(function()
    for _, v in ipairs(Config.FrogFarm.Routes) do
        for key, _v in ipairs(v.FrogPickup) do
			blip = CreateCustomBlip(
			_v,
            Config.Blip['sprite'],
            Config.Blip['display'],
            Config.Blip['scale'],
            Config.Blip['color'],
            Config.Blip['alpha'],
            Config.Blip['friend'],
            Config.Blip['short'],
            Config.Blip['name'],
			'TEST'
			)
        end
    end
end)

Citizen.CreateThread(function()
    for _, v in ipairs(Config.FrogFarm.Routes) do
        for key, _v in ipairs(v.FrogProcess) do
			blip = CreateCustomBlip(
			_v,
            Config.Blip['sprite'],
            Config.Blip['display'],
            Config.Blip['scale'],
            Config.Blip['color'],
            Config.Blip['alpha'],
            Config.Blip['friend'],
            Config.Blip['short'],
            Config.Blip['name'],
			'TEST'
			)
        end
    end
end)

Citizen.CreateThread(function()
    for _, v in ipairs(Config.FrogFarm.Routes) do
        for key, _v in ipairs(v.FrogCook1) do
			blip = CreateCustomBlip(
			_v,
            Config.Blip['sprite'],
            Config.Blip['display'],
            Config.Blip['scale'],
            Config.Blip['color'],
            Config.Blip['alpha'],
            Config.Blip['friend'],
            Config.Blip['short'],
            Config.Blip['name'],
			'TEST'
			)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerCoords = GetEntityCoords(PlayerPedId(-1), true)
		local playerPos = GetEntityCoords(player)
		local targetPos = Config.FrogFarm.Routes[1].FrogPickup[1]

		
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < Config.DistanceToDraw then
		DrawMarker(31, targetPos.x, targetPos.y, targetPos.z, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.4, 13, 232, 155, 155, 0, 0, 2, 0, 0, 0, 0)
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
							isPickingUp = false
                         end
                     end)
            else
			isPickingUp = false
			ShowPedHelpDialog(_U('start_farming'))
        end
        end
		end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerCoords = GetEntityCoords(PlayerPedId(), true)
		local playerPos = GetEntityCoords(player)
		local targetPos = Config.FrogFarm.Routes[1].FrogProcess[1]
		
		
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < Config.DistanceToDraw then
		DrawMarker(31, targetPos.x, targetPos.y, targetPos.z, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.4, 13, 132, 155, 155, 0, 0, 2, 0, 0, 0, 0)
            if IsControlPressed(0, 51) and not isProcessing then
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
                             TriggerServerEvent("frog:removefrog")
							 TriggerServerEvent("frog:Processloot")
                         end
                     end)
				   
            else
			isProcessing = false
			ShowPedHelpDialog(_U('start_process'))
        end
        end
		end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerCoords = GetEntityCoords(PlayerPedId(source), true)
		local playerPos = GetEntityCoords(player)
		local targetPos = Config.FrogFarm.Routes[1].FrogCook1[1]
		
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < Config.DistanceToDraw then
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
                            animDict = "amb@world_human_bum_wash@male@low@idle_a",
                             anim = "idle_a",
                         },
                         prop = {
                             model = "prop_kitch_pot_huge",
							 coords = { x = 0.2, y = -0.13, z = 0.1 },
							 rotation = { x = -150.0, y = 15.0, z = -18.0 },
                         }
                     }, function(status)
                         if not status then
                            TriggerServerEvent("frog:removepreprocessed")
							TriggerServerEvent("frog:getcookedfrog")
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
        Citizen.Wait(0)

        local playerCoords = GetEntityCoords(PlayerPedId(source), true)
		local playerPos = GetEntityCoords(player)
		local targetPos = Config.FrogFarm.Routes[1].FrogFinishProcess[1]

		
		

        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < Config.DistanceToDraw then
		DrawMarker(31, targetPos.x, targetPos.y, targetPos.z, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.4, 13, 172, 125, 175, 0, 0, 2, 0, 0, 0, 0)
			if IsControlPressed(0, 51) and not isProcessing then
					isProcessing = true
					
					TaskStartScenarioInPlace(playerPed, Config.CookingAnimation, 0, false)
					Citizen.Wait(Config.PickupTime)
					TriggerServerEvent("frog:removecookedfrog")
					Citizen.Wait(0)
					TriggerServerEvent("frog:getfinishfrogdrug")
						Citizen.Wait(Config.PickupTime)
						ClearPedTasks(playerPed)
							   
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