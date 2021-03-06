local show = true

if show == true then

    RegisterNetEvent('playerSpawned')
    AddEventHandler('playerSpawned', function(spawn)


    Citizen.CreateThread(function() 
        while show == true do     
            Citizen.Wait(1)	
            local playercoords = GetEntityCoords(GetPlayerPed(-1))
			Drawing.draw3DText(playercoords.x, playercoords.y + 10, playercoords.z + 1.700, "Bem-vindo ao ~g~Hydra RP !", 6, 1.0, 0.8)
			Drawing.draw3DText(playercoords.x, playercoords.y + 10, playercoords.z, "Regras e Informações no Discord: ~b~Hydra RP ", 8, 0.4, 0.3)
			Drawing.draw3DText(playercoords.x, playercoords.y + 10, playercoords.z - .700, "~y~Bom jogo !", 8, 0.4, 0.3)
        end
    end)

    Citizen.CreateThread(function()
        if show == true then
          Citizen.Wait(10000)
          show = false
        end
    end)


    Drawing = setmetatable({}, Drawing)
    Drawing.__index = Drawing

    function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
        local px,py,pz=table.unpack(GetGameplayCamCoords())
        local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

        local scale = (1/dist)*20
        local fov = (1/GetGameplayCamFov())*100
        local scale = scale*fov

        SetTextScale(scaleX*scale, scaleY*scale)
        SetTextFont(fontId)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 190)
        SetTextDropshadow(1, 1, 1, 0, 255)
        SetTextEdge(2, 0, 0, 0, 220)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(textInput)
        SetDrawOrigin(x,y,z+2, 0)
        DrawText(0.0, 0.0)
        ClearDrawOrigin()
    end
    
    end)


end
