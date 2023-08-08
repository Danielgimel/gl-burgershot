CreateThread(function()
	exports['qb-target']:AddBoxZone("Stock", vector3(-1203.909, -895.7211, 13.995313), 1, 1.2, {
		name = "Stock",
		heading = 32,
		debugPoly = false,
		minZ=13.5,
		maxZ=14.5,
	}, {
		options = {
		    {  
			event = "gl-burgershot:cdrinksmenu",
			icon = "far fa-clipboard",
			label = "Get Stock",
			job = "burgershot",
		    },
		},
		distance = 1.5
	})

		exports['qb-target']:AddBoxZone("fries", vector3(-1201.33, -899.0622, 13.217629), 1, 1.2, {
			name = "fries",
			heading = 32,
			debugPoly = false,
			minZ=13.5,
			maxZ=14.5,
		}, {
			options = {
				{  
				event = "gl-burgershot:fries:checkitem",
				icon = "fa-brands fa-gripfire",
				label = "Make Fries",
				job = "burgershot",
				},
			},
			distance = 1.5
		})
		exports['qb-target']:AddBoxZone("meat", vector3(-1200.51, -900.9774, 13.21933), 1, 1.2, {
			name = "meat",
			heading = 32,
			debugPoly = false,
			minZ=13.5,
			maxZ=14.5,
		}, {
			options = {
				{  
				event = "gl-burgershot:target:meat",
				icon = "fa-brands fa-gripfire",
				label = "Make Meat",
				job = "burgershot",
				},
			},
			distance = 1.5
		})
		exports['qb-target']:AddBoxZone("cola", vector3(-1200.077, -894.9092, 14.762649), 1, 1.2, {
			name = "cola",
			heading = 32,
			debugPoly = false,
			minZ=13.9,
			maxZ=14.9,
		}, {
			options = {
				{  
				event = "gl-burgershot:target:cola",
				icon = "fa-brands fa-glass-water",
				label = "Grab Cola",
				job = "burgershot",
				},
			},
			distance = 1.5
		})
		exports['qb-target']:AddBoxZone("tray1", vector3(-1195.064, -891.7643, 14.29648), 1, 1.2, {
			name = "meat",
			heading = 32,
			debugPoly = false,
			minZ=13.9,
			maxZ=14.5,
		}, {
			options = {
				{  
				event = "gl-burgershot:tray1",
				icon = "fa-brands fa-gripfire",
				label = "Tray",
				},
			},
			distance = 1.5
		})
		exports['qb-target']:AddBoxZone("tray2",vector3(-1194.508, -893.9915, 14.222053), 1, 1.2, {
			name = "meat",
			heading = 32,
			debugPoly = false,
			minZ=13.9,
			maxZ=14.5,
		}, {
			options = {
				{  
				event = "gl-burgershot:tray2",
				icon = "fa-brands fa-gripfire",
				label = "Tray",
				},
			},
			distance = 1.5
		})
end)