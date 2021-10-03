      Citizen.CreateThread(function()

            for _, info in pairs(Config.blips) do
              info.blip = AddBlipForCoord(info.x, info.y, info.z)
              SetBlipSprite(info.blip, info.icon)
              SetBlipDisplay(info.blip, 4)
              SetBlipScale(info.blip, 1.0)
              SetBlipColour(info.blip, info.colour)
              SetBlipAsShortRange(info.blip, true)
              BeginTextCommandSetBlipName("STRING")
              AddTextComponentString(info.title)
              EndTextCommandSetBlipName(info.blip)
            end
        end)