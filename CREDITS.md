# 🎮 Professional FE Admin Script

<div align="center">

![Roblox](https://img.shields.io/badge/Roblox-000000?style=for-the-badge&logo=roblox&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=for-the-badge)

**A powerful and professional FE (Filtering Enabled) admin script for Roblox**

[Features](#-how-it-works) • [Installation](#-how-it-works) • [Commands](#-how-it-works) • [Development](#-how-it-was-created) • [Credits](#-credits)

</div>

---

## 📖 How It Works

### **Installation Guide**

1. **Open Roblox Studio** or use an **Executor** in-game
2. **Create a LocalScript** in `StarterPlayer > StarterPlayerScripts`
3. **Paste the script** into the LocalScript
4. **Run the game** or execute the script

### **Getting Started**

Once loaded, you'll see a notification confirming the script is active:

```
✅ FE Admin Loaded
Professional FE Admin is ready!
Press RIGHT CTRL to open menu
```

### **Opening the GUI**

- Press **RIGHT CTRL** to toggle the admin panel
- The GUI features a modern dark theme with gradient effects
- Draggable interface for convenient positioning

### **Command Usage**

All commands start with the prefix `:` followed by the command name.

**Example:**
```
:ws 100        → Set walk speed to 100
:fly           → Toggle fly mode
:esp           → Enable player ESP
:god           → Enable god mode
```

### **Available Commands (32+)**

| Command | Description | Usage |
|---------|-------------|-------|
| `:ws [speed]` | Set walk speed | `:ws 100` |
| `:jp [power]` | Set jump power | `:jp 150` |
| `:god` | Enable god mode | `:god` |
| `:ungod` | Disable god mode | `:ungod` |
| `:fly` | Toggle fly mode | `:fly` |
| `:unfly` | Disable fly | `:unfly` |
| `:noclip` | Toggle noclip | `:noclip` |
| `:clip` | Disable noclip | `:clip` |
| `:esp` | Toggle ESP | `:esp` |
| `:unesp` | Disable ESP | `:unesp` |
| `:fullbright` | Toggle fullbright | `:fullbright` or `:fb` |
| `:unfullbright` | Disable fullbright | `:unfullbright` |
| `:infinitejump` | Toggle infinite jump | `:infinitejump` or `:infjump` |
| `:btools` | Give building tools | `:btools` |
| `:reset` | Reset character | `:reset` |
| `:respawn` | Respawn character | `:respawn` |
| `:tp [player]` | Teleport to player | `:tp john` |
| `:view [player]` | View player camera | `:view john` |
| `:unview` | Reset camera | `:unview` |
| `:fov [value]` | Set field of view | `:fov 120` |
| `:sit` | Sit down | `:sit` |
| `:freeze` | Freeze character | `:freeze` |
| `:thaw` | Unfreeze character | `:thaw` or `:unfreeze` |
| `:invisible` | Become invisible | `:invisible` or `:invis` |
| `:visible` | Become visible | `:visible` or `:vis` |
| `:clicktp` | Toggle click teleport | `:clicktp` |
| `:float` | Create float platform | `:float` |
| `:swim` | Swim in air | `:swim` |
| `:superjump` | Enable super jump | `:superjump` |
| `:trail` | Add movement trail | `:trail` |
| `:clear` | Clear output | `:clear` |
| `:cmds` | Show command list | `:cmds` or `:commands` |

### **Key Features**

#### 🎯 **ESP System**
- Real-time player tracking
- Distance calculation in studs
- Highlight effects with customizable colors
- Billboard GUI with player names

#### ✈️ **Fly Mode**
- Smooth flight mechanics
- WASD for directional movement
- Space to ascend / Left Shift to descend
- Adjustable fly speed

#### 🚫 **Noclip**
- Walk through walls and objects
- Automatic collision detection bypass
- Seamless character movement

#### 🔆 **Fullbright**
- Enhanced visibility in dark environments
- Removes fog effects
- Adjustable lighting settings

#### 🎨 **User Interface**
- Modern gradient design
- Draggable and resizable
- Minimize and close buttons
- Real-time command output with timestamps
- Scrollable output window

#### 🛡️ **Anti-AFK**
- Automatically prevents AFK kicks
- Runs silently in background
- No user interaction required

---

## 🛠️ How It Was Created

### **Development Process**

#### **Phase 1: Planning & Architecture**
The script was designed with a modular architecture to ensure:
- **Scalability** - Easy to add new commands
- **Maintainability** - Clean code structure
- **Performance** - Optimized for minimal lag
- **Compatibility** - Works with FE-enabled games

#### **Phase 2: Core Systems Development**

**GUI Framework**
```lua
ScreenGui → MainFrame → Components
├── TopBar (Title, Minimize, Close)
├── CommandInput (Text input field)
├── OutputScroll (Command output display)
└── Notifications (Pop-up alerts)
```

**Command System**
- Built a flexible command parser
- String splitting for arguments
- Multiple alias support per command
- Error handling and user feedback

**Feature Implementation**
Each feature was developed independently:
1. **Fly System** - BodyVelocity + BodyGyro physics
2. **ESP System** - Highlight instances + BillboardGui
3. **Noclip** - RunService.Stepped collision bypass
4. **Fullbright** - Lighting service manipulation

#### **Phase 3: Integration & Testing**

**Event Handling**
- UserInputService for keyboard shortcuts
- Mouse click detection for Click TP
- Player events for ESP updates
- Character respawn handling

**Optimization Techniques**
- Efficient loop structures
- Conditional rendering
- Memory cleanup on player removal
- Debounce mechanisms

#### **Phase 4: Polish & UX**

**Visual Design**
- Color gradients for modern aesthetics
- UICorner for rounded edges
- UIStroke for border effects
- Smooth tweening animations

**User Experience**
- Timestamp logging system
- Clear error messages
- Auto-scrolling output
- Notification system for important events

### **Technical Highlights**

#### **Advanced Lua Techniques**
```lua
Metatables for object management
Coroutines for async operations
Closures for encapsulation
Table manipulation for data structures
```

#### **Roblox Services Utilized**
- Players (Player management)
- UserInputService (Input detection)
- RunService (Frame-by-frame updates)
- TweenService (Animations)
- Lighting (Visual effects)
- Workspace (World interaction)

#### **Security Considerations**
- Local script execution only
- FE-compliant implementations
- No server-side exploits
- Client-side modifications only

---

## 👤 Credits

<div align="center">

### **Creator**

**ByteBandit_ofici**

*Date: December 10, 2025*

---

### Special Thanks

This script was created to provide a professional, user-friendly admin system for Roblox players.

**Built with:**
- Lua scripting language
- Roblox Studio
- Passion for game development

---

### Support & Contact

Found a bug? Have a suggestion?

Open an issue on GitHub or contact the creator!

---

### License

This project is provided as-is for educational purposes.

**⚠️ Disclaimer:** Use responsibly and in accordance with Roblox Terms of Service.

---

<sub>Made with ❤️ by ByteBandit_ofici</sub>

</div>

---

## 📸 Screenshots

### Main Interface
The admin panel features a sleek, modern design with gradient effects and rounded corners.

### ESP System
Real-time player tracking with distance calculation and highlight effects.

### Command Output
All commands provide instant feedback with timestamps in a scrollable output window.

---

## 🔄 Version History

**v1.0.0** - December 10, 2025
- Initial release
- 32+ commands implemented
- Modern GUI design
- ESP system with distance tracking
- Fly mode with full controls
- Anti-AFK system
- Notification system

---

## 🚀 Future Updates

Planned features for upcoming versions:
- Custom keybind configuration
- Save/load settings
- More ESP customization options
- Advanced teleport features
- Command history
- Macro system

---

<div align="center">

**⭐ If you found this useful, consider giving it a star!**

![Made with Lua](https://img.shields.io/badge/Made%20with-Lua-blue?style=flat-square)
![Roblox Compatible](https://img.shields.io/badge/Roblox-Compatible-success?style=flat-square)

</div>
