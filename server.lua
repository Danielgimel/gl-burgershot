local QBCore = exports['qb-core']:GetCoreObject()

---Give chips if succedd 
RegisterNetEvent("gl-burgershot:givefries", function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("potato", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["potato"], "remove")
    Player.Functions.AddItem("burger-fries", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["burger-fries"], "add")
end)

---Gives the burger to the player and remove the ingredients
RegisterNetEvent("gl-burgershot:giveburger", function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("burger-meat", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["burger-meat"], "remove")
    Player.Functions.RemoveItem("burger-lettuce", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["burger-lettuce"], "remove")
    Player.Functions.RemoveItem("burger-bun", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["burger-bun"], "remove")
    Player.Functions.RemoveItem("burger-tomato", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["burger-tomato"], "remove")
    Player.Functions.AddItem("hamburger", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hamburger"], "add")
end)

---Gives the Torpedo to the player and remove the ingredients
RegisterNetEvent("gl-burgershot:givetorpedo", function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("burger-meat", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["burger-meat"], "remove")
    Player.Functions.RemoveItem("burger-lettuce", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["burger-lettuce"], "remove")
    Player.Functions.RemoveItem("burger-bun", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["burger-bun"], "remove")
    Player.Functions.RemoveItem("burger-tomato", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["burger-tomato"], "remove")
    Player.Functions.AddItem("burger-torpedo", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["burger-torpedo"], "add")
end)

---Server side of making a fries (checking if player has potato) 
RegisterNetEvent("gl-burgershot:server:fries", function()
    if QBCore.Functions.HasItem(source, 'potato', 1) then
        TriggerClientEvent("gl-burgershot:client:fries", source)
    else 
        TriggerClientEvent('QBCore:Notify', source, 'Missing potatos!', 'error')
    end
end)

---Giving the player the cola and remving the cup item
RegisterNetEvent("gl-burgershot:server:scola", function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("smallcup", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["smallcup"], "remove")
    Player.Functions.AddItem("scola", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["scola"], "add")
end)

RegisterNetEvent("gl-burgershot:server:mcola", function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("midcup", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["midcup"], "remove")
    Player.Functions.AddItem("mcola", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["mcola"], "add")
end)

RegisterNetEvent("gl-burgershot:server:lcola", function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("largecup", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["largecup"], "remove")
    Player.Functions.AddItem("lcola", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["lcola"], "add")
end)

---Server side of making a burger (checking if player has the items he need to do the action) 
RegisterNetEvent("gl-burgershot:server:burger", function()
    if QBCore.Functions.HasItem(source, 'burger-meat', 1) and QBCore.Functions.HasItem(source, 'burger-bun', 1) and QBCore.Functions.HasItem(source, 'burger-lettuce', 1) and QBCore.Functions.HasItem(source, 'burger-tomato', 1) then
        TriggerClientEvent("gl-burgershot:client:burger", source)
    else 
        TriggerClientEvent('QBCore:Notify', source, 'Missing some ingredients', 'error')
    end
end)

---Server side of making a torpedo (checking if player has the items he need to do the action) 
RegisterNetEvent("gl-burgershot:server:torpedo", function()
    if QBCore.Functions.HasItem(source, 'burger-meat', 1) and QBCore.Functions.HasItem(source, 'burger-bun', 1) and QBCore.Functions.HasItem(source, 'burger-lettuce', 1) and QBCore.Functions.HasItem(source, 'burger-tomato', 1) then
        TriggerClientEvent("gl-burgershot:client:torpedo", source)
    else 
        TriggerClientEvent('QBCore:Notify', source, 'Missing some ingredients', 'error')
    end
end)