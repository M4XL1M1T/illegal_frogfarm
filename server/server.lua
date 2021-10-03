ESX = nil
local catchlootmin = Config.Catchlootmin
local catchlootmax = Config.Catchlootmax

local processlootmin = Config.Processlootmin
local processlootmax = Config.Processlootmax

local frogcooked = Config.Cookedfrogvalue


local removefroginv = Config.Removefrog
local removefrogpreprocessed = Config.Removepreprocessed
local removefrogcookedfrog = Config.RemoveCookedFrog
local finishfrogdrug = Config.getfinishfrogdrug

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function RandomItem2()
  return Config.CatchItems[math.random(#Config.CatchItems)]
end

function RandomNumber2()
	return math.random(catchlootmin,catchlootmax)
end

function RandomItem()
  return Config.ProcessItems[math.random(#Config.ProcessItems)]
end

function RandomNumber()
	return math.random(processlootmin,processlootmax)
end



--Get items from Pickup
RegisterServerEvent('frog:Catchloot')
AddEventHandler('frog:Catchloot', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  local itemcount = Config.Catchlootmax

  math.randomseed(GetGameTimer())
  
  if (xPlayer.canCarryItem('frog_pet', itemcount)) then
    xPlayer.addInventoryItem(RandomItem2(), RandomNumber2())
  else
    xPlayer.showNotification('Du hast kein Platz im Inventar!')
  end
end)

--Get items from Pre Processing
RegisterServerEvent('frog:Processloot')
AddEventHandler('frog:Processloot', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  local item = xPlayer.getInventoryItem('frog_pet')
  math.randomseed(GetGameTimer())

  if item.count > 1 then
    xPlayer.addInventoryItem(RandomItem(), RandomNumber())
    xPlayer.removeInventoryItem('frog_pet', removefroginv)
  else
    xPlayer.showNotification('Du hast keine Kröte im Inventar!')
  end
end)

RegisterServerEvent('frog:getcookedfrog')
AddEventHandler('frog:getcookedfrog', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  
  if (xPlayer.canCarryItem('frog_cooked', Config.Catchlootmax)) then
  xPlayer.removeInventoryItem('frog_preprocessed', '1')
  xPlayer.addInventoryItem('frog_cooked', finishfrogdrug)
  xPlayer.showNotification("Du Bekommst Kröten Hautsekret")
   else
  xPlayer.showNotification("Dein Inventar ist voll! Schmeiße etwas weg.")
  end
 
end)

RegisterServerEvent('frog:getfinishfrogdrug')
AddEventHandler('frog:getfinishfrogdrug', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  
  if (xPlayer.canCarryItem('frog_drug', '1')) then
  xPlayer.removeInventoryItem('frog_cooked', removefrogcookedfrog)
  xPlayer.addInventoryItem('frog_drug', finishfrogdrug)
  xPlayer.showNotification("Du Bekommst Kröten Bufotenin")
   else
  xPlayer.showNotification("Dein Inventar ist voll! Schmeiße etwas weg.")
  end
 
end)


RegisterServerEvent('frog:sell')
AddEventHandler('frog:sell', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  local item = xPlayer.getInventoryItem('frog_drug')
  local money = Config.Blackmoney * item.count

  if item.count > 1 then
    xPlayer.removeInventoryItem('frog_drug', item.count)
    xPlayer.addAccountMoney('black_money', money)
    xPlayer.showNotification('Du Bekommst ' ..  money .. ' $ Schwarzgeld' .. ' Für ' .. item.count .. ' Kröten')
  else
    xPlayer.showNotification('Du hast keine Kröten im Inventar!')
  end
end)




ESX.RegisterUsableItem('frog_bone', function(source)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('frog_bone', 1)
	
	TriggerClientEvent('esx_status:set', source, 'thirst', 200)
	TriggerClientEvent('esx_status:set', source, 'hunger', 200)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	xPlayer.showNotification(_U('used_frog_bone'))
end)

ESX.RegisterUsableItem('frog_drug', function(source)
        
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('frog_drug', 1)

	TriggerClientEvent('frog:EatFinishFrogDrug', source)
end)