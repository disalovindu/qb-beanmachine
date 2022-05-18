local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
PlayerJob = {}

local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "beanmachine" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function()
    BeanMachine = AddBlipForCoord(-624.04, 238.67, 81.88)
    SetBlipSprite (BeanMachine, 89)
    SetBlipDisplay(BeanMachine, 4)
    SetBlipScale  (BeanMachine, 0.5)
    SetBlipAsShortRange(BeanMachine, true)
    SetBlipColour(BeanMachine, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Bean Machine")
    EndTextCommandSetBlipName(BeanMachine)
end) 

RegisterNetEvent("qb-beanmachine:DutyA")
AddEventHandler("qb-beanmachine:DutyA", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-beanmachine:Tray1")
AddEventHandler("qb-beanmachine:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "beantray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "beantray1", {
        maxweight = 45000,
        slots = 10,
    })
end)

RegisterNetEvent("qb-beanmachine:Tray2")
AddEventHandler("qb-beanmachine:Tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "beantray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "beantray2", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-beanmachine:Tray4")
AddEventHandler("qb-beanmachine:Tray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "beantray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "beantray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-beanmachine:Tray3")
AddEventHandler("qb-beanmachine:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "beantray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "beantray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-beanmachine:Storage2")
AddEventHandler("qb-beanmachine:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "beantorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "beanstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-beanmachine:Storage")
AddEventHandler("qb-beanmachine:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "beantorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "beanstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

--Foods
RegisterNetEvent("qb-beanmachine:CreateDonut")
AddEventHandler("qb-beanmachine:CreateDonut", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-beanmachine:server:get:ingredientDonut', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making A Donut..", 7000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "sprinkles", 5)
					TriggerServerEvent('QBCore:Server:AddItem', "donut", 5)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["donut"], "add")
                    QBCore.Functions.Notify("You made a A Donut", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-beanmachine:CreateCookie")
AddEventHandler("qb-beanmachine:CreateCookie", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-beanmachine:server:get:ingredientCookie', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Cookies..", 7000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "chocolate", 5)
					TriggerServerEvent('QBCore:Server:AddItem', "cookie", 5)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cookie"], "add")
                    QBCore.Functions.Notify("You made a A Cookie", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-beanmachine:CreateCroissant")
AddEventHandler("qb-beanmachine:CreateCroissant", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-beanmachine:server:get:ingredientCroissant', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Croissant..", 7000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 2)
					TriggerServerEvent('QBCore:Server:AddItem', "croissant", 5)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["croissant"], "add")
                    QBCore.Functions.Notify("You made a A Croissant", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-beanmachine:CreateChocolateCupcake")
AddEventHandler("qb-beanmachine:CreateChocolateCupcake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-beanmachine:server:get:ingredientChocolateCupcake', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Chocolate Cupcake..", 7000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "chocolate", 7)
					TriggerServerEvent('QBCore:Server:AddItem', "cupchocolate", 5)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cupchocolate"], "add")
                    QBCore.Functions.Notify("You made a A Chocolate Cupcake", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

--Drinks
RegisterNetEvent("qb-beanmachine:CreateCafe")
AddEventHandler("qb-beanmachine:CreateCafe", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-beanmachine:server:get:ingredientCafe', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Coffee..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocabeans", 5)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-cafe", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-cafe"], "add")
                    QBCore.Functions.Notify("You made a A Coffee", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-beanmachine:CreateLatte")
AddEventHandler("qb-beanmachine:CreateLatte", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-beanmachine:server:get:ingredientLatte', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Latte..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocabeans", 5)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-latte", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-latte"], "add")
                    QBCore.Functions.Notify("You made a A Latte", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-beanmachine:CreateCappuccino")
AddEventHandler("qb-beanmachine:CreateCappuccino", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-beanmachine:server:get:ingredientCappuccino', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Cappuccino..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocabeans", 3)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-cappuccino", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-cappuccino"], "add")
                    QBCore.Functions.Notify("You made a A Cappuccino", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-beanmachine:CreateMocha")
AddEventHandler("qb-beanmachine:CreateMocha", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-beanmachine:server:get:ingredientMocha', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Mocha..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cocabeans", 3)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whipcream", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-mocha", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-mocha"], "add")
                    QBCore.Functions.Notify("You made a A Mocha", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-beanmachine:CreateCMilksahke")
AddEventHandler("qb-beanmachine:CreateCMilkshake", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-beanmachine:server:get:ingredientCMilkshake', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Chocolate Milkshake..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "milkbottle", 2)
					TriggerServerEvent('QBCore:Server:RemoveItem', "chocolate", 5)
					TriggerServerEvent('QBCore:Server:RemoveItem', "whipcream", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-cmilkshake", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-cmilkshake"], "add")
                    QBCore.Functions.Notify("You made a A Chocolate Milksahke", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-beanmachine:CreateIcetea")
AddEventHandler("qb-beanmachine:CreateIcetea", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-beanmachine:server:get:ingredientIcetea', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Ice Tea..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "teabag", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bean-icetea", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bean-icetea"], "add")
                    QBCore.Functions.Notify("You made a A Ice Tea", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("qb-beanmachine:shop")
AddEventHandler("qb-beanmachine:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "beanmachine", Config.Items)
end)

------------------- Usable Items --------------------------

RegisterNetEvent('qb-beanmachine:client:Drinkables', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar('beber_cafe', 'Drinking...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
		TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + math.random(30,80))
		TriggerServerEvent('hud:server:RelieveStress', math.random(10, 30))
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('qb-beanmachine:client:Eatables', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"donut"})
    QBCore.Functions.Progressbar('beber_cafe', 'Eating...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(30, 80))
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)