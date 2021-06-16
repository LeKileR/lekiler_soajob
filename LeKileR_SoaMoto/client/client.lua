print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^0 ^5LeKileR^7")
print("^0[^3Version^0] ^7:^0 ^01.0^7")
print("^0======================================================================^7")



local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


ESX = nil 




Citizen.CreateThread(function()

	while ESX == nil do

		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

		Citizen.Wait(0)

	end



	while ESX.GetPlayerData().job2 == nil do

		Citizen.Wait(10)

	end



	PlayerData = ESX.GetPlayerData()

end)



RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)

	PlayerData.job2 = job2

end)


_menuPool = NativeUI.CreatePool()
soaMenu = NativeUI.CreateMenu("Garage Soa", "Liste des véhicules soa", nil, nil, "shopui_title_ie_modgarage", "shopui_title_ie_modgarage")
_menuPool:Add(soaMenu)



spawnCar = function(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local vehicle = CreateVehicle(car, -1093.53, 4946.77, 218.34, 167.86, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "Soa")
    SetVehicleColours(vehicle, 0, 0)

end







function AddSoaMenu(menu)

    local motomenu = _menuPool:AddSubMenu(menu, "Moto", nil, nil, "", "")
    motomenu.Item:SetRightBadge(BadgeStyle.None)

    






    local zombiea = NativeUI.CreateItem("Zombie", "Appuyer sur ENTRER pour sortir ce véhicule")
    motomenu.SubMenu:AddItem(zombiea)
    zombiea:SetRightBadge(BadgeStyle.Car)

    local chimera = NativeUI.CreateItem("Chimera", "Appuyer sur ENTRER pour sortir ce véhicule")
    motomenu.SubMenu:AddItem(chimera)
    chimera:SetRightBadge(BadgeStyle.Car)

    local wolfsbane = NativeUI.CreateItem("Wolfsbane", "Appuyer sur ENTRER pour sortir ce véhicule")
    motomenu.SubMenu:AddItem(wolfsbane)
    wolfsbane:SetRightBadge(BadgeStyle.Car)




  







    motomenu.SubMenu.OnItemSelect = function(menu, item)
        if item == zombiea then 
            ESX.ShowAdvancedNotification("Soa", "Actions Effectué", "Voici Ton Véhicule Man ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("zombiea")
            _menuPool:CloseAllMenus(true)
        elseif item == chimera then
            ESX.ShowAdvancedNotification("Soa", "Actions Effectué", "Voici Ton Véhicule Man ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("chimera")
            _menuPool:CloseAllMenus(true)
        elseif item == wolfsbane then
            ESX.ShowAdvancedNotification("Soa", "Actions Effectué", "Voici Ton Véhicule Man ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("wolfsbane")
            _menuPool:CloseAllMenus(true)
        elseif item == moonbeam then
            ESX.ShowAdvancedNotification("Soa", "Actions Effectué", "Voici Ton Véhicule Man ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("moonbeam2")
            _menuPool:CloseAllMenus(true)
        end

    end



  


end

AddSoaMenu(soaMenu)
_menuPool:RefreshIndex()



local soa = {
    {x = -1093.24, y = 4952.61, z = 217.37},

}





Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        for k in pairs(soa) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, soa[k].x, soa[k].y, soa[k].z)

            if dist <= 1.2 then
             if PlayerData.job2 ~= nil and PlayerData.job2.name == 'soa' then 
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec ~b~Tig")
                if IsControlJustPressed(1,51) then 
                    latestPoint = soa[k].type 
                    soaMenu:Visible(not soaMenu:Visible())
                end
            end
                
            end
        end
    end
end)






local v1 = vector3(-1093.24, 4952.61, 219.45)   -- Le nom au dessus du PNJ


function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.30)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 40

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance then
            Draw3DText(v1.x,v1.y,v1.z, "Tig")
		end
	end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("g_m_y_salvagoon_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "g_m_y_salvagoon_01", -1093.24, 4952.61, 217.37, 159.01, false, true) --Emplacement du PEDS
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)



