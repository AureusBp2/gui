game.StarterGui:SetCore("SendNotification", {Title = "BP1 Library", Text = "Loaded successfully!", Icon = "rbxassetid://7681420911", Duration = 5, Button1 = "Okay"})
local SynixWare = loadstring(game:HttpGet"https://pastebin.com/raw/07khgLDY")()

_G.closeBind = Enum.KeyCode.P

local win = SynixWare:Window("DD0S", "Breaking Point", Color3.fromRGB(15, 128, 255), _G.closeBind)
SynixWare:AddNotification("UI Loaded, fuck the old library.", "Okay.")
function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		SynixWare:AddNotification('Copied', 'Copied in your ClipBoard.')
	else
		SynixWare:AddNotification("Clipboard","Your exploit doesn't have the ability to use the clipboard")
	end
end

local Settings = win:Tab("Settings/Credits", "http://www.roblox.com/asset/?id=6031280882")-- Tab


Settings:AddLine()--Line

Settings:AddLabel("UI Settings")--Label

Settings:AddColorpicker("Change UI Color", Color3.fromRGB(15, 128, 255), function(t)--Change UI Color
    _G.PresetColor = t
    coroutine.wrap(_G.changeColor)()
    end)
 
    Settings:AddBind("Toggle UI", Enum.KeyCode.P, function()--Toggle UI
    _G.toggleUiHere()
        end)

Settings:AddButton("Destroy UI", "Destroy The UI", function()-- Destoy UI
            SynixWare:Destroy()
            end)
Settings:AddLine()-- line

Settings:AddLabel("Credits")--Label
    
Settings:AddButton("Copy Discord Link", "Join us!", function()--Button
local http = game:GetService('HttpService') 
	if toClipboard then
		toClipboard('https://discord.com/invite/fJSuja72bk')
		SynixWare:AddNotification("Your executor don't support syn.request.", "RIP")
	else
		SynixWare:AddNotification('discord.gg/fJSuja72bk', 'Okay!')
	end
	local req = (syn and syn.request) or (http and http.request) or http_request
	if req then
		req({
			Url = 'http://127.0.0.1:6463/rpc?v=1',
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'application/json',
				Origin = 'https://discord.com'
			},
			Body = http:JSONEncode({
				cmd = 'INVITE_BROWSER',
				nonce = http:GenerateGUID(false),
				args = {code = 'fJSuja72bk'}
			})
		})
	end
end)

Settings:AddLabel("DD0S#7777")--Label
            
Settings:AddLine()

local script = win:Tab("Main Scripts", "http://www.roblox.com/asset/?id=6034848748")
script:AddLine()
script:AddLabelMiddle("Kill scripts")
script:AddLabelWarn("The scripts bellow won't get you trade banned.")
script:AddButton("Hitboxes (6,6,6)", "Change the size of the Hitboxes to a width of (6,6,6).",
    function()--Button
     for _, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= game:GetService("Players").LocalPlayer.Name then
     v.Character.Head.CanCollide = false
     v.Character.Head.Size = Vector3.new(6, 6, 6)
     v.Character.Head.Transparency = 1
   end
 end
end)
script:AddButton("Universal Hitboxes", "This GUI is not detectable if you do not abuse it.", 
    function()
      loadstring(game:HttpGet("http://gameovers.net/Scripts/Free/HitboxExpander/main.lua", true))() 
    end)
script:AddButton("Auto throw {beta}", "This script is bad.",
    function()
                local plrs = game:service "Players"
local lp = plrs.LocalPlayer
local bind = lp.PlayerScripts.Event
local ThrowKnifeFunc
local KillFunc
local MsgBox
function GetSkid()
    for _, plr in pairs(plrs:GetPlayers()) do
        if plr ~= lp and plr.Character and plr.Character:FindFirstChild("Blade") and plr.Character.Humanoid.Health > 0 then
            return plr
        end
    end
    return nil
end

function GetKillFunc()
    for i, v in pairs(getgc(false)) do
        if type(v) == "function" and tostring(getfenv(v).script) == game.Players.LocalPlayer.PlayerScripts:GetChildren()[1].Name then
            local constants = debug.getconstants(v)
            for _, b in pairs(constants) do
                if tostring(b) == "IIlIla" then
                    KillFunc = v
                end
            end
        end
    end
end

function GetThrowKnifeFunc()
    for i, v in pairs(getgc(true)) do
        if type(v) == "function" and debug.getinfo(v).name == "throw" then
            ThrowKnifeFunc = v
        end
    end
end

function GetMsgBoxFunc()
    for i, v in pairs(getgc(true)) do
        if type(v) == "function" and debug.getinfo(v).name == "fancymsgbox" then
            MsgBox = v
        end
    end
end

GetKillFunc()
GetThrowKnifeFunc()
GetMsgBoxFunc()

debug.setconstant(ThrowKnifeFunc, 46, 1)

MsgBox("DD0S {beta} AutoThrow Script Loaded.")
while wait(0.1) do
    local ptr = GetSkid()
    if ptr ~= nil and lp.Character:FindFirstChild("Blade") then
        bind:Fire("t", ptr.Character.HumanoidRootPart.CFrame)
        KillFunc(ptr.Character.HumanoidRootPart, true, ptr.Character.HumanoidRootPart.Position)
        ThrowKnifeFunc(ptr.Character.HumanoidRootPart.CFrame)
    end
end
    end)
script:AddLine()
script:AddLabelWarn("Using The scripts bellow will get you trade banned.")
script:AddButton("Alway Hit & Kill Aura", "This is the original script.",
    function()
         loadstring(game:HttpGet('https://pastebin.com/raw/TqPihvFD', true))()
    end)
script:AddLine()
script:AddLabelMiddle("Gun Scripts")

script:AddToggle("Kill all gun", "AKA infinite money script.",false, function(t)-- Toggle Example ("Title", "Description",Debeautiful, callback)
            wait()
   game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "public")
   wait()
   for i,v in pairs(game.Players:GetPlayers()) do
       if v.Name == game.Players.LocalPlayer.Name then
           else
           game:GetService("ReplicatedStorage").RemoteEvent:FireServer(30, v)
          
       end
   end
end)
script:AddButton("Gun Slinger", "Work only in the gamemode 'Gunslinger'.",
    function()
      --//Normal Variables\\--
local sk = Enum.KeyCode.K -- Kills the script/events
local tk = Enum.KeyCode.B -- Toggles the autokill on/off
local uis = game:GetService("UserInputService")
--//Adjustable Variables\\--
local p = game:GetService('Players').LocalPlayer
local pl = game:GetService('Players')
local m = p:GetMouse()
local cc = game.Workspace.CurrentCamera
local tog = true
local e1, e2
--//On by Default (I wouldn't change this)\\--
p.CameraMode = Enum.CameraMode.LockFirstPerson
if game:GetService("Workspace"):FindFirstChild("deadbodies") then
   game:GetService("Workspace").deadbodies:Destroy()
end
--//Aim & Shoot Function\\--
function ka(t)
if t ~= p.Name then
if tog == true then
ch = p.Character
ch.HumanoidRootPart.CFrame = CFrame.new(ch.HumanoidRootPart.Position, pl[t].Character.HumanoidRootPart.Position)
cc.CFrame = CFrame.new(ch.HumanoidRootPart.Position, pl[t].Character.HumanoidRootPart.Position)
repeat wait(.005) mouse1click() until game.Workspace.gunholder[t] == nil
end
end
end
--//Toggle Detection\\--
e1 = uis.InputBegan:Connect(function(o)
   if uis:GetFocusedTextBox() then return end
   ------------------------------------------
if o.KeyCode == tk and tog == true then
ch = p.Character
p.CameraMode = Enum.CameraMode.Classic
tog = false
elseif o.KeyCode == tk and tog == false then
p.CameraMode = Enum.CameraMode.LockFirstPerson
tog = true
elseif o.KeyCode == sk then
e1:Disconnect();e2:Disconnect();p.CameraMode = Enum.CameraMode.Classic;ka = nil
end
end)
--//Gun Detection\\--
e2 = game.Workspace.light.PointLight.Changed:Connect(function()
game.Workspace.gunholder.ChildAdded:Connect(function(c)
ka(c.Name)
end)
end)  
    end)
script:AddLine()
script:AddLabelMiddle("Player Settings")
script:AddButton("Settings", "Change your character settings.",
    function()
               loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/LOOF-sys/Roblox-Shit/main/BreakingPoint.lua",true))()
    end)
script:AddButton("Destroy Torso Light", "Destroy your torso light.", function()
    local player = game.Players.LocalPlayer.Name
            game.Workspace:FindFirstChild(player).Torso.PointLight:Destroy()
    end)
script:AddButton("FE FLIP", "(Keybinds: Z,X,C)", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/NSfxNDBg", true))()
end)
script:AddButton("Anti IDLE", "You won't get kicked for inactivity!", function()
    	local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   end)
end)
script:AddButton("FE invisible", 'Execute when it says "beggining game".', function()
            Local = game:GetService('Players').LocalPlayer
Char  = Local.Character
touched,tpdback = false, false
Local.CharacterAdded:connect(function(char)
    if script.Disabled ~= true then
        wait(.25)
        loc = Char.HumanoidRootPart.Position
        Char:MoveTo(box.Position + Vector3.new(0,.5,0))
    end
end)
game:GetService('UserInputService').InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.Equals then
        if script.Disabled ~= true then
            script.Disabled = true
            print('you may re-execute')
        end
    end
end)
box = Instance.new('Part',workspace)
box.Anchored = true
box.CanCollide = true
box.Size = Vector3.new(10,1,10)
box.Position = Vector3.new(0,10000,0)
box.Touched:connect(function(part)
    if (part.Parent.Name == Local.Name) then
        if touched == false then
            touched = true
            function apply()
                if script.Disabled ~= true then
                    no = Char.HumanoidRootPart:Clone()
                    wait(.25)
                    Char.HumanoidRootPart:Destroy()
                    no.Parent = Char
                    Char:MoveTo(loc)
                    touched = false
                end end
            if Char then
                apply()
            end
        end
    end
end)
repeat wait() until Char
loc = Char.HumanoidRootPart.Position
Char:MoveTo(box.Position + Vector3.new(0,.5,0))
game.StarterGui:SetCore("SendNotification",{Title="Made by DD0S",Text='Execute when it says "beggining game"',Duration=12})
end)
script:AddToggle("Anti Hit", "TP you around the table",false, function()

wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-47.067363739014, 3.0214464664459, -241.70703125)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13.555360794067, 3.0214464664459, -179.99700927734)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12.890952110291, 3.0214471817017, -242.22521972656)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-48.113338470459, 3.0214471817017, -179.02966308594)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30.09005355835, 6.5734910964966, -211.66963195801)

end)
    
script:AddLine()
script:AddLabelMiddle("Binds")
script:AddBind("Break the light.", Enum.KeyCode.P, function(t)-- Blind Example ("Title","Key Code", Callback)
    
local args = {
    [1] = 45,
    [2] = nil --[[Vector3]]
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
  
end)
script:AddBind("TP to the middle.", Enum.KeyCode.P, function(t)-- Blind Example ("Title","Key Code", Callback)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30.112972259521, 6.3288602828979, -210.99415588379)
end)
script:AddLine()
local killall =
script:AddDropdown("Part to aim at.", {"Torso","Head",}, function(t) -- Dropdown Example ("Title", {"idk","names"}, Callback)
t = AIMPART
end)

script:AddBind("Kill Current player.", Enum.KeyCode.P, function(y)
    while wait() do
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            if game.Workspace:FindFirstChild(v.Name) then
                if game.Workspace[v.Name].Humanoid.Sit ~= true then
                    if game.Workspace[v.Name]:FindFirstChild("Blade") then
                        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(37, CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)), Vector3.new(v.Character.AIMPART.CFrame.x, 4, v.Character.AIMPART.CFrame.z), Vector3.new(0, 0, 0))
                        wait(.1)
                        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(43, v.Character.Head, v, "IIlIla", true)
                    else
                        if v.Backpack:FindFirstChild("Blade") then
                            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(37, CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)), Vector3.new(v.Character.AIMPART.CFrame.x, 4, v.Character.AIMPART.CFrame.z), Vector3.new(0, 0, 0))
                            wait(.1)
                            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(43, v.Character.Head, v, "IIlIla", true)
                            print(v.Name)
                        end
                    end
                end
            end
        end
    end
end
end)
-------------------
local vip = win:Tab("VIP", "http://www.roblox.com/asset/?id=962484429")
vip:AddLine()
vip:AddLabelMiddle("Key")
vip:AddTextbox("Password", "Enter the VIP key. Check info for more help.", true, function(pass)-- TextBox Example ("Title", "Description", debeautiful, callback)
if pass ~= "SynaD0S" then
         SynixWare:AddNotification("Incorect.", "Okay.")
         else
       SynixWare:AddNotification("Welcome!", "Epic!")
       vip:AddLine()
       vip:AddLabelMiddle("Welcome " .. game.Players.LocalPlayer.DisplayName)
       vip:AddButton("Candy Crown", "10k Credits.",
    function()
               local args = {
    [1] = 66,
    [2] = "Knife Skins",
    [3] = "Winter Gift"
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))

end)

vip:AddButton("Royal Red.", "10k Credits.",
    function()
                 local args = {
    [1] = 66,
    [2] = "Chair Skins",
    [3] = "Winter"
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
    end)
    vip:AddButton("Antlers", "10k Credits.",
    function()
         local args = {
    [1] = 66,
    [2] = "Accessories",
    [3] = "Knife Antlers"
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
    end)
    vip:AddButton("/e rain", "3 Credits.",
    function()
                local args = {
    [1] = 66,
    [2] = "Animations",
    [3] = "Exclusive"
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args)) 
    end)
        end
end)

-------------------
local changelog = win:Tab("Change Log", "http://www.roblox.com/asset/?id=6031075938")

changelog:AddLine()
-------------------
local oth = win:Tab("Others", "http://www.roblox.com/asset/?id=7468828225")
oth:AddLine()
oth:AddLabelMiddle("Screen")
oth:AddToggle("Night Vision", "You can see even if someone shoots in secret. (Who did it & BreakingPoint)",false, function(nv)
            function empty() end
            if nv == true then
function GetNightVision()
    for i, v in pairs(getgc(true)) do
         if type(v) == "table" and rawget(v, "serverkeycomp") then
            v.listens.nightvision()
             v.listens.nightvision = empty
        end
    end
end
else
    
end
GetNightVision()
end)
oth:AddTextbox("Custom Cursor", "Put the Asset ID of the cursor.",false, function(cursorc)
    local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
mouse.Icon = "rbxassetid://"..cursorc
end)
oth:AddButton("Old Console", "Load the old console.", function()
           SynixWare:AddNotification("Hold on bro.", "Gotchu.")
        local _, str = pcall(function()
		return game:HttpGet("https://gist.githubusercontent.com/luatsuki/a1b48e02d5710ebff8fe1ffb1fc5ea38/raw/055143d9238eb6645fbb1f5c4a9a0122ca90c8f4/Console", true)
	end)

	local s, e = loadstring(str)
	if typeof(s) ~= "function" then
		return
	end

	local success, message = pcall(s)
	if (not success) then
		if printconsole then
			printconsole(message)
		elseif printoutput then
			printoutput(message)
		end
	end
	wait(1)
	SynixWare:AddNotification("Press F9 to open the console.", "Ight.")
end)
oth:AddLine()
oth:AddLabelMiddle("Arcade")
oth:AddButton("Win arcade.", "Not 100% accurate.", function()
     local Arcade = workspace.arcade 
local Object = Arcade.screen.SurfaceGui.stacker.box

local PlayButton = Arcade.button2 
local StartButton = Arcade.button1

fireclickdetector(StartButton.ClickDetector)
Object:GetPropertyChangedSignal('Position'):Connect(function()
    if Object.AbsolutePosition.X == 140 then 
        fireclickdetector(PlayButton.ClickDetector)
    end
end)
end)
oth:AddLine()
oth:AddLabelMiddle("UntradeBan")
oth:AddButton("UntradeBan","Spam the first button or watch a youtube video.",function()
            local Material = loadstring(game:HttpGet('https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua'))()

local UI = Material.Load({
     Title = "Remake by DD0S",
     Style = 1,
     SizeX = 200,
     SizeY = 160,
     Theme = "Dark",
      ColorOverrides = {
        MainFrame = Color3.fromRGB(2, 2, 2)
      }

    })
local Page = UI.New({
    Title = "Fixed Untrade ban gui"
})

 Page.Button({
        Text = "Make the server lag!",
        Callback = function()
    _G.Loopname = true
    while _G.Loopname do
    wait(0.3)
   for i,v in pairs(workspace:GetDescendants()) do
            if v:IsA("ClickDetector") then
                fireclickdetector(v)
            end
end
    end
end
})

Page.Button({
        Text = "Stop it.",
        Callback = function()
    _G.Loopname = false
    while _G.Loopname do
    wait(0.3)
   for i,v in pairs(workspace:GetDescendants()) do
            if v:IsA("ClickDetector") then
                fireclickdetector(v)
            end
end
    end
end
})
end)
oth:AddLine()
oth:AddLabelMiddle("CMDS")
oth:AddLabel("1")
oth:AddButton("Infinite Yield","The best.",function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)
oth:AddLabel("2")
oth:AddButton("CMD-X","Second best script.",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
end)
oth:AddLabel("3")
oth:AddButton("Fate's Admin","Use it if you want.",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
    end)
oth:AddLine()
oth:AddLabelMiddle("Extra")
oth:AddToggle("Buy credits.","It cost robux but it works.",false,function()
    if game.Players.LocalPlayer.PlayerGui.ScreenGui.credits.Visible ~= true then
       game.Players.LocalPlayer.PlayerGui.ScreenGui.credits.Visible = true 
elseif
    game.Players.LocalPlayer.PlayerGui.ScreenGui.credits.Visible ~= false then
        game.Players.LocalPlayer.PlayerGui.ScreenGui.credits.Visible = false
        end
end)

-------------------
local par = win:Tab("Partners", "http://www.roblox.com/asset/?id=6827232883")

par:AddLine()

par:AddLabelMiddle("Partners!")

par:AddLine()
par:AddLabelbox("1- Jaxister Family")
par:AddLabel("https://discord.gg/sEXMkHnKjy")
par:AddLine()
par:AddLabelbox("CtrIsunshine, C8qe, Vampi & Xander.")
par:AddLine()
-------------------
local help = win:Tab("Help & Info", "http://www.roblox.com/asset/?id=291688285")

help:AddLine()
-------------------
local dev = win:Tab("Developer", "http://www.roblox.com/asset/?id=5217928125")
dev:AddTextbox("Access to the dev module.", "The password system is broken.", false, function(deve)
    if deve == "123" then
        dev:AddToggle("DEBUG","LAGS",false, function(de)
local Players = game:GetService("Players")
 
Players.PlayerAdded:Connect(function(player)
	print(player.Name .. " joined the game!")
end)
 
Players.PlayerRemoving:Connect(function(player)
	print(player.Name .. " left the game!")
end)
        end)
    end
end)

local A = win:Tab("Game & Player INFO", "http://www.roblox.com/asset/?id=1510598093")
A:AddLabelMiddle("Workspace")
A:AddLabelbox("DistributedGameTime: " .. game.Workspace.DistributedGameTime)
A:AddLabelbox("Gravity: " .. game.Workspace.Gravity)
A:AddLabelbox("FilteringEnabled: True")
A:AddLabelbox("StreamingEnabled: False")
A:AddLabelbox("AllowThirdPartySales: False")
A:AddLine()
A:AddLabelMiddle("Local Player")
A:AddLabelbox("Username: ".. game.Players.LocalPlayer.Character.Name)
A:AddLabelbox("DisplayName: ".. game.Players.LocalPlayer.Character.Humanoid.DisplayName)
A:AddLabelbox("WalkSpeed: ".. game.Players.LocalPlayer.Character.Humanoid.WalkSpeed)
A:AddLabelbox("JumpPower: ".. game.Players.LocalPlayer.Character.Humanoid.JumpPower)
A:AddLabelbox("DataCost: ".. game.Players.LocalPlayer.Character.DataCost)
A:AddLabelbox("MaxHealth: ".. game.Players.LocalPlayer.Character.Humanoid.MaxHealth)
A:AddLabelbox("Health: ".. game.Players.LocalPlayer.Character.Humanoid.Health)
A:AddLabelbox("Dname: ".. game.Players.LocalPlayer.Character.Humanoid.Name)
A:AddLine()

A:AddTextbox("Print()", "Print something.",false, function(print232)
print(print232)
 toClipboard(print232)
end)
