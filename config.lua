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


Config.CookingAnimation = 'PROP_HUMAN_BBQ'
Config.Animation = 'WORLD_HUMAN_BUM_WASH'
Config.ProcessAnimation = 'PROP_HUMAN_BUM_BIN'
Config.PickupTime = '1000'
Config.ProcessTime = '1000'


Config.FrogFarm = {
  Routes = {
  {
  FrogPickup = {
      {x = -2396.4287109375, y = 2649.064453125, z = 0.81300586462021},
	 },
	FrogProcess = {
	  {x = 1582.3189697266, y = 3619.7448730469, z = 38.775211334229},
	 },  	 
	FrogCook1 = {
	  {x = 2557.6552734375, y = 4283.966796875, z = 41.616443634033},
	 },  	 	 
	FrogFinishProcess = {
	  {x = 1443.2707519531, y = 6331.8100585938, z = 23.981914520264},
}	  
}
}
}
