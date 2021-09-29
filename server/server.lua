ESX = nil
local catchlootmin = Config.Catchlootmin
local catchlootmax = Config.Catchlootmax

local processlootmin = Config.Processlootmin
local processlootmax = Config.Processlootmax
local frogcooked = Config.Cookedfrogvalue


local removefroginv = Config.Removefrog
local removefrogpreprocessed = Config.Removepreprocessed

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
  
  xPlayer.removeInventoryItem(frog_pet, removefroginv)
  
end)

RegisterServerEvent('frog:removepreprocessed')
AddEventHandler('frog:removepreprocessed', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.removeInventoryItem(frog_preprocessed, removefrogpreprocessed)
  
end)

RegisterServerEvent('frog:getcookedfrog')
AddEventHandler('frog:getcookedfrog', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  
  xPlayer.addInventoryItem(frog_cooked, frogcooked)
end)


--RegisterServerEvent('frog:check')
--AddEventHandler('frog:check', function(_)
--    local player = ESX.GetPlayerFromId(source)
--
--    end
--end)