resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Gang Job'

version '1.0.1'

server_scripts {
  '@es_extended/locale.lua',
  'locales/br.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/es.lua',
  '@mysql-async/lib/MySQL.lua',
  'lekiler_config.lua',
  'server/lekiler_main.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/br.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/es.lua',
  'lekiler_config.lua',
  'client/lekiler_main.lua'
}
