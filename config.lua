Config = {}
Config.Locale                     = 'de'
Config.Blip = {
  color   = 23,
  alpha   = 255,
  friend  = 1,
  short   = 1,
  --Size on Map
  scale   = 0.9,
  --Disable Blips e.g. 1 Visible 2 Disabled
  display = 2,
  --Blip Icon
  sprite  = 484,
  name    = 'Illegale Frosch Farm',
}

--Reduce the drop chance just add more items
Config.CatchItems = {
  "frog_pet",
  "fish_raw",
  "earthworm",
  "nothing",
}

--Random Drop rate on Catch
Config.Catchlootmin = 5
Config.Catchlootmax = 15

Config.getfinishfrogdrug = 1
Config.Cookedfrogvalue = 1

--Reduce the drop chance just add more items
Config.ProcessItems = {
  "frog_preprocessed",
  "frog_bone",
  "frog_guts",
  "nothing",
}



--Random Drop rate on Process
Config.Processlootmin = 5
Config.Processlootmax = 15

--How much remove on Process
Config.Removefrog = 1
Config.Removepreprocessed = 1
Config.RemoveCookedFrog = 1


Config.CookingAnimation = 'PROP_HUMAN_BBQ'
Config.Animation = 'WORLD_HUMAN_BUM_WASH'
Config.ProcessAnimation = 'PROP_HUMAN_BUM_BIN'
Config.PickupTime = '4000'

Config.FrogFarm = {
  Routes = {
  {
    FrogPickup = {
      {x = -2396.4287109375, y = 2649.064453125, z = 0.81300586462021},
	 },
	FrogProcess = {
	  {x = 1786.991142578, y = 3892.5724902344, z = 34.384990692139},
	 },  	 
	FrogCook1 = {
	  {x = 2557.6552734375, y = 4283.966796875, z = 41.616443634033},
	 },  	 
	FrogCook2 = {
	  {x = 97.427101135254, y = 3684.1848144531, z = 39.712333679199},
	 },  	 
	FrogCook3 = {
	  {x = 174.72912597656, y = -1202.2397460938, z = 29.295093536377},
	  },  	 
	FrogFinishProcess = {
	  {x = 1443.2707519531, y = 6331.8100585938, z = 23.981914520264},
}	  
}
}
}
