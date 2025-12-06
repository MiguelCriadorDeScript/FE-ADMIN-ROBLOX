local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Prefix = ":"
local AdminKey = Enum.KeyCode.RightControl
local NoClipEnabled = false
local ESPEnabled = false
local FlyEnabled = false
local InfiniteJumpEnabled = false
local FullbrightEnabled = false
local XRayEnabled = false
local SpeedBoostEnabled = false
local AimbotEnabled = false
local ClickTPEnabled = false
local FlySpeed = 50
local OriginalWalkSpeed = 16
local OriginalJumpPower = 50
local OriginalGravity = workspace.Gravity
local FlyBodyVelocity = nil
local FlyBodyGyro = nil
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local CommandInput = Instance.new("TextBox")
local OutputScroll = Instance.new("ScrollingFrame")
local OutputText = Instance.new("TextLabel")
local CommandsList = Instance.new("ScrollingFrame")
local CommandsTitle = Instance.new("TextLabel")
local Shadow = Instance.new("Frame")
ScreenGui.Name = "ProfessionalAdminGUI"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999999
Shadow.Name = "Shadow"
Shadow.Parent = MainFrame
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.7
Shadow.BorderSizePixel = 0
Shadow.Position = UDim2.new(0, 4, 0, 4)
Shadow.Size = UDim2.new(1, 0, 1, 0)
Shadow.ZIndex = 0
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.ClipsDescendants = true
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(80, 80, 255)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 50)
local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 12)
TopCorner.Parent = TopBar
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0.6, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "PROFESSIONAL FE ADMIN"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 255))
}
TitleGradient.Parent = Title
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(1, -80, 0.25, 0)
MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.TextSize = 20
local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeButton
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -45, 0.25, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton
CommandInput.Name = "CommandInput"
CommandInput.Parent = MainFrame
CommandInput.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
CommandInput.BorderSizePixel = 0
CommandInput.Position = UDim2.new(0.03, 0, 0.16, 0)
CommandInput.Size = UDim2.new(0.94, 0, 0, 40)
CommandInput.Font = Enum.Font.Gotham
CommandInput.PlaceholderText = "Enter command here... (Type :cmds for command list)"
CommandInput.Text = ""
CommandInput.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandInput.TextSize = 14
CommandInput.ClearTextOnFocus = false
CommandInput.TextXAlignment = Enum.TextXAlignment.Left
local InputPadding = Instance.new("UIPadding")
InputPadding.PaddingLeft = UDim.new(0, 10)
InputPadding.Parent = CommandInput
local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = CommandInput
local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(60, 60, 80)
InputStroke.Thickness = 1
InputStroke.Parent = CommandInput
OutputScroll.Name = "OutputScroll"
OutputScroll.Parent = MainFrame
OutputScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
OutputScroll.BorderSizePixel = 0
OutputScroll.Position = UDim2.new(0.03, 0, 0.29, 0)
OutputScroll.Size = UDim2.new(0.94, 0, 0, 250)
OutputScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
OutputScroll.ScrollBarThickness = 6
OutputScroll.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 255)
local OutputCorner = Instance.new("UICorner")
OutputCorner.CornerRadius = UDim.new(0, 8)
OutputCorner.Parent = OutputScroll
local OutputStroke = Instance.new("UIStroke")
OutputStroke.Color = Color3.fromRGB(60, 60, 80)
OutputStroke.Thickness = 1
OutputStroke.Parent = OutputScroll
OutputText.Name = "OutputText"
OutputText.Parent = OutputScroll
OutputText.BackgroundTransparency = 1
OutputText.Size = UDim2.new(1, -10, 1, 0)
OutputText.Font = Enum.Font.Code
OutputText.Text = "Professional FE Admin loaded successfully!\nPress RIGHT CTRL to toggle GUI\nType :cmds to see all commands"
OutputText.TextColor3 = Color3.fromRGB(200, 200, 200)
OutputText.TextSize = 13
OutputText.TextWrapped = true
OutputText.TextYAlignment = Enum.TextYAlignment.Top
OutputText.TextXAlignment = Enum.TextXAlignment.Left
local OutputPadding = Instance.new("UIPadding")
OutputPadding.PaddingLeft = UDim.new(0, 10)
OutputPadding.PaddingTop = UDim.new(0, 10)
OutputPadding.Parent = OutputText
local function AddOutput(text)
    local timestamp = os.date("[%H:%M:%S] ")
    OutputText.Text = OutputText.Text .. "\n" .. timestamp .. text
    OutputScroll.CanvasSize = UDim2.new(0, 0, 0, OutputText.TextBounds.Y + 20)
    OutputScroll.CanvasPosition = Vector2.new(0, OutputScroll.CanvasSize.Y.Offset)
end
local function ClearOutput()
    OutputText.Text = ""
    OutputScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
end
local function GetCharacter()
    return Player.Character
end
local function GetHumanoid()
    local char = GetCharacter()
    return char and char:FindFirstChildOfClass("Humanoid")
end
local function GetRootPart()
    local char = GetCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end
local function EnableFly()
    local rootPart = GetRootPart()
    if not rootPart then return end
    FlyBodyVelocity = Instance.new("BodyVelocity")
    FlyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
    FlyBodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    FlyBodyVelocity.Parent = rootPart
    FlyBodyGyro = Instance.new("BodyGyro")
    FlyBodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    FlyBodyGyro.P = 9e4
    FlyBodyGyro.Parent = rootPart
    FlyEnabled = true
    AddOutput("Fly mode enabled! Use WASD + Space/Shift")
end
local function DisableFly()
    if FlyBodyVelocity then FlyBodyVelocity:Destroy() end
    if FlyBodyGyro then FlyBodyGyro:Destroy() end
    FlyEnabled = false
    AddOutput("Fly mode disabled")
end
local function CreateESP(player)
    if player == Player then return end
    local char = player.Character
    if not char then return end
    if char:FindFirstChild("ESPBox") then return end
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESPBox"
    highlight.Parent = char
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESPLabel"
    billboard.Parent = char:FindFirstChild("Head")
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Parent = billboard
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeTransparency = 0.5
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 14
    local distLabel = Instance.new("TextLabel")
    distLabel.Name = "Distance"
    distLabel.Parent = billboard
    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "0 studs"
    distLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    distLabel.TextStrokeTransparency = 0.5
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextSize = 12
end
local function RemoveESP(player)
    local char = player.Character
    if not char then return end
    if char:FindFirstChild("ESPBox") then
        char.ESPBox:Destroy()
    end
    local head = char:FindFirstChild("Head")
    if head and head:FindFirstChild("ESPLabel") then
        head.ESPLabel:Destroy()
    end
end
local function EnableESP()
    for _, player in pairs(Players:GetPlayers()) do
        CreateESP(player)
    end
    ESPEnabled = true
    AddOutput("ESP enabled for all players")
end
local function DisableESP()
    for _, player in pairs(Players:GetPlayers()) do
        RemoveESP(player)
    end
    ESPEnabled = false
    AddOutput("ESP disabled")
end
local function EnableFullbright()
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    FullbrightEnabled = true
    AddOutput("Fullbright enabled")
end
local function DisableFullbright()
    Lighting.Brightness = 1
    Lighting.ClockTime = 12
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = true
    Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
    FullbrightEnabled = false
    AddOutput("Fullbright disabled")
end
local function TeleportToPlayer(targetName)
    local target = nil
    for _, player in pairs(Players:GetPlayers()) do
        if string.lower(player.Name):sub(1, #targetName) == string.lower(targetName) then
            target = player
            break
        end
    end
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = GetRootPart()
        if rootPart then
            rootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
            AddOutput("Teleported to " .. target.Name)
        end
    else
        AddOutput("Player not found or has no character")
    end
end
local function ShowCommands()
    ClearOutput()
    AddOutput("=== AVAILABLE COMMANDS ===")
    AddOutput(":ws [speed] - Set walk speed")
    AddOutput(":jp [power] - Set jump power")
    AddOutput(":god - Enable god mode")
    AddOutput(":ungod - Disable god mode")
    AddOutput(":fly - Toggle fly mode")
    AddOutput(":unfly - Disable fly")
    AddOutput(":noclip - Toggle noclip")
    AddOutput(":clip - Disable noclip")
    AddOutput(":esp - Toggle ESP")
    AddOutput(":unesp - Disable ESP")
    AddOutput(":fullbright - Toggle fullbright")
    AddOutput(":unfullbright - Disable fullbright")
    AddOutput(":infinitejump - Toggle infinite jump")
    AddOutput(":btools - Give building tools")
    AddOutput(":reset - Reset character")
    AddOutput(":respawn - Respawn character")
    AddOutput(":tp [player] - Teleport to player")
    AddOutput(":view [player] - View player camera")
    AddOutput(":unview - Reset camera")
    AddOutput(":fov [value] - Set field of view")
    AddOutput(":sit - Sit down")
    AddOutput(":jump - Force jump")
    AddOutput(":freeze - Freeze character")
    AddOutput(":thaw - Unfreeze character")
    AddOutput(":invisible - Become invisible")
    AddOutput(":visible - Become visible")
    AddOutput(":clicktp - Toggle click to teleport")
    AddOutput(":float - Float in air")
    AddOutput(":swim - Swim in air")
    AddOutput(":superjump - Enable super jump")
    AddOutput(":trail - Add movement trail")
    AddOutput(":clear - Clear output")
    AddOutput(":cmds - Show this list")
end
local function ExecuteCommand(input)
    local args = string.split(input, " ")
    local cmd = args[1]:lower()
    if cmd == Prefix .. "cmds" or cmd == Prefix .. "commands" then
        ShowCommands()
    elseif cmd == Prefix .. "ws" or cmd == Prefix .. "speed" or cmd == Prefix .. "walkspeed" then
        local speed = tonumber(args[2]) or 50
        local humanoid = GetHumanoid()
        if humanoid then
            humanoid.WalkSpeed = speed
            AddOutput("Walk speed set to " .. speed)
        end
    elseif cmd == Prefix .. "jp" or cmd == Prefix .. "jump" or cmd == Prefix .. "jumppower" then
        local power = tonumber(args[2]) or 100
        local humanoid = GetHumanoid()
        if humanoid then
            humanoid.JumpPower = power
            AddOutput("Jump power set to " .. power)
        end
    elseif cmd == Prefix .. "god" or cmd == Prefix .. "godmode" then
        local humanoid = GetHumanoid()
        if humanoid then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
            AddOutput("God mode enabled")
        end
    elseif cmd == Prefix .. "ungod" then
        local humanoid = GetHumanoid()
        if humanoid then
            humanoid.MaxHealth = 100
            humanoid.Health = 100
            AddOutput("God mode disabled")
        end
    elseif cmd == Prefix .. "fly" then
        if not FlyEnabled then
            EnableFly()
        else
            DisableFly()
        end
    elseif cmd == Prefix .. "unfly" then
        DisableFly()
    elseif cmd == Prefix .. "noclip" then
        NoClipEnabled = not NoClipEnabled
        AddOutput("Noclip " .. (NoClipEnabled and "enabled" or "disabled"))
    elseif cmd == Prefix .. "clip" then
        NoClipEnabled = false
        AddOutput("Noclip disabled")
    elseif cmd == Prefix .. "esp" then
        if not ESPEnabled then
            EnableESP()
        else
            DisableESP()
        end
    elseif cmd == Prefix .. "unesp" then
        DisableESP()
    elseif cmd == Prefix .. "fullbright" or cmd == Prefix .. "fb" then
        if not FullbrightEnabled then
            EnableFullbright()
        else
            DisableFullbright()
        end
    elseif cmd == Prefix .. "unfullbright" then
        DisableFullbright()
    elseif cmd == Prefix .. "infinitejump" or cmd == Prefix .. "infjump" then
        InfiniteJumpEnabled = not InfiniteJumpEnabled
        AddOutput("Infinite jump " .. (InfiniteJumpEnabled and "enabled" or "disabled"))
    elseif cmd == Prefix .. "btools" then
        local backpack = Player:FindFirstChild("Backpack")
        if backpack then
            Instance.new("HopperBin", backpack).BinType = Enum.BinType.Clone
            Instance.new("HopperBin", backpack).BinType = Enum.BinType.Hammer
            Instance.new("HopperBin", backpack).BinType = Enum.BinType.Grab
            AddOutput("Building tools added to backpack")
        end
    elseif cmd == Prefix .. "reset" then
        local humanoid = GetHumanoid()
        if humanoid then
            humanoid.Health = 0
            AddOutput("Character reset")
        end
    elseif cmd == Prefix .. "respawn" then
        local humanoid = GetHumanoid()
        if humanoid then
            humanoid.Health = 0
            AddOutput("Respawning...")
        end
    elseif cmd == Prefix .. "tp" or cmd == Prefix .. "teleport" then
        if args[2] then
            TeleportToPlayer(args[2])
        else
            AddOutput("Usage: :tp [player name]")
        end
    elseif cmd == Prefix .. "view" then
        if args[2] then
            local target = nil
            for _, player in pairs(Players:GetPlayers()) do
                if string.lower(player.Name):sub(1, #args[2]) == string.lower(args[2]) then
                    target = player
                    break
                end
            end
            if target and target.Character then
                workspace.CurrentCamera.CameraSubject = target.Character:FindFirstChildOfClass("Humanoid")
                AddOutput("Viewing " .. target.Name)
            else
                AddOutput("Player not found")
            end
        else
            AddOutput("Usage: :view [player name]")
        end
    elseif cmd == Prefix .. "unview" then
        workspace.CurrentCamera.CameraSubject = GetHumanoid()
        AddOutput("Camera reset")
    elseif cmd == Prefix .. "fov" then
        local value = tonumber(args[2]) or 70
        workspace.CurrentCamera.FieldOfView = value
        AddOutput("FOV set to " .. value)
    elseif cmd == Prefix .. "sit" then
        local humanoid = GetHumanoid()
        if humanoid then
            humanoid.Sit = true
            AddOutput("Sitting")
        end
    elseif cmd == Prefix .. "freeze" then
        local rootPart = GetRootPart()
        if rootPart then
            rootPart.Anchored = true
            AddOutput("Character frozen")
        end
    elseif cmd == Prefix .. "thaw" or cmd == Prefix .. "unfreeze" then
        local rootPart = GetRootPart()
        if rootPart then
            rootPart.Anchored = false
            AddOutput("Character unfrozen")
        end
    elseif cmd == Prefix .. "invisible" or cmd == Prefix .. "invis" then
        local char = GetCharacter()
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 1
                end
            end
            AddOutput("Character invisible")
        end
    elseif cmd == Prefix .. "visible" or cmd == Prefix .. "vis" then
        local char = GetCharacter()
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = 0
                elseif part:IsA("Decal") then
                    part.Transparency = 0
                end
            end
            AddOutput("Character visible")
        end
    elseif cmd == Prefix .. "clicktp" then
        ClickTPEnabled = not ClickTPEnabled
        AddOutput("Click teleport " .. (ClickTPEnabled and "enabled" or "disabled"))
    elseif cmd == Prefix .. "float" then
        local rootPart = GetRootPart()
        if rootPart then
            local floatPart = Instance.new("Part")
            floatPart.Name = "FloatPart"
            floatPart.Size = Vector3.new(6, 1, 6)
            floatPart.Transparency = 1
            floatPart.Anchored = true
            floatPart.CanCollide = true
            floatPart.Position = rootPart.Position - Vector3.new(0, 3.5, 0)
            floatPart.Parent = workspace
            AddOutput("Float part created under you")
        end
    elseif cmd == Prefix .. "swim" then
        local humanoid = GetHumanoid()
        if humanoid then
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
            humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
            AddOutput("Swimming in air enabled")
        end
    elseif cmd == Prefix .. "superjump" then
        local humanoid = GetHumanoid()
        if humanoid then
            humanoid.JumpPower = 200
            AddOutput("Super jump enabled (JP: 200)")
        end
    elseif cmd == Prefix .. "trail" then
        local rootPart = GetRootPart()
        if rootPart then
            if rootPart:FindFirstChild("Trail") then
                rootPart.Trail:Destroy()
                AddOutput("Trail removed")
            else
                local attachment0 = Instance.new("Attachment", rootPart)
                local attachment1 = Instance.new("Attachment", rootPart)
                attachment1.Position = Vector3.new(0, -2, 0)
                local trail = Instance.new("Trail")
                trail.Attachment0 = attachment0
                trail.Attachment1 = attachment1
                trail.Color = ColorSequence.new(Color3.fromRGB(255, 0, 255))
                trail.FaceCamera = true
                trail.Lifetime = 1
                trail.Parent = rootPart
                AddOutput("Trail added")
            end
        end
    elseif cmd == Prefix .. "clear" then
        ClearOutput()
        AddOutput("Output cleared")
    else
        AddOutput("Unknown command: " .. cmd)
        AddOutput("Type :cmds for command list")
    end
end
CommandInput.FocusLost:Connect(function(enterPressed)
    if enterPressed and CommandInput.Text ~= "" then
        ExecuteCommand(CommandInput.Text)
        CommandInput.Text = ""
    end
end)
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)
MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == AdminKey then
        MainFrame.Visible = not MainFrame.Visible
    end
    if InfiniteJumpEnabled and input.KeyCode == Enum.KeyCode.Space then
        local humanoid = GetHumanoid()
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
    if ClickTPEnabled and input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mouse = Player:GetMouse()
        local rootPart = GetRootPart()
        if rootPart and mouse.Target then
            rootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
        end
    end
end)
RunService.Stepped:Connect(function()
    if NoClipEnabled then
        local char = GetCharacter()
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
    if FlyEnabled then
        local rootPart = GetRootPart()
        local humanoid = GetHumanoid()
        if rootPart and humanoid and FlyBodyVelocity and FlyBodyGyro then
            local camera = workspace.CurrentCamera
            FlyBodyGyro.CFrame = camera.CFrame
            local direction = Vector3.new(0, 0, 0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                direction = direction + (camera.CFrame.LookVector)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                direction = direction - (camera.CFrame.LookVector)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                direction = direction - (camera.CFrame.RightVector)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                direction = direction + (camera.CFrame.RightVector)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                direction = direction + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                direction = direction - Vector3.new(0, 1, 0)
            end
            FlyBodyVelocity.Velocity = direction * FlySpeed
        end
    end
    if ESPEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character then
                local char = player.Character
                local head = char:FindFirstChild("Head")
                if head and head:FindFirstChild("ESPLabel") then
                    local distLabel = head.ESPLabel:FindFirstChild("Distance")
                    if distLabel then
                        local rootPart = GetRootPart()
                        local targetRoot = char:FindFirstChild("HumanoidRootPart")
                        if rootPart and targetRoot then
                            local distance = (rootPart.Position - targetRoot.Position).Magnitude
                            distLabel.Text = math.floor(distance) .. " studs"
                        end
                    end
                end
            end
        end
    end
end)
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if ESPEnabled then
            task.wait(1)
            CreateESP(player)
        end
    end)
end)
Players.PlayerRemoving:Connect(function(player)
    RemoveESP(player)
end)
Player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    if NoClipEnabled then
        task.wait(0.1)
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)
local function CreateNotification(title, text, duration)
    local NotifGui = Instance.new("ScreenGui")
    local NotifFrame = Instance.new("Frame")
    local NotifTitle = Instance.new("TextLabel")
    local NotifText = Instance.new("TextLabel")
    NotifGui.Name = "Notification"
    NotifGui.Parent = Player:WaitForChild("PlayerGui")
    NotifGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    NotifGui.DisplayOrder = 999999998
    NotifFrame.Name = "NotifFrame"
    NotifFrame.Parent = NotifGui
    NotifFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Position = UDim2.new(1, 10, 0.9, 0)
    NotifFrame.Size = UDim2.new(0, 300, 0, 80)
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 10)
    NotifCorner.Parent = NotifFrame
    local NotifStroke = Instance.new("UIStroke")
    NotifStroke.Color = Color3.fromRGB(80, 80, 255)
    NotifStroke.Thickness = 2
    NotifStroke.Parent = NotifFrame
    NotifTitle.Name = "NotifTitle"
    NotifTitle.Parent = NotifFrame
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Position = UDim2.new(0, 10, 0, 5)
    NotifTitle.Size = UDim2.new(1, -20, 0, 25)
    NotifTitle.Font = Enum.Font.GothamBold
    NotifTitle.Text = title
    NotifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifTitle.TextSize = 16
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    NotifText.Name = "NotifText"
    NotifText.Parent = NotifFrame
    NotifText.BackgroundTransparency = 1
    NotifText.Position = UDim2.new(0, 10, 0, 30)
    NotifText.Size = UDim2.new(1, -20, 0, 45)
    NotifText.Font = Enum.Font.Gotham
    NotifText.Text = text
    NotifText.TextColor3 = Color3.fromRGB(200, 200, 200)
    NotifText.TextSize = 14
    NotifText.TextWrapped = true
    NotifText.TextXAlignment = Enum.TextXAlignment.Left
    NotifText.TextYAlignment = Enum.TextYAlignment.Top
    NotifFrame:TweenPosition(UDim2.new(1, -310, 0.9, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    task.wait(duration or 3)
    NotifFrame:TweenPosition(UDim2.new(1, 10, 0.9, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true)
    task.wait(0.5)
    NotifGui:Destroy()
end
task.spawn(function()
    task.wait(1)
    CreateNotification("FE Admin Loaded", "Professional FE Admin is ready!\nPress RIGHT CTRL to open menu", 5)
end)
local AntiAFK = true
if AntiAFK then
    local VirtualUser = game:GetService("VirtualUser")
    Player.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end
