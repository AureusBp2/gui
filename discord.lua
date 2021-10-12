

--[[
local serv = win:Server("DD0S", "")

local btns = serv:Channel("Buttons")

btns:Button(
    "Kill all",
    function()
        DiscordLib:Notification("Notification", "Killed everyone!", "Okay!")
    end
)

btns:Seperator()

btns:Button(
    "Get max level",
    function()
        DiscordLib:Notification("Notification", "Max level!", "Okay!")
    end
)

local tgls = serv:Channel("Toggles")

tgls:Toggle(
    "Auto-Farm",
    false,
    function(bool)
        print(bool)
    end
)

local sldrs = serv:Channel("Sliders")

local sldr =
    sldrs:Slider(
    "Slide me!",
    0,
    1000,
    400,
    function(t)
        print(t)
    end
)

sldrs:Button(
    "Change to 50",
    function()
        sldr:Change(50)
    end
)

local drops = serv:Channel("Dropdowns")

local drop =
    drops:Dropdown(
    "Pick me!",
    {"Option 1", "Option 2", "Option 3", "Option 4", "Option 5"},
    function(bool)
        print(bool)
    end
)

drops:Button(
    "Clear",
    function()
        drop:Clear()
    end
)

drops:Button(
    "Add option",
    function()
        drop:Add("Option")
    end
)

local clrs = serv:Channel("Colorpickers")

clrs:Colorpicker(
    "ESP Color",
    Color3.fromRGB(255, 1, 1),
    function(t)
        print(t)
    end
)

local textbs = serv:Channel("Textboxes")

textbs:Textbox(
    "Gun power",
    "Type here!",
    true,
    function(t)
        print(t)
    end
)

local lbls = serv:Channel("Labels")

lbls:Label("This is just a label.")

local bnds = serv:Channel("Binds")

bnds:Bind(
    "Kill bind",
    Enum.KeyCode.RightShift,
    function()
        print("Killed everyone!")
    end
)
]]--

local DiscordLib =
    loadstring(game:HttpGet"https://pastebin.com/raw/WeLA0ip9")()

local win = DiscordLib:Window("Breaking Point library")
DiscordLib:Notification("Note:", "The UI is developement! You can suggest us scripts to add to the gui by joining our support discord server! Link in the info channel.", "I understand.")
game.StarterGui:SetCore("SendNotification", {Title = "BP1 Library", Text = "Loaded successfully!", Icon = "rbxassetid://7681420911", Duration = 5, Button1 = "Okay"})
local serv = win:Server("DD0S", "http://www.roblox.com/asset/?id=2530517466")

local btns = serv:Channel("Kill Scripts")
btns:Seperator()
btns:Label("Using the scripts bellow won't get you trade banned!")
btns:Bind(
    "Kill Current Player",
    Enum.KeyCode.RightShift,
    function()
       for i,v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            if game.Workspace:FindFirstChild(v.Name) then
                if game.Workspace[v.Name].Humanoid.Sit ~= true then
                    if game.Workspace[v.Name]:FindFirstChild("Blade") then
                        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(37, CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)), Vector3.new(v.Character.Head.CFrame.x, 4, v.Character.Head.CFrame.z), Vector3.new(0, 0, 0))
                        wait(.1)
                        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(43, v.Character.Head, v, "IIlIla", true)
                    else
                        if v.Backpack:FindFirstChild("Blade") then
                            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(37, CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)), Vector3.new(v.Character.Head.CFrame.x, 4, v.Character.Head.CFrame.z), Vector3.new(0, 0, 0))
                            wait(.1)
                            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(43, v.Character.Head, v, "IIlIla", true)
                        end
                    end
                end
            end
        end
    end
    end
)
btns:Button(
    "Hitboxes (6,6,6)",
    function()
 for _, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= game:GetService("Players").LocalPlayer.Name then
     v.Character.Head.CanCollide = false
     v.Character.Head.Size = Vector3.new(6, 6, 6)
     v.Character.Head.Transparency = 1
   end
 end
   end)
btns:Button(
    "Universal Hitboxes Script",
    function()
        DiscordLib:Notification("Just like that", "I stole this script, I was too lasy.", "Ok retard")
        loadstring(game:HttpGet("http://gameovers.net/Scripts/Free/HitboxExpander/main.lua", true))()
    end
)
btns:Button(
    "Auto throw {beta}",
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
btns:Seperator()
btns:Label("Using the scripts bellow will get you trade banned!")
btns:Button(
    "Alway Hit and Kill Aura",
function()
    loadstring(game:HttpGet('https://pastebin.com/raw/TqPihvFD', true))()
    end
)

local tgls = serv:Channel("Gun Scripts")

tgls:Toggle(
    "Kill all gun / Credits Script",
    false,
    function(bool)
        wait()
   game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "public")
   wait()
   for i,v in pairs(game.Players:GetPlayers()) do
       if v.Name == game.Players.LocalPlayer.Name then
           else
           game:GetService("ReplicatedStorage").RemoteEvent:FireServer(30, v)
          
       end
   end

    end
)

tgls:Button(
    "Gun Slinger",
    function(bool)
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
end
    )
local player1 = serv:Channel("Player")
player1:Label("Player Settings GUI")
player1:Button(
    "Settings",
    function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/LOOF-sys/Roblox-Shit/main/BreakingPoint.lua",true))()
    end)
player1:Seperator()
player1:Label("Info/Light for more information")
player1:Button(
    "Destroy Player Torso Light",
    function()
local player = game.Players.LocalPlayer.Name
            game.Workspace:FindFirstChild(player).Torso.PointLight:Destroy()
end
)
player1:Seperator()
player1:Label("FE FLIP (Keybinds: Z,X,C)")
player1:Button(
    "FE FLIP",
    function()
        loadstring(game:HttpGet("https://pastebin.com/raw/NSfxNDBg", true))()
    end)
player1:Seperator()
player1:Label("You won't get kicked for being AFK.")
player1:Button(
    "Anti Idle",
    function()
        DiscordLib:Notification('Anti Idle','Anti idle is enabled', "Perfect")
	local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   end)
end
)
player1:Seperator()
player1:Label('Execute when it says "beggining game."')
player1:Button(
    "FE invisible",
    function()
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
local drops = serv:Channel("Dropdowns")

local drop =
    drops:Dropdown(
    "Pick me!",
    {"Option 1", "Option 2", "Option 3", "Option 4", "Option 5"},
    function(bool)

    end
)

drops:Button(
    "Clear",
    function()
        drop:Clear()
    end
)

drops:Button(
    "Add option",
    function()
        drop:Add("Option")
    end
)

local clrs = serv:Channel("Colorpickers")

clrs:Colorpicker(
    "ESP Color",
    Color3.fromRGB(255, 1, 1),
    function(t)
        print(t)
    end
)

local textbs = serv:Channel("Textboxes")

textbs:Textbox(
    "Gun power",
    "Type here!",
    true,
    function(t)
        print(t)
    end
)

local lbls = serv:Channel("Labels")

lbls:Label("This is just a label.")

local bnds = serv:Channel("Binds")

bnds:Bind(
    "Put afk mode",
    Enum.KeyCode.RightShift,
    function()
game.Players.VampIsMyGod.settings.Afk.Value = not 
game.Players.VampIsMyGod.settings.Afk.Value
    end
)
bnds:Bind(
    "Break the light.",
    Enum.KeyCode.RightShift,
    function()
      -- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = 45,
    [2] = nil --[[Vector3]]
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
  
    end
)
---
local serv2 = win:Server("Others", "http://www.roblox.com/asset/?id=966818843")
local textbs = serv2:Channel("Screen")
textbs:Button(
    "Night Vision",
    function()
        function empty() end
function GetNightVision()
    for i, v in pairs(getgc(true)) do
         if type(v) == "table" and rawget(v, "serverkeycomp") then
            v.listens.nightvision()
             v.listens.nightvision = empty
        end
    end
end

GetNightVision()
    end
)
textbs:Textbox(
    "Custom Crossair AssetID",
    "asset ID",
    true,
 function(cursorc)
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local char
local canMove = true
repeat 
	wait()
	char = plr.Character
until char~=nil
mouse.Icon= 'http://www.roblox.com/asset/?id=' cursorc();
mouse.Move:connect(function()
	circle.Position = Vector3.new(mouse.Hit.p.X,mouse.Target.Position.Y,mouse.Hit.p.Z)
	if(char.Torso.Position-mouse.Hit.p).Magnitude>=50 then
		circle.Transparency=1
		mouse.Icon= 'http://www.roblox.com/asset/?id='..cursorc()
		canMove=false
	else
		circle.Transparency=0
		mouse.Icon= 'http://www.roblox.com/asset/?id='..cursorc()
		canMove=true
end
end)
end)
textbs:Label("ASSET ID'S AREN'T IN THE LINK! (check the /info/ channel!)")
textbs:Button(
    "Examples",
    function()
function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		DiscordLib:Notification('Examples','https://docs.google.com/spreadsheets/d/1p_zecs1MGUHfrOfs7XA82nJt0CJZdLHn3-xvMaKFG6Y/edit#gid=566038028 (Link copied in your ClipBoard.)', 'Thanks!')
	else
		DiscordLib:Notification("Clipboard","Your exploit doesn't have the ability to use the clipboard", "Bruh")
	end
end
        toClipboard('https://docs.google.com/spreadsheets/d/1p_zecs1MGUHfrOfs7XA82nJt0CJZdLHn3-xvMaKFG6Y/edit#gid=566038028')
        end)
textbs:Button(
    "Old Console",
    function()
        DiscordLib:Notification("Wait-", "Hold on bro", "Sure?")
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
	DiscordLib:Notification("Old Console?", "Press F9 to open the console.", "Hot Shit")
   end
)

btns:Seperator()

textbs:Button(
    "Buy Credits Open/Close",
    function()
    game.Players.LocalPlayer.PlayerGui.ScreenGui.credits.Visible = not 
    game.Players.LocalPlayer.PlayerGui.ScreenGui.credits.Visible
end
)
local bs = serv2:Channel("Arcade")

bs:Button(
    "Arcade Win (No't 100% accurate)",
    function()
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
    end
    )
local bs2 = serv2:Channel("UnTrade Ban")

bs2:Button(
    "Spam the server lag button.",
    function()
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
    end
    )
local bs3 = serv2:Channel("CMDS")
bs3:Seperator()
bs3:Button(
    "Infinite Yield",
    function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end)
    bs3:Seperator()
bs3:Button(
    "CMD-X",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
    end)
bs3:Seperator()
bs3:Button(
    "Fate's Admin",
    function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
    end)
bs3:Seperator()
local bs4 = serv2:Channel("Players")
bs4:Button(
    "Arrow",
    function()
        
        end)
---
local serv3 = win:Server("Info", "http://www.roblox.com/asset/?id=291688285")
local infoe = serv3:Channel("Credits")
infoe:Label("Thanks to:")
infoe:Label("BlueCage for his broken game.")
infoe:Label("CtrIsunshine for moral support and more!")
infoe:Label("Landen just because he's my friend.")
infoe:Label("Alex for making bp1 but better.")
infoe:Label("And you for using this UI!!")
infoe:Label("You can crack this bullshit gui idc.")
local info1 = serv3:Channel("Discord")
info1:Label("Support Server")
info1:Button(
    "Discord Invite",
    function()
  	local http = game:GetService('HttpService') 
	if toClipboard then
		toClipboard('https://discord.com/invite/fJSuja72bk')
		info1:Notification('Discord Invite', 'Copied to clipboard!\ndiscord.gg/fJSuja72bk', 'Okay!')
	else
		DiscordLib:Notification('Discord Invite', 'discord.gg/fJSuja72bk', 'Okay!')
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
    end
)
local info1 = serv3:Channel("---------------------------")
local info2 = serv3:Channel("Crossair/Cursor")
info2:Label("Help with the AssetID.")
info2:Button(
    "Custom Crossair",
    function()
        function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		DiscordLib:Notification('Help (Custom Crossair)','Watch the youtube video. Link copied in your clipboard', 'Thanks!')
	else
		DiscordLib:Notification("Clipboard","Your exploit doesn't have the ability to use the clipboard", "Bruh")
	end
end
        toClipboard('https://www.youtube.com/watch?v=-immkhRI2Vk&t=63s')
        
    end
    )
local info3 = serv3:Channel("Light")
info3:Label("(Server) It destroys the light in your torso, nobody can see")
info3:Label("the light anymore!")
local info4 = serv3:Channel("KeyBinds")
info4:Seperator()
info4:Label("Break the Light Bind")
info4:Label("It breaks the light when you press the keybind!")
info4:Seperator()
info4:Label("Put AFK Mode Bind.")
info4:Button(
    "Help",
    function()
DiscordLib:Notification("Help", "The reminder won't appear but you're on afk mode.", "Okay!")
end)
info4:Seperator()
local serv4 = win:Server("CtrIsunshine", "http://www.roblox.com/asset/?id=962484429")
local textbs = serv4:Channel("VIP Access")
textbs:Label("Your Key:")
textbs:Label(string.char(math.random(32,126))..string.char(math.random(32,126))..string.char(math.random(32,126))..string.char(math.random(32,126))..string.char(math.random(32,126))..string.char(math.random(32,126)))
textbs:Seperator()
textbs:Label("DM DD0S#7777 for the VIP")
local textbs1 = serv4:Channel("VIP")
textbs1:Label("Welcome.")
textbs1:Button(
    "Anti Hit & Shit",
    function()
        loadstring(game:GetObjects("rbxassetid://7228968882")[1].Source)()
    end)
textbs1:Label("Local script other players dont see this)")
textbs1:Button(
    "In testing (preview)",
    function()
        loadstring(game:HttpGet("https://pastebin.com/raw/fa2K9am2"))();
    end)
textbs1:Button(
        "M4A1",
        function()
           loadstring(game:HttpGet("https://pastebin.com/raw/7BgiVjg8"))(); 
        end)
textbs1:Button(
    "Simpatizer",
    function()
        loadstring(game:HttpGet("https://pastebin.com/raw/XCZ5tjeh"))(); 
    end)
    textbs1:Button(
    "Sword",
    function()
        loadstring(game:HttpGet("https://pastebin.com/raw/e3eBurhp"))(); 
    end)
    
local serv5 = win:Server("Main Changelog", "http://www.roblox.com/asset/?id=6031075938")
local serv6 = win:Server("List", "http://www.roblox.com/asset/?id=6827232883")
local serv7 = win:Server("Developer", "http://www.roblox.com/asset/?id=5217928125")

local textbs = serv7:Channel("Member Access")
textbs:Textbox(
    "Password",
    "Type here",
    true,
 function(pass)
        DiscordLib:Notification("Access Denied", "Incorrect Password", "Go back-")
    end
)
local serv8 = win:Server("VIP+", "http://www.roblox.com/asset/?id=3473746470")
local vip1 = serv8:Channel("Welcome")
vip1:Label("You have access to the `Items giver channel`")
local vip2 = serv8:Channel("Items Giver")

vip2:Label("1 Credit")
vip2:Button(
    "/e Rain",
    function()
        local args = {
    [1] = 66,
    [2] = "Animations",
    [3] = "Exclusive"
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
DiscordLib:Notification("Success", "You lost 1 Credit but you recieved a /e Rain", "Ok.")
end    
)

vip2:Seperator()

vip2:Label("10 000 Credits")
vip2:Button(
    "Antlers (Accessory)",
    function()
local args = {
    [1] = 66,
    [2] = "Accessories",
    [3] = "Knife Antlers"
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
DiscordLib:Notification("Success", "You lost 10 000 Credits but you recieved a Accessory", "Ok.") 
end
)

vip2:Seperator()

vip2:Label("10 000 Credits")
vip2:Button(
    "Candy Crown",
    function()
        local args = {
    [1] = 66,
    [2] = "Knife Skins",
    [3] = "Winter Gift"
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
DiscordLib:Notification("Success", "You lost 10 000 Credits but you recieved a Candy Crown", "Ok.")
end
)

vip2:Seperator()

vip2:Label("10 000 Credits")
vip2:Button(
    "Royal Red",
    function()
        local args = {
    [1] = 66,
    [2] = "Chair Skins",
    [3] = "Winter"
}

game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
DiscordLib:Notification("Success", "You lost 10 000 Credits but you recieved a Royal Red", "Ok.")
end
)
