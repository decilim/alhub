local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "BugLineage",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "BugLineage V1",
   LoadingSubtitle = "by decilim",
   Theme = "Serenity", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Games"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "BugLineage | Key",
      Subtitle = "Link in discord server",
      Note = "Join discord server", -- Use this to tell the user how to get a key
      FileName = "BugLineageKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/vADA8ZqN"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🎪| Main", nil) -- Title, Image
local SecondTab = Window:CreateTab("👁️| ESP", nil) -- Title, Image
local ThirdTab = Window:CreateTab("🚩| Teleport", nil) -- Title, Image
local FourthTab = Window:CreateTab("💃| Animations", nil)
local MainSection = MainTab:CreateSection("Auto Dodge")
local SecondSection = SecondTab:CreateSection("ESP")
local ThirdSection = ThirdTab:CreateSection("Teleport")
local FourthSection = FourthTab:CreateSection("Animations")

Rayfield:Notify({
   Title = "Script Executed",
   Content = "Enjoy BugLineage V1",
   Duration = 6.5,
   Image = 4483362458,
})

local Button = MainTab:CreateButton({
   Name = "Auto Dodge | Insta Moves (Cant turn off!)",
   Callback = function()
   local old
old = hookmetamethod(game, "__namecall", function(self, ...)
  if self.Name == "RemoteFunction" and getnamecallmethod() == "FireServer" then
      local args = {...}
      if args[2] == "DodgeMinigame" and typeof(args[1]) == "table" then
       args[1] = {true, true}
       return old(self, unpack(args))
      end
  end
  return old(self, ...)
end)
   end,
})

local Button = SecondTab:CreateButton({
   Name = "ESP",
   Callback = function()
--// Written by depso
local Players = game:GetService("Players")

local function ApplyHighlight(Player)
    local Connections = {}

    --// Parts
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local HightLighter = Instance.new("Highlight", Character)

    local function UpdateFillColor()
        local DefaultColor = Color3.fromRGB(0.956863, 0.960784, 0.964706)
        HightLighter.FillColor = (Player.TeamColor and Player.TeamColor.Color) or DefaultColor
    end

    local function Disconnect()
        HightLighter:Remove()
        
        for _, Connection in next, Connections do
            Connection:Disconnect()
        end
    end

    --// Connect functions to events
    table.insert(Connections, Player:GetPropertyChangedSignal("TeamColor"):Connect(UpdateFillColor))
    table.insert(Connections, Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
        if Humanoid.Health <= 0 then
            Disconnect()
        end
    end))
end

local function HightLightPlayer(Player)
    if Player.Character then
        HightLightPlayer(Player)
    end
    Player.CharacterAdded:Connect(function()
        HightLightPlayer(Player)
    end)
end

--// Apply highlights to players
for _, Player in next, Players:GetPlayers() do
    ApplyHighlight(Player)
end
Players.PlayerAdded:Connect(ApplyHighlight)
   end,
})

local Dropdown = ThirdTab:CreateDropdown({
    Name = "Teleports",
    Options = {"Caldera","Cauldron"},
    CurrentOption = {"Caldera"},
    MultipleOptions = false,
    Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)
    -- The function that takes place when the selected option is changed
    -- The variable (Options) is a table of strings for the current selected options
    end,
 })

 local Players = game:GetService("Players")
 local LocalPlayer = Players.LocalPlayer
 local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
 local Humanoid = Character:FindFirstChildOfClass("Humanoid")
 
 local Animation = Instance.new("Animation")
 local AnimationID = "rbxassetid://15694504637" -- Replace with any animation ID
 local AnimationTrack = nil
 
 -- Ensure the character has an Animator
 local function GetOrCreateAnimator(humanoid)
     local animator = humanoid:FindFirstChildOfClass("Animator")
     if not animator then
         animator = Instance.new("Animator")
         animator.Parent = humanoid
     end
     return animator
 end
 
 -- Toggle Function
 local Toggle = FourthTab:CreateToggle({
     Name = "Toggle Animation",
     CurrentValue = false,
     Flag = "Toggle1", 
     Callback = function(Value)
         if not Humanoid then
             warn("No humanoid found!")
             return
         end
 
         local Animator = GetOrCreateAnimator(Humanoid) -- Ensure Animator exists
 
         if Value then
             -- Play Animation
             Animation.AnimationId = AnimationID
             AnimationTrack = Animator:LoadAnimation(Animation)
             AnimationTrack:Play()
         else
             -- Stop Animation
             if AnimationTrack then
                 AnimationTrack:Stop()
                 AnimationTrack = nil
             end
         end
     end,
 })
 