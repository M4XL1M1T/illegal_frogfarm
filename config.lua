Config = {}
Config.Locale                     = 'de'
Config.Blip = {
  color   = 23,
  alpha   = 255,
  friend  = 1,
  short   = 1,
  scale   = 0.9,
  display = 2,
  sprite  = 484,
  name    = 'Illegale Frosch Farm'
}

--Reduce the drop chance just add more items
Config.CatchItems = {
  "frog_pet",
  "fish_raw",
  "nothing",
}

--Random Drop rate on Catch
Config.Catchlootmin = 1
Config.Catchlootmax = 4

--Reduce the drop chance just add more items
Config.ProcessItems = {
  "frog_preprocessed",
  "frog_bone",
  "frog_guts",
  "nothing",
}

Config.Cookedfrogvalue = 1

--Random Drop rate on Process
Config.Processlootmin = 2
Config.Processlootmax = 4

--How much remove on Process
Config.Removefrog = 1
Config.Removepreprocessed = 1

Config.Animation = 'PROP_HUMAN_BUM_BIN'
Config.PickupTime = '1000'

Config.FrogFarm = {
  Routes = {
  {
    FrogPickup = {
      {x= -655.16418457031, y = 4413.41015625, z = 15.58191204071},
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
	 } 	  	 
	}
  }
 }
