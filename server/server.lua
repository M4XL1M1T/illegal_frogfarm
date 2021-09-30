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

--Get items from Pickup
RegisterServerEvent('frog:Catchloot')
AddEventHandler('frog:Catchloot', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  math.randomseed(GetGameTimer())
  
  xPlayer.addInventoryItem(RandomItem2(), RandomNumber2())
  
end)


function RandomItem()
  return Config.ProcessItems[math.random(#Config.ProcessItems)]
end

function RandomNumber()
	return math.random(processlootmin,processlootmax)
end

--Get items from Pre Processing
RegisterServerEvent('frog:Processloot')
AddEventHandler('frog:Processloot', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  math.randomseed(GetGameTimer())
  
  xPlayer.addInventoryItem(RandomItem(), RandomNumber())
  
end)

--Remove frog from inventory on pre process
RegisterServerEvent('frog:removefrog')
AddEventHandler('frog:removefrog', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  
  xPlayer.removeInventoryItem('frog_pet', removefroginv)
  
end)

RegisterServerEvent('frog:removepreprocessed')
AddEventHandler('frog:removepreprocessed', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.removeInventoryItem('frog_preprocessed', removefrogpreprocessed)
  
end)

RegisterServerEvent('frog:getcookedfrog')
AddEventHandler('frog:getcookedfrog', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  
  xPlayer.addInventoryItem('frog_cooked', frogcooked)
end)


RegisterServerEvent('frog:removecookedfrog')
AddEventHandler('frog:removecookedfrog', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.removeInventoryItem('frog_cooked', removefrogcookedfrog)
  
end)

RegisterServerEvent('frog:getfinishfrogdrug')
AddEventHandler('frog:getfinishfrogdrug', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  
  xPlayer.addInventoryItem('frog_drug', finishfrogdrug)
end)


ESX.RegisterUsableItem('frog_drug', function(source)
        
    local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
xPlayer.removeInventoryItem('frog_drug', 1)

TriggerClientEvent('frog:EatFinishFrogDrug', source)
end)