Config = {}

-- Choose Target System: 'ox' or 'qb'
Config.TargetSystem = 'ox'

-- Choose Inventory System: 'ox' or 'qb'
Config.InventorySystem = 'ox'

-- Required item to hack the ATM
Config.RequiredItem = 'usb_hack'

-- Money reward range
Config.Reward = {
    Min = 10000,
    Max = 50000,
}

-- Mini-game settings for `boii_minigames`
Config.Minigame = {
    style = 'default', -- Style template
    loading_time = 5000, -- Total time to complete loading sequence in (ms)
    difficulty = 1, -- Difficulty level
    guesses = 5, -- Amount of guesses before failure
    timer = 30000 -- Time allowed for guessing in (ms)
}

-- Cooldown settings (in seconds)
Config.Cooldown = 1200 -- 20 minutes

-- Mini-game success/failure/cooldown messages
Config.Messages = {
    Success = "You successfully hacked the ATM and received $%d!",
    Failure = "You failed to hack the ATM!",
    Cooldown = "You need to wait before hacking another ATM!"
}

-- ATM Models
Config.ATMModels = {
    'prop_atm_01',
    'prop_atm_02',
    'prop_atm_03',
    'prop_fleeca_atm'
}