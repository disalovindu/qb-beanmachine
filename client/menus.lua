local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = true
PlayerJob = {}

local onDuty = false

Citizen.CreateThread(function()

 
    exports['qb-target']:AddBoxZone("BeanMachineDuty", vector3(-636.87, 227.11, 81.88), 2, 2, {
        name="BeanMachineDuty",
        heading=0,
        debugPoly=false,
    }, {
        options = {
            {
            event = "qb-beanmachine:DutyA",
            icon = "far fa-clipboard",
            label = "Clock On/Off",
            job = "beanmachine",
            },
        },
        distance = 1.5    
    })

    exports['qb-target']:AddBoxZone("Fridge1", vector3(-635.72, 232.51, 81.88), 2, 2, {
		name="Fridge1",
		heading=340,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-beanmachine:Fridge",
			icon = "fa fa-archive",
			label = "Fridge",
            job = "beanmachine",
		    },
		},
		distance = 1.5
	})

	exports['qb-target']:AddBoxZone("Tray1", vector3(-634.36, 235.99, 81.88), 0.5, 0.5, {
		name="Tray1",
		heading=5,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-beanmachine:Tray1",
			icon = "far fa-clipboard",
			label = "Tray 1",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("Tray2", vector3(-630.02, 236.65, 81.88), 0.5, 0.5, {
		name="Tray2",
		heading=0,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-beanmachine:Tray2",
			icon = "far fa-clipboard",
			label = "Tray 2",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("Tray4", vector3(-632.62, 224.48, 86.33), 1, 1, {
		name="Tray4",
		heading=50,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-beanmachine:Tray3",
			icon = "far fa-clipboard",
			label = "Tray 3",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("DrinksMaker", vector3(-635.71, 236.46, 81.88), 1, 1, {
		name="DrinksMaker",
		heading=50,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-beanmachine:DrinksMenu",
			icon = "fa fa-coffee",
			label = "Make Drinks",
            job = "beanmachine",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("Foods", vector3(-636.6, 235.03, 81.88), 0.5, 0.5, {
		name="Foods",
		heading=0,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-beanmachine:FoodMenu",
			icon = "fa fa-cutlery",
			label = "Make Foods",
            job = "beanmachine",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("Cashier", vector3(-634.38, 235.19, 81.88), 0.5, 0.5, {
		name="Cashier",
		heading=5,
		debugPoly=false,
	}, {
		options = {
		    {
			event = "qb-beanmachine:bill",
			icon = "fas fa-credit-card",
			label = "Cashier",
            job = "beanmachine",
		    },
		},
		distance = 1.5
	})

end)
      
RegisterNetEvent('qb-beanmachine:DrinksMenu', function(data)

    exports['qb-menu']:openMenu({
        {
           header = "Drinks Menu",
           isMenuHeader = true,
        },

        {
            header = "☕ Coffee",
            txt = "3 Cocabeans and 1 Milk Bottle Required",
            params = {
                event = "qb-beanmachine:CreateCafe", 
                args = {
                    number = 0,
               }
           }
        },
        {
            header = "☕ Latte",
            txt = "3 Cocabeans and 1 Milk Bottle Required",
            params = {
                event = "qb-beanmachine:CreateLatte",
                args = {
                    number = 1,
               }
           }
        },
        {
            header = "☕ Cappuccino",
            txt = "3 Cocabeans and 2 Milk Bottles Required",
            params = {
                event = "qb-beanmachine:CreateCappuccino",
                args = {
                    number = 2,
                }
            }
        },
        {
            header = "☕ Mocha",
            txt = "1 Milk Bottle , 3 Cocabeans and 1 Whipcream Required",
            params = {
                event = "qb-beanmachine:CreateMocha",
                args = {
                    number = 3,
                }
            }
        },
        {
            header = "🥤 Choclate Milkshake",
            txt = "2 Milk Bottles , 5 Chocolates and 1 Whipcream Required",
            params = {
                event = "qb-beanmachine:CreateCMilkshake",
                args = {
                    number = 4,
                }
            }
        },
        {
            header = "🥤 Ice Tea",
            txt = "1 Teabag Required",
            params = {
                event = "qb-beanmachine:CreateIcetea",
                args = {
                    number = 5,
                }
            }
        },                 

       {
           header = "❌ Close",
           txt = "",
           params = {
               event = "qb-menu:closeMenu",
               args = {
                   number = 6,
               }
           }
       },
   })
   end)

RegisterNetEvent('qb-beanmachine:Fridge', function(data)

    exports['qb-menu']:openMenu({
       {
           header = "Storage Container",
           isMenuHeader = true,
       },

       {
           header = "📦 Fridge",
           txt = "Open the Fridge",
           params = {
               event = "qb-beanmachine:Storage", 
               args = {
                   number = 0,
               }
           }
       },
       {
           header = "🛍️ Shop",
           txt = "Shop For Ingredients",
           params = {
               event = "qb-beanmachine:shop",
               args = {
                   number = 1,
               }
           }
       },   

       {
           header = "❌ Close",
           txt = "",
           params = {
               event = "qb-menu:closeMenu",
               args = {
                   number = 2,
               }
           }
       },
   })
   end)

RegisterNetEvent('qb-beanmachine:FoodMenu', function(data)

    exports['qb-menu']:openMenu({
        {
           header = "Food Menu",
           isMenuHeader = true,
        },

        {
            header = "🍩 Donut",
            txt = "5 Sprinkles Required",
            params = {
                event = "qb-beanmachine:CreateDonut", 
                args = {
                    number = 0,
               }
           }
        },
        {
            header = "🥐 Croissant",
            txt = " 2 Milk Bottles Required",
            params = {
                event = "qb-beanmachine:CreateCroissant",
                args = {
                    number = 1,
               }
           }
        },
        {
            header = "🧁 Chocolate Cupcake",
            txt = "7 Chocolates Required",
            params = {
                event = "qb-beanmachine:CreateChocolateCupcake",
                args = {
                    number = 2,
                }
            }
        },
        {
            header = "🍪 Cookie",
            txt = "5 Chocolates Required",
            params = {
                event = "qb-beanmachine:CreateCookie",
                args = {
                    number = 3,
                }
            }
        },

        {
            header = "❌ Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
                args = {
                    number = 4,
                }
            }
        },
    })
    end)        

----------------Billing-----------------------

RegisterNetEvent("qb-beanmachine:bill", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Cash Register",
        submitText = "Charge Customer",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'Paypal ID'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = '$ amount!'
            }
        }
    })
    if dialog then
        if not dialog.id or not dialog.amount then return end
        TriggerServerEvent("qb-beanmachine:bill:player", dialog.id, dialog.amount)
    end
end)
