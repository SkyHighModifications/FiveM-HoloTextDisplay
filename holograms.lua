-- Holograms / Floating text Script by SkyHigh Modifications

Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
    while true do
        Citizen.Wait(0)
        
        -- Hologram No. 1
        if IsNearPosition(-262.27, -969.58, 33.55, 10.0) then
            Draw3DText(-262.27, -969.58, 33.55, -1.400, "Welcome", 4, 0.1, 0.1)
            Draw3DText(-262.27, -969.58, 33.55, -1.600, "To", 4, 0.1, 0.1)
            Draw3DText(-262.27, -969.58, 33.55, -1.800, "your server name", 4, 0.1, 0.1)  -- Location: Job Centre
        end

        -- Hologram No. 2
        if IsNearPosition(-266.68, -968.37, 32.04, 10.0) then
            Draw3DText(-266.68, -968.37, 32.04, -1.400, "Discord: ", 4, 0.1, 0.1)
            Draw3DText(-266.68, -968.37, 32.04, -1.600, "Website: ", 4, 0.1, 0.1)
            Draw3DText(-266.68, -968.37, 32.04, -1.800, "Tiktok: ", 4, 0.1, 0.1) -- Location: Job Centre
        end
    end
end

function IsNearPosition(x, y, z, distance)
    local playerCoords = GetEntityCoords(GetPlayerPed(-1))
    return Vdist(x, y, z, playerCoords.x, playerCoords.y, playerCoords.z) < distance
end

-- Function to draw 3D text
function Draw3DText(x, y, z, verticalOffset, textInput, fontId, scaleX, scaleY)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = Vdist(px, py, pz, x, y, z)
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    SetTextScale(scaleX * scale, scaleY * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255) -- You can change the text color here: https://www.rapidtables.com/web/color/RGB_Color.html
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x, y, z + 2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

--[[
    Holograms / Floating text Script by Berkshire Modifications

    Just put in the coordinates you get when standing on the ground; it's above the ground then.
    By default, you only see the hologram when you are within 10m of it; to change that, edit the 10.0 in front of the "then."
    The default holograms are at the Observatory.

    If you want to add a line to the hologram, just make a new Draw3DText line with the same coordinates and edit the vertical offset.

    Formatting:
        Draw3DText(x, y, z, vertical offset, "text", font, text size, text size)

    To add a new hologram, copy-paste this example under the existing ones, and put coordinates and text into it.

    if IsNearPosition(X, Y, Z, 10.0) then
        Draw3DText(X, Y, Z, -1.400, "TEXT", 4, 0.1, 0.1)
        Draw3DText(X, Y, Z, -1.600, "TEXT", 4, 0.1, 0.1)
        Draw3DText(X, Y, Z, -1.800, "TEXT", 4, 0.1, 0.1)
    end
]]
