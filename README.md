<h1>🔓 (QB) skr-atmhack - Advanced ATM Hacking System for FiveM 🖥️💰</h1>

📜 **Overview**

`skr-atmhack` is a FiveM script developed for the QBCore framework. It allows players to hack ATMs using an interactive mini-game system. With features like cooldowns, item requirements, and dynamic rewards, this script enhances the immersion and provides a challenging activity for players.

---

📱 **Usage**

### 1. Hack ATMs
- Approach an ATM in the game world.

- Interact with the ATM using either **ox_target** or **qb-target**.

- If you have the required hacking device, you can attempt to hack the ATM.
 
- Successfully complete the mini-game to receive a cash reward.

- If you fail, you will be notified, and the cooldown timer will activate.

---

💡 **Features**
- [**Interactive Mini-Game**](https://github.com/boiidevelopment/boii_minigames): Players must complete a challenging mini-game to successfully hack the ATM. **Must have Boii Minigames!**

- **Customizable Rewards**: Configure cash rewards for successful hacks.

- **Cooldown System**: Prevents players from repeatedly hacking ATMs, with customizable cooldown durations.

- **Anti-Spam Notifications**: Ensures notifications are shown only once every 5 seconds during cooldowns.
 
- **Item Requirement**: Players must possess a hacking device to attempt ATM hacks.

- **Target System Compatibility**: Works with both **ox_target** and **qb-target** for seamless interaction with ATMs.

- **Performance Optimized**: Script idles at `0.00ms` and peaks at `0.02ms` under load. ⚡

---

📸 [**Preview**](https://streamable.com/dzf5m8)

*Screenshots coming soon!*

---

🔧 **Configuration**

- Define ATM models that can be hacked. Roxwood ATMS already included!

- Customize cooldown durations, notification messages, and cash reward ranges.

- Configure target system options (ox_target or qb-target).

- Adjust mini-game parameters, such as difficulty and time limits.

---

⚙️ **Requirements**

- [**QBCore Framework**](https://github.com/qbcore-framework/qb-core)

- [**ox_target**](https://github.com/overextended/ox_target) or [**qb-target**](https://github.com/qbcore-framework/qb-target)

- [**ox_inventory**](https://github.com/overextended/ox_inventory) or [**qb-inventory**](https://github.com/qbcore-framework/qb-inventory)

- [**boii_minigames**](https://github.com/boiidevelopment/boii_minigames)

---

🚀 **Installation Instructions**

1. Download the [latest version](https://github.com/shreddykr/skr-atmhack/releases/latest).
2. Place the `skr-atmhack` folder into your FiveM server's `resources` directory.
3. Add `ensure skr-atmhack` to your server's `server.cfg` file after all required resources.
4. Configure the `config.lua` file to suit your server's preferences.
5. Done!

---

❓ **Why You Should Use This**

- **Immersive Gameplay**: Adds an engaging hacking system with interactive mini-games.

- **Seamless Integration**: Works flawlessly with QBCore and popular tools like ox_target and ox_inventory.

- **Challenging Activity**: Keeps players entertained with dynamic rewards and mini-game mechanics.

- **Server Optimization**: Designed to run efficiently, ensuring smooth server performance.

---

📂 **Recent Updates (v1.0.0)**

- Added compatibility for **ox_target** and **qb-target**.
 
- Added compatibility for **ox_inventory** and **qb-inventory**.

- Introduced customizable cooldown system.

- Added mini-game failure handling with appropriate notifications.

- Implemented anti-spam notification system.

- Configurable mini-game difficulty and reward ranges.

- Optimized performance for low-resource utilization.
