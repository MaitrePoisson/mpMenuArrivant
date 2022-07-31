ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)

-- Ouverture Menu
open = false
local mainMenuArrivant = RageUI.CreateMenu("Menu Arrivants", "Menu")
local reseauxMenu = RageUI.CreateSubMenu(mainMenuArrivant, "Réseaux", "Réseaux : ")
local touchesMenu = RageUI.CreateSubMenu(mainMenuArrivant, "Touches", "Touches : ")
local commandesMenu = RageUI.CreateSubMenu(mainMenuArrivant, "Commandes", "Commandes : ")
mainMenuArrivant.Closed = function() 
    open = false 
end

local function openMenu()
    if open then
        open = false
        RageUI.Visible(mainMenuArrivant, false)
        return
    else
        open = true
        RageUI.Visible(mainMenuArrivant, true)
        CreateThread(function()
            while open do
                RageUI.IsVisible(mainMenuArrivant, function()
                    RageUI.Separator("~b~↓↓~s~  Menu Arrivants  ~b~↓↓~s~")
                    RageUI.Button("Réseaux :", nil, {RightLabel = "→→"}, true, {
                    }, reseauxMenu)
                    RageUI.Button("Touches :", nil, {RightLabel = "→→"}, true, {
                    }, touchesMenu)
                    RageUI.Button("Commandes :", nil, {RightLabel = "→→"}, true, {
                    }, commandesMenu)
                    RageUI.Separator("~w~Votre ID : ~b~"..GetPlayerServerId(PlayerId()))
                    RageUI.Separator("~w~Nom Steam : ~b~"..GetPlayerName(PlayerId()))
                end)
                RageUI.IsVisible(reseauxMenu, function()
                    RageUI.Separator("~b~↓↓~s~  Menu Arrivants  ~b~↓↓~s~")
                    RageUI.Button("Youtube : ", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            ESX.ShowAdvancedNotification('Youtube', "~g~Info", "Voici la chaine Youtube : ~b~https://www.youtube.com/c/MaitrePoisson_Officiel~s~", mpMenuArrivant.CHAR, 0)
                        end
                    })
                    RageUI.Button("Discord :", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            ESX.ShowAdvancedNotification('Discord', "~g~Info", "Voici le Discord : ~b~https://discord.gg/C559dhdzrb~s~", mpMenuArrivant.CHAR, 0)
                        end
                    })
                end)
                RageUI.IsVisible(touchesMenu, function()
                    RageUI.Separator("~o~↓↓~s~  Menu Arrivants  ~o~↓↓~s~")
                    RageUI.Button("Téléphone : ", nil, {RightLabel = "~b~F1"}, true, {
                    })
                    RageUI.Button("Radio :", nil, {RightLabel = "~b~F2"}, true, {
                    })
                    RageUI.Button("Boutique :", nil, {RightLabel = "~b~F3"}, true, {
                    })
                    RageUI.Button("Menu Emotes :", nil, {RightLabel = "~b~F6"}, true, {
                    })
                    RageUI.Button("Menu Personnel :", nil, {RightLabel = "~b~F7"}, true, {
                    })
                    RageUI.Button("Menu Métier :", nil, {RightLabel = "~b~F9"}, true, {
                    })
                    RageUI.Button("Menu Gang :", nil, {RightLabel = "~b~F10"}, true, {
                    })
                    RageUI.Button("Ceinture :", nil, {RightLabel = "~b~X"}, true, {
                    })
                    RageUI.Button("Pointer du doigt :", nil, {RightLabel = "~b~B"}, true, {
                    })
                    RageUI.Button("Coffre :", nil, {RightLabel = "~b~L"}, true, {
                    })
                    RageUI.Button("Porter de la voix :", nil, {RightLabel = "~b~W"}, true, {
                    })
                    RageUI.Button("Lever les mains :", nil, {RightLabel = "~b~X"}, true, {
                    })
                end)
                RageUI.IsVisible(commandesMenu, function()
                    RageUI.Separator("~b~↓↓~s~  Menu Arrivants  ~b~↓↓~s~")
                    RageUI.Button("Aide : ", nil, {RightLabel = "~b~/help"}, true, {
                    })
                    RageUI.Button("Signalement :", nil, {RightLabel = "~b~/report"}, true, {
                    })
                    RageUI.Button("Otage :", nil, {RightLabel = "~b~/otage"}, true, {
                    })
                    RageUI.Button("Porter :", nil, {RightLabel = "~b~/carry"}, true, {
                    })
                end)
                Wait(0)
            end
        end)
    end
end

-- Touche pour ouvrir le menu
RegisterCommand("help", function()
    openMenu()
end)