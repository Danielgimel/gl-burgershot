------Glichy's Burgershot job------

local QBCore = exports['qb-core']:GetCoreObject()


---Events---

--- Minigame for cooking event (0.0)
RegisterNetEvent("gl-burgershot:minigame", function()
	local time = math.random(10,15)
	local circles = math.random(5,6)
	local success = exports['qb-lock']:StartLockPickCircle(circles, time)
	if success then
		print("win")
	else
		print("fail")
	end
end)

local function LoadAnimDict(dict) -- interactions, job,
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

local blip = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="Burgershot", colour=0, id=106, x = -1200.97, y = -896.61, z = 13.99},
  }
     

Citizen.CreateThread(function()

    for _, info in pairs(blip) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.6)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

---get stock for cooking event (1.1)
RegisterNetEvent("gl-burgershot:cdrinks", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "burgershot", Config.cdrinks)
    end)

    ---get stock for cooking event (1.2)
RegisterNetEvent("gl-burgershot:groceries", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "burgershot", Config.groceries)
    end)

        ---get cups
RegisterNetEvent("gl-burgershot:cups", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "burgershot", Config.cups)
    end)
    

    function QBCore.Functions.HasItem(item)
        local p = promise.new()
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
            p:resolve(result)
        end, item)
        return Citizen.Await(p)
    end   


--- Menu for the stock inventory (1.3)
local stockmenu = {
    {
        header = "Cold Drinks",
        icon = "fa-solid fa-whiskey-glass",
        params = {
            event = 'gl-burgershot:cdrinks'
        }
    },
	{
        header = "Grab Groceries",
        icon = "fa-solid fa-burger",
        params = {
            event = "gl-burgershot:groceries"
        }
    },
    {
        header = "Grab Cups",
        icon = "fa-solid fa-glass-water",
        params = {
            event = "gl-burgershot:cups"
        }
    }
}

local meat = {
    {
        header = "Make Hamburger",
        icon = "fa-solid fa-burger",
        params = {
            event = 'gl-burgershot:burger'
        }
    },
	{
        header = "Make Torpedo",
        icon = "fa-solid fa-drumstick-bite",
        params = {
            event = "gl-burgershot:torpedo"
        }
    }
}

local cola = {
    {
        header = "Get Small Cola",
        icon = "fa-solid fa-glass-water",
        params = {
            event = 'gl-burgershot:scola'
        }
    },
    {
        header = "Get Medium Cola",
        icon = "fa-solid fa-glass-water",
        params = {
            event = 'gl-burgershot:mcola'
        }
    },
    {
        header = "Get Large Cola",
        icon = "fa-solid fa-glass-water",
        params = {
            event = 'gl-burgershot:lcola'
        }
    }
}

RegisterNetEvent("gl-burgershot:scola", function()
    local hasScup = QBCore.Functions.HasItem('smallcup')
    if hasScup then
        QBCore.Functions.Progressbar('scola', 'puring the cola', 7500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mp_common",
            anim = "givetake1_a",
            flags = 8,
        }, {}, {}, function() 
        TriggerServerEvent("gl-burgershot:server:scola")
    end, function()
    end)
    else
        QBCore.Functions.Notify("Missing small cup", "error")
    end
end)

RegisterNetEvent("gl-burgershot:mcola", function()
    local hasMcup = QBCore.Functions.HasItem('midcup')
    if hasMcup then
        QBCore.Functions.Progressbar('mcola', 'puring the cola', 9500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mp_common",
            anim = "givetake1_a",
            flags = 8,
        }, {}, {}, function() 
        TriggerServerEvent("gl-burgershot:server:mcola")
    end, function()
    end)
    else
        QBCore.Functions.Notify("Missing Midium cup", "error")
    end
end)

RegisterNetEvent("gl-burgershot:lcola", function()
    local hasLcup = QBCore.Functions.HasItem('largecup')
    if hasLcup then
        QBCore.Functions.Progressbar('lcola', 'puring the cola', 11500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mp_common",
            anim = "givetake1_a",
            flags = 8,
        }, {}, {}, function() 
        TriggerServerEvent("gl-burgershot:server:lcola")
    end, function()
    end)
    else
        QBCore.Functions.Notify("Missing Large cup", "error")
    end
end)


---The Actual cook animation function
local function animation(playerId)
    local ped = PlayerPedId()
    LoadAnimDict('amb@prop_human_bbq@male@idle_a')
    TaskPlayAnim(ped, 'amb@prop_human_bbq@male@idle_a', 'idle_b', 6.0, -6.0, -1, 47, 0, 0, 0, 0)
    SpatelObject = CreateObject(`prop_fish_slice_01`, 0, 0, 0, true, true, true)
    AttachEntityToEntity(SpatelObject, ped, GetPedBoneIndex(ped, 57005), 0.08, 0.0, -0.02, 0.0, -25.0, 130.0, true, true, false, true, 1, true)
end


        ---Make fries client side script (the actual event)
    RegisterNetEvent("gl-burgershot:client:fries", function()
        local pos = GetEntityCoords(PlayerPedId())
        local current = nil
        local dist = 0.75
        local distcheck = #(pos - vector3(-1201.233, -898.4015, 13.995309))
        if distcheck < dist then
            TriggerServerEvent("gl-burgershot:givefries")
        else
            exports['tnj-notify']:Notify("the fries got burned, hurry up next time!")
        end
    end)

    ---the progressbar of the fries making
    RegisterNetEvent("gl-burgershot:progressbar:fries", function()
        action = true 

        Citizen.SetTimeout(15000, function()
            if action then 
            QBCore.Functions.Notify("5 More seconds", "error")
            end
        end)
        Citizen.SetTimeout(16000, function()
            if action then 
            QBCore.Functions.Notify("4 More seconds", "error")
            end
        end)
        Citizen.SetTimeout(17000, function()
            if action then 
            QBCore.Functions.Notify("3 More seconds", "error")
            end
        end)
        Citizen.SetTimeout(18000, function()
            if action then 
            QBCore.Functions.Notify("2 More seconds", "error")
            end
        end)
        Citizen.SetTimeout(19000, function()
            if action then 
            QBCore.Functions.Notify("1 More seconds", "error")
            end
        end)
        QBCore.Functions.Progressbar('fries', 'making fries', 20000, false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = false,
        }, {
            animDict = "mp_common",
            anim = "givetake1_a",
            flags = 8,
        }, {}, {}, function() 
                TriggerEvent("gl-burgershot:client:fries")
            end, function()
                action = false
            end)
        
    end)

    ---Checks if the player has potato to make fries
    RegisterNetEvent("gl-burgershot:fries:checkitem", function()
        local hasItem = QBCore.Functions.HasItem('potato')
        local ped = PlayerPedId()
        local time = math.random(1,2)
        local circles = math.random(2,3)
        if hasItem then
            local success = exports['qb-lock']:StartLockPickCircle(4, 2)
            if success then
            TriggerEvent("gl-burgershot:progressbar:fries")
        end
        else 
            QBCore.Functions.Notify("Missing Potato", "error")
        end
    end)

        ---Make burger
        RegisterNetEvent("gl-burgershot:client:burger", function()
            local PlayerData = QBCore.Functions.GetPlayerData()
            animation(playerId)
            local ped = PlayerPedId()
            local time = math.random(25,35)
            local circles = math.random(4,6)
            local success = exports['qb-lock']:StartLockPickCircle(circles, time)
            if success then
                TriggerServerEvent("gl-burgershot:giveburger")
                exports['tnj-notify']:Notify("yamiii the burger is ready!")
                DetachEntity(SpatelObject)
                DeleteEntity(SpatelObject)
                ClearPedTasksImmediately(ped)
            else
                QBCore.Functions.Notify("The burger got burned", "error")
                DetachEntity(SpatelObject)
                DeleteEntity(SpatelObject)
                ClearPedTasksImmediately(ped)
            end
        end)

         ---Make Torpedo
         RegisterNetEvent("gl-burgershot:client:torpedo", function()
            local PlayerData = QBCore.Functions.GetPlayerData()
            animation(playerId)
            local ped = PlayerPedId()
            local time = math.random(25,35)
            local circles = math.random(4,6)
            local success = exports['qb-lock']:StartLockPickCircle(circles, time)
            if success then
                TriggerServerEvent("gl-burgershot:givetorpedo")
                exports['tnj-notify']:Notify("yamiii the torpedo is ready!")
                DetachEntity(SpatelObject)
                DeleteEntity(SpatelObject)
                ClearPedTasksImmediately(ped)
            else
                exports['tnj-notify']:Notify("the torpedo got burned")
                DetachEntity(SpatelObject)
                DeleteEntity(SpatelObject)
                ClearPedTasksImmediately(ped)
            end
        end)       

---qb-menu Stock inventory Event (1.4)
RegisterNetEvent("gl-burgershot:cdrinksmenu", function()
	exports['qb-menu']:openMenu(stockmenu)
end)

---qb menu cook torpedo and humburger (meat)
RegisterNetEvent("gl-burgershot:target:meat", function()
	exports['qb-menu']:openMenu(meat)
end)

--qb menu for cola
RegisterNetEvent("gl-burgershot:target:cola", function()
	exports['qb-menu']:openMenu(cola)
end)

---Fries event that connect the server and client side to the target
RegisterNetEvent("gl-burgershot:fries", function()
    TriggerServerEvent("gl-burgershot:server:fries")
end)

---Burger event that connect the server and client side to the target
RegisterNetEvent("gl-burgershot:burger", function()
    TriggerServerEvent("gl-burgershot:server:burger")
end)

---Torpedo event that connect the server and client side to the target
RegisterNetEvent("gl-burgershot:torpedo", function()
    TriggerServerEvent("gl-burgershot:server:torpedo")
end)

--Toggle duty 
RegisterNetEvent("gl-burgershot:duty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

--Open tray 1
RegisterNetEvent("gl-burgershot:tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tray1", {
        maxweight = 10000,
        slots = 8,
    })
end)

--Open tray 2
RegisterNetEvent("gl-burgershot:tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tray2", {
        maxweight = 10000,
        slots = 8,
    })
end)