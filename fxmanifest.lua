fx_version 'cerulean'
game 'gta5'

author 'shreddykr'
description 'skr-atmhack - A configurable ATM hacking script with mini-games and player-specific cooldowns.'
version '1.0.0'

client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

dependencies {
    'qb-core',         -- Optional if using qb-core as your framework
    'boii_minigames'   -- Required for the mini-game integration
}