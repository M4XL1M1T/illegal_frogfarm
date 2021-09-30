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

        local playerCoords = GetEntityCoords(PlayerPedId(), true)
		local playerPos = GetEntityCoords(player)
		local targetPos = Config.FrogFarm.Routes[1].FrogPickup[1]
		
		

		DrawMarker(24, targetPos.x, targetPos.y, targetPos.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < 3.0 then
            if IsControlPressed(0, 51) and not isPickingUp then
					isPickingUp = true
					

					TaskStartScenarioInPlace(playerPed, Config.Animation, 0, false)
					
						Citizen.Wait(Config.PickupTime)
						TriggerServerEvent("frog:Catchloot")
						ClearPedTasks(playerPed)
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
		
		DrawMarker(24, targetPos.x, targetPos.y, targetPos.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < 1.5 then
            if IsControlPressed(0, 51) and not isProcessing then
					isProcessing = true
					
					
					TaskStartScenarioInPlace(playerPed, Config.ProcessAnimation, 0, false)
					Citizen.Wait(Config.PickupTime)
					TriggerServerEvent("frog:removefrog")
					TriggerServerEvent("frog:Processloot")
						
						ESX.Game.DeleteObject(nearbyObject)
						ClearPedTasks(playerPed)
							   
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

		
		DrawMarker(24, targetPos.x, targetPos.y, targetPos.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < 1.5 then
            if IsControlPressed(0, 51) and not isProcessing and cooking_pot then
					isProcessing = true
					
					TaskStartScenarioInPlace(playerPed, Config.CookingAnimation, 0, false)
					
					Citizen.Wait(Config.PickupTime)
					TriggerServerEvent("frog:removepreprocessed")
					Citizen.Wait(0)
					TriggerServerEvent("frog:getcookedfrog")

						ClearPedTasks(playerPed)
							   
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
        Citizen.Wait(15)

        local playerCoords = GetEntityCoords(PlayerPedId(source), true)
		local playerPos = GetEntityCoords(player)
		local targetPos = Config.FrogFarm.Routes[1].FrogFinishProcess[1]

		
		DrawMarker(24, targetPos.x, targetPos.y, targetPos.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 13, 232, 255, 155, 1, 1, 2, 0, 0, 0, 0)

        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < 1.5 then
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