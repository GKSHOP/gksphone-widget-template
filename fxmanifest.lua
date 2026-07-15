fx_version 'cerulean'
game 'gta5'

name 'custom-widget'
author 'GKSPHONE'
description 'Demo home-screen widget for GKSPHONE AddCustomWidget API'
version '1.0.0'

lua54 'yes'

client_script 'client.lua'

-- Served at https://cfx-nui-custom-widget/ui/widget.html (no ui_page needed)
files {
    'ui/widget.html',
    'ui/widget.css',
    'ui/widget.js'
}
