local QBCore = exports['qb-core']:GetCoreObject() -- Initialize QBCore
local cooldowns = {} -- Table to track cooldowns for players
local notificationCooldowns = {} -- Table to track notification cooldowns (per player)

local function hasRequiredItem()
    if Config.InventorySystem == 'ox' then
        return exports.ox_inventory:Search('count', Config.RequiredItem) > 0
    elseif Config.InventorySystem == 'qb' then
        local playerItems = QBCore.Functions.GetPlayerData().items
        for _, item in pairs(playerItems) do
            if item.name == Config.RequiredItem then
                return true
            end
        end
    end
    return false
end

local function isOnCooldown(playerId)
    return cooldowns[playerId] and cooldowns[playerId] > GetGameTimer()
end

local function isNotificationOnCooldown(playerId)
    return notificationCooldowns[playerId] and notificationCooldowns[playerId] > GetGameTimer()
end

local function startCooldown(playerId)
    cooldowns[playerId] = GetGameTimer() + (Config.Cooldown * 1000) -- Set cooldown time in milliseconds
end

local function startNotificationCooldown(playerId)
    notificationCooldowns[playerId] = GetGameTimer() + 5000 -- 5-second notification cooldown
end

local function startMinigame(playerId)
    exports['boii_minigames']:anagram({
        style = Config.Minigame.style,
        loading_time = Config.Minigame.loading_time,
        difficulty = Config.Minigame.difficulty,
        guesses = Config.Minigame.guesses,
        timer = Config.Minigame.timer
    }, function(success)
        if success then
            local reward = math.random(Config.Reward.Min, Config.Reward.Max)
            TriggerServerEvent('skr-atmhack:reward', reward)
            QBCore.Functions.Notify(string.format(Config.Messages.Success, reward), 'success')
        else
            QBCore.Functions.Notify(Config.Messages.Failure, 'error')
        end
        startCooldown(playerId) -- Start cooldown regardless of success or failure
    end)
end

local function setupTarget()
    for _, model in ipairs(Config.ATMModels) do
        if Config.TargetSystem == 'ox' then
            exports.ox_target:addModel(model, {
                {
                    name = 'hack_atm',
                    label = 'Hack ATM',
                    icon = 'fa-solid fa-computer',
                    canInteract = function()
                        local playerId = GetPlayerServerId(PlayerId())

                        if isOnCooldown(playerId) then
                            if not isNotificationOnCooldown(playerId) then
                                local timeLeft = math.ceil((cooldowns[playerId] - GetGameTimer()) / 1000)
                                QBCore.Functions.Notify(string.format(Config.Messages.Cooldown .. " (%ds)", timeLeft), 'error')
                                startNotificationCooldown(playerId) -- Start a new 5-second cooldown for notifications
                            end
                            return false
                        end
                        return hasRequiredItem()
                    end,
                    onSelect = function(data)
                        local playerId = GetPlayerServerId(PlayerId())
                        startMinigame(playerId)
                    end
                }
            }, 2.5)
        elseif Config.TargetSystem == 'qb' then
            exports['qb-target']:AddTargetModel(model, {
                options = {
                    {
                        type = 'client',
                        event = 'skr-atmhack:start',
                        icon = 'fa-solid fa-computer',
                        label = 'Hack ATM',
                        canInteract = function()
                            local playerId = GetPlayerServerId(PlayerId())

                            if isOnCooldown(playerId) then
                                if not isNotificationOnCooldown(playerId) then
                                    local timeLeft = math.ceil((cooldowns[playerId] - GetGameTimer()) / 1000)
                                    QBCore.Functions.Notify(string.format(Config.Messages.Cooldown .. " (%ds)", timeLeft), 'error')
                                    startNotificationCooldown(playerId) -- Start a new 5-second cooldown for notifications
                                end
                                return false
                            end
                            return hasRequiredItem()
                        end
                    }
                },
                distance = 2.5
            })
        end
    end
end

RegisterNetEvent('skr-atmhack:start', function()
    local playerId = GetPlayerServerId(PlayerId())
    if isOnCooldown(playerId) then
        local timeLeft = math.ceil((cooldowns[playerId] - GetGameTimer()) / 1000)
        QBCore.Functions.Notify(string.format(Config.Messages.Cooldown .. " (%ds)", timeLeft), 'error')
        return
    end

    if hasRequiredItem() then
        startMinigame(playerId)
    else
        QBCore.Functions.Notify('You need a hacking device to hack this ATM!', 'error')
    end
end)

CreateThread(function()
    setupTarget()
end)