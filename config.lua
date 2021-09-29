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


Config.CatchItems = {
  "frog_pet",
  "fish_raw",
  "nichts",
}

--Random Drop rate on Catch
Config.Catchlootmin = 1
Config.Catchlootmax = 4


Config.ProcessItems = {
  "frog_bone",
  "frog_guts",
  "nichts",
}

--Random Drop rate on Process
Config.Processlootmin = 1
Config.Processlootmax = 4

--How much remove on Process
Config.Removefrog = 2


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
	 }  	 
	}
  }
}