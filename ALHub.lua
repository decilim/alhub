local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ArcaneLineageFucker",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "ArcaneLineageFucker V1",
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
      Title = "ArcaneLineageFucker | Key",
      Subtitle = "Link in discord server",
      Note = "Join discord server", -- Use this to tell the user how to get a key
      FileName = "RobloxFuckerKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/vADA8ZqN"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("👁️| Main", nil) -- Title, Image
local SecondTab = Window:CreateTab("👁️| ESP", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Auto Dodge")

Rayfield:Notify({
   Title = "Script Executed",
   Content = "Enjoy ALFucker V1",
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
   local esp_settings = { 
    textsize = 8,
    colour = 255,255,255
}
local esp = Instance.new("TextLabel",gui)
            
esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
esp.Text = ""
esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
esp.BorderSizePixel = 4;
esp.BorderColor3 = Color3.new(esp_settings.colour)
esp.BorderSizePixel = 0
esp.Font = "GothamSemibold"
esp.TextSize = esp_settings.textsize
esp.TextColor3 = Color3.fromRGB(esp_settings.colour) -- text colour
 
game:GetService("RunService").RenderStepped:Connect(function()
    for i,v in pairs (game:GetService("Players"):GetPlayers()) do
        if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("Cracked esp")==nil  then
            esp.Text = "{"..v.Name.."}"
    end
end
end)
   end,
})
