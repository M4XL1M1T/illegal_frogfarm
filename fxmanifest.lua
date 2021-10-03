fx_version 'bodacious'
games {'gta5'}

author 'Einfachmax96'
description 'Illegal Frog Farm'
version '1.0'

client_scripts {
    '@es_extended/locale.lua',
	'@menuv/menuv.lua',
    'client/client.lua',
	'client/blips.lua',
	'locale/de.lua',
	'config.lua',
	'@cr1tika7_utils/client_utils.lua',
	
}

server_scripts {
    '@es_extended/locale.lua',
	'config.lua',
    'server/server.lua',
	'locales/de.lua',
	'@cr1tika7_utils/server_utils.lua',
}