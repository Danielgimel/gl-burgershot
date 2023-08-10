# gl-burgershot
A Burgershot job make for QBCore framework, Made by - Glichy (Danielgimel#0001)

Dependencies :

QBCore Framework (qb-core) - https://github.com/qbcore-framework/qb-core

qb-target - https://github.com/qbcore-framework/qb-target

qb-menu - https://github.com/qbcore-framework/qb-menu

Installation :
1. Dowload the script and put in inside you server files
2. ensure gl-burgershot in your sever.cfg
3. in qb-smallresources > client > consumables.lua line 180-192 insert the follwing:
RegisterNetEvent('consumables:client:SodaDrink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"soda4"})
    QBCore.Functions.progressbar("drink_something", Lang:t('consumables.drink_progress'), 5000, false, true, {
        disable movement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + Config.ConsumablesSoda[itemName])
    end)
end)
4. in qb-smallresources > server > consumables.lua > line 28 - 35 insert the following:
 for k,_ in pairs(Config.ConsumablesSoda) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
        TriggerClientEvent("consumables:client:SodaDrink", source, item.name)
    end)
end
5. in qb-smallrecources > config.lua lines 157-161 insert the following:
  Config.ConsumablesSoda = {
    ["scola"] = math.random(10, 15),
    ["mcola"] = math.random(20, 25),
    ["lcola"] = math.random(40, 45),
}
6. in qb-core > shared > items insert the following:
--- Drinks
	["smallcup"] 			         = {["name"] = "smallcup", 			        	["label"] = "Small Cup", 		["created"] = nil, 		["decay"] = 2.0,		["weight"] = 125, 		["type"] = "item", 		["image"] = "smallcup.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Smapp cup to refeel"},
	["midcup"] 			             = {["name"] = "midcup", 			        	["label"] = "Midium Cup", 		["created"] = nil, 		["decay"] = 2.0,		["weight"] = 125, 		["type"] = "item", 		["image"] = "midcup.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Midium cup to refeel"},
	["largecup"] 			         = {["name"] = "largecup", 				        ["label"] = "Large Cup", 	    ["created"] = nil, 		["decay"] = 2.0,		["weight"] = 125, 		["type"] = "item", 		["image"] = "largecup.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Large cup to refeel"},
	["scola"] 			             = {["name"] = "scola", 				        ["label"] = "Small Cola", 	    ["created"] = nil, 		["decay"] = 2.0,		["weight"] = 125, 		["type"] = "item", 		["image"] = "smallcup.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(15, 20) },
	["mcola"] 			             = {["name"] = "mcola", 				        ["label"] = "Midium Cola", 	    ["created"] = nil, 		["decay"] = 2.0,		["weight"] = 125, 		["type"] = "item", 		["image"] = "midcup.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(30, 35) },
	["lcola"] 			             = {["name"] = "lcola", 				        ["label"] = "Large Cola", 	    ["created"] = nil, 		["decay"] = 2.0,		["weight"] = 125, 		["type"] = "item", 		["image"] = "largecup.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 45) },
---Food
   	["potato"] 						= {["name"] = "potato",						["label"] = "Potatoes",				["created"] = nil, 		["decay"] = 2.0,	["weight"] = 500,		["type"] = "item",		["image"] = "potatoes.png",		["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Food" },
	["burger-bleeder"] 				 = {["name"] = "burger-bleeder", 			 	["label"] = "Bleeder", 			["created"] = nil, 		["decay"] = 2.0,		["weight"] = 250, 		["type"] = "item", 		["image"] = "bs_the-bleeder.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["burger-moneyshot"] 			 = {["name"] = "burger-moneyshot", 			 	["label"] = "Moneyshot", 		["created"] = nil, 		["decay"] = 2.0,		["weight"] = 300, 		["type"] = "item", 		["image"] = "bs_money-shot.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["burger-torpedo"] 				 = {["name"] = "burger-torpedo", 			 	["label"] = "Torpedo", 			["created"] = nil, 		["decay"] = 2.0,		["weight"] = 310, 		["type"] = "item", 		["image"] = "bs_torpedo.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["burger-meat"] 				 = {["name"] = "burger-meat", 			 	  	["label"] = "Cooked Patty", 		  ["created"] = nil, 		["decay"] = 2.0,	    ["weight"] = 125, 		["type"] = "item", 		            ["image"] = "bs_patty.png", 		    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-lettuce"] 				 = {["name"] = "burger-lettuce", 			 	["label"] = "Lettuce", 			   	  ["created"] = nil, 		["decay"] = 2.0,        ["weight"] = 125, 		["type"] = "item", 			        ["image"] = "bs_lettuce.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-bun"] 				 	 = {["name"] = "burger-bun", 			 	  	["label"] = "Bun", 			          ["created"] = nil, 		["decay"] = 2.0,        ["weight"] = 125, 		["type"] = "item", 					["image"] = "bs_bun.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["burger-tomato"] 				 = {["name"] = "burger-tomato", 			 	["label"] = "Tomato", 			      ["created"] = nil, 		["decay"] = 2.0,   	["weight"] = 125, 		["type"] = "item", 		         	["image"] = "bs_tomato.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["hamburger"] 					= {["name"] = "hamburger",  	    		["label"] = "Hamburger",			       ["created"] = nil, 		["decay"] = 2.0, 	["weight"] = 100, 		["type"] = "item", 		["image"] = "hamburger.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["burger-fries"] 				 = {["name"] = "burger-fries", 			 	  	["label"] = "Fries", 			["created"] = nil, 		["decay"] = 2.0,	["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_fries.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
7. In qb-core > shared > jobs.lua Insert the following:
       ["burgershot"] = {
        label = "Burgershot",
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = "Employee",
                payment = 50
            },
            ['1'] = {
                name = "Waiter",
                payment = 75
            },
            ['2'] = {
                name = "Manager",
                isboss = true,
                payment = 100
            },
        },
    },
   
   And thats all! you good to go.
