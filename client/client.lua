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
					--TaskPlayAnim(playerPed, tabletDict, tabletAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
						
						TriggerServerEvent("frog:Catchloot")
						
						
						Citizen.Wait(Config.PickupTime)
						ESX.Game.DeleteObject(nearbyObject)
						ClearPedTasks(playerPed)
--						exports["skeexsNotify"]:TriggerNotification({
--							   ['type'] = "error",
--							   ['message'] = '~r~Der Frosch war Feucht und Glatt und ist Dir aus der Hand Geflutscht :('
--})
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
					
					TaskStartScenarioInPlace(playerPed, Config.Animation, 0, false)
					TriggerServerEvent("frog:removefrog")
					TriggerServerEvent("frog:Processloot")
					

						Citizen.Wait(Config.PickupTime)
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

        local playerCoords = GetEntityCoords(PlayerPedId(), true)
		local playerPos = GetEntityCoords(player)
		local targetPos = Config.FrogFarm.Routes[1].FrogCook1[1]

		
		DrawMarker(24, targetPos.x, targetPos.y, targetPos.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), targetPos.x, targetPos.y, targetPos.z, true) < 1.5 then
            if IsControlPressed(0, 51) and not isProcessing and cooking_pot then
					isProcessing = true
					
					TaskStartScenarioInPlace(playerPed, Config.Animation, 0, false)
					print("test")
					TriggerServerEvent("frog:removepreprocessed")
					print("test2")
					Citizen.Wait(0)
					TriggerServerEvent("frog:getcookedfrog")
					print("test3")


						Citizen.Wait(Config.PickupTime)
						ClearPedTasks(playerPed)
							   
			else
			isProcessing = false
			cooking_pot = true
			ShowPedHelpDialog(_U('start_process'))
        end
        
		
		end
		end
end)