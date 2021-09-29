ESX = nil
local catchlootmin = Config.Catchlootmin
local catchlootmax = Config.Catchlootmax

local processlootmin = Config.Processlootmin
local processlootmax = Config.Processlootmax

local removefrog = Config.Removefrog

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function RandomItem2()
  return Config.CatchItems[math.random(#Config.CatchItems)]
end

function RandomNumber2()
	return math.random(catchlootmin,catchlootmax)
end

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

RegisterServerEvent('frog:Processloot')
AddEventHandler('frog:Processloot', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  math.randomseed(GetGameTimer())
  
  xPlayer.addInventoryItem(RandomItem(), RandomNumber())
  
end)


RegisterServerEvent('frog:removefrog')
AddEventHandler('frog:removefrog', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  
  xPlayer.RemoveInventoryItem(frog_pet, removefrog)
  
end)


--RegisterServerEvent('frog:check')
--AddEventHandler('frog:check', function(_)
--    local player = ESX.GetPlayerFromId(source)
--
--    end
--end)