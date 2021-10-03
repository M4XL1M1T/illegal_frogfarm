Config = {}
Config.Locale                     = 'de'

--Reduce the drop chance just add more items
Config.CatchItems = {
  "frog_pet",
  "fish_raw",
  "earthworm",
}

--Random Drop rate on Catch
Config.Catchlootmin = 5
Config.Catchlootmax = 15

--Sellprice
Config.Blackmoney = 400


Config.getfinishfrogdrug = 1
Config.Cookedfrogvalue = 1

--Reduce the drop chance just add more items
Config.ProcessItems = {
  "frog_preprocessed",
  "frog_bone",
  "frog_guts",
}

Config.DistanceToDraw = 5.5
Config.DistanceToPickup = 1.0

--Random Drop rate on Process
Config.Processlootmin = 5
Config.Processlootmax = 15

--How much remove on Process
Config.Removefrog = 1
Config.Removepreprocessed = 1
Config.RemoveCookedFrog = 1

Config.NpcTyp = "u_m_m_streetart_01"

Config.CookingAnimation = 'PROP_HUMAN_BBQ'
Config.Animation = 'WORLD_HUMAN_BUM_WASH'
Config.ProcessAnimation = 'PROP_HUMAN_BUM_BIN'
Config.NpcAnimation = 'WORLD_HUMAN_BUM_WASH'

Config.PickupTime = '1000'
Config.ProcessTime = '1000'

--https://docs.fivem.net/docs/game-references/blips/
Config.blips = {
  {title="Kröten Sammeln", colour=3, icon=527, x = -2396.4287109375, y = 2649.064453125, z = 0.81300586462021},
  {title="Kröten Sezieren", colour=23, icon=154, x = 1582.3189697266, y = 3619.7448730469, z = 38.775211334229},
  {title="Kröten Hautsekret verarbeiten", colour=25, icon=366, x = 2557.6552734375, y = 4283.966796875, z = 41.616443634033},
  {title="Kröten Bufotenin Herstellen", colour=26, icon=51, x = 1443.2707519531, y = 6331.8100585938, z = 23.981914520264},
  {title="Kröten Bufotenin Verkaufen", colour=25, icon=500, x = -1865.1788330078, y = -507.93322753906, z = 27.071683883667},
  --The markerposition above the npc head
  {title="Kröten Bufotenin Marker", colour=25, icon=500, x = -1866.4066162109, y = -509.87258911133, z = 28.87262268066},
  {title="Kröten Bufotenin NPC", colour=25, icon=500, x = -1866.6148681641, y = -510.04821777344, z = 26.717262268066, heading = 313.4},
      }