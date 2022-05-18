local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-beanmachine:bill:player")
AddEventHandler("qb-beanmachine:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'beanmachine' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                       if Config.SQL == 'oxmysql' then
                        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        else
                          exports.ghmattimysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname
                           })
                       end
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

--------------------------- Getting Ingredients -------------------------------------

QBCore.Functions.CreateCallback('qb-beanmachine:server:get:ingredientCookie', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local chocolate = Ply.Functions.GetItemByName("chocolate")
    if chocolate ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-beanmachine:server:get:ingredientDonut', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local sprinkles = Ply.Functions.GetItemByName("sprinkles")
    if sprinkles ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-beanmachine:server:get:ingredientCroissant', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local milkbottle = Ply.Functions.GetItemByName("milkbottle")
    if milkbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-beanmachine:server:get:ingredientChocolateCupcake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local whipcream = Ply.Functions.GetItemByName("whipcream")
    local chocolate = Ply.Functions.GetItemByName("chocolate")
    if whipcream ~= nil and chocolate ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--Drinks
QBCore.Functions.CreateCallback('qb-beanmachine:server:get:ingredientCafe', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cocabeans = Ply.Functions.GetItemByName("cocabeans")
    local milkbottle = Ply.Functions.GetItemByName("milkbottle")
    if cocabeans ~= nil and milkbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-beanmachine:server:get:ingredientLatte', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cocabeans = Ply.Functions.GetItemByName("cocabeans")
    local milkbottle = Ply.Functions.GetItemByName("milkbottle")
    if cocabeans ~= nil and milkbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-beanmachine:server:get:ingredientCappuccino', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cocabeans = Ply.Functions.GetItemByName("cocabeans")
    local milkbottle = Ply.Functions.GetItemByName("milkbottle")
    if cocabeans ~= nil and milkbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-beanmachine:server:get:ingredientMocha', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cocabeans = Ply.Functions.GetItemByName("cocabeans")
    local whipcream = Ply.Functions.GetItemByName("whipcream")
    local milkbottle = Ply.Functions.GetItemByName("milkbottle")
    if cocabeans ~= nil and whipcream ~= nil and milkbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-beanmachine:server:get:ingredientCMilkshake', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local chocolate = Ply.Functions.GetItemByName("chocolate")
    local whipcream = Ply.Functions.GetItemByName("whipcream")
    local milkbottle = Ply.Functions.GetItemByName("milkbottle")
    if chocolate ~= nil and whipcream ~= nil and milkbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-beanmachine:server:get:ingredientIcetea', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local teabag = Ply.Functions.GetItemByName("teabag")
    if teabag ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-------------------------- Usable Items ------------------------
--Drinks
QBCore.Functions.CreateUseableItem("bean-cafe", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-beanmachine:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-cafe', 1)
    end
end)

QBCore.Functions.CreateUseableItem("bean-latte", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-beanmachine:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-latte', 1)
    end
end)

QBCore.Functions.CreateUseableItem("bean-cappuccino", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-beanmachine:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-cappuccino', 1)
    end
end)

QBCore.Functions.CreateUseableItem("bean-mocha", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-beanmachine:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-mocha', 1)
    end
end)

QBCore.Functions.CreateUseableItem("bean-cmilkshake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-beanmachine:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-cmilksake', 1)
    end
end)

QBCore.Functions.CreateUseableItem("bean-icetea", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-beanmachine:client:Drinkables', source)
        Player.Functions.RemoveItem('bean-icetea', 1)
    end
end)

--Foods
QBCore.Functions.CreateUseableItem("cookies", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-beanmachine:client:Eatables', source)
        Player.Functions.RemoveItem('cookies', 1)
    end
end)

QBCore.Functions.CreateUseableItem("donut", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-beanmachine:client:Eatables', source)
        Player.Functions.RemoveItem('donut', 1)
    end
end)

QBCore.Functions.CreateUseableItem("croissant", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-beanmachine:client:Eatables', source)
        Player.Functions.RemoveItem('croissant', 1)
    end
end)

QBCore.Functions.CreateUseableItem("cupchocolate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-beanmachine:client:Eatables', source)
        Player.Functions.RemoveItem('cupchocolate', 1)
    end
end)