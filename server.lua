RegisterServerEvent('skr-atmhack:reward', function(amount)
    local src = source
    if Config.InventorySystem == 'ox' then
        exports.ox_inventory:AddItem(src, 'money', amount)
    elseif Config.InventorySystem == 'qb' then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        xPlayer.Functions.AddMoney('cash', amount)
    end
end)