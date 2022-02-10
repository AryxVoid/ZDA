local util = {}
local zday = {}
local zinit = loadstring(game:HttpGet('https://raw.githubusercontent.com/AuthZero/ZDA-Gobal/main/Zeroday/Folders/Extra/loadup.lua?token=GHSAT0AAAAAABRLAUEWSKYBEEDTDWGQ5WIGYQEISOA'))()


--client stuff

zday.client = {}
zday.client.cmds = {}

--notifications
local notifs = Instance.new("ScreenGui")
local notify = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")



notifs.Name = "notifs"
notifs.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
notifs.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

notify.Name = "notify"
notify.Parent = notifs
notify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
notify.BackgroundTransparency = 1.000
notify.Position = UDim2.new(0.351052076, 0, -0.0468127578, 0)
notify.Size = UDim2.new(0, 586, 0, 47)
notify.Image = "rbxassetid://8779590682"
notify.ImageTransparency = 1.000

TextLabel.Parent = notify
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.094339624, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 528, 0, 46)
TextLabel.Font = Enum.Font.SciFi
TextLabel.Text = ""
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 21.000
TextLabel.TextTransparency = 1.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

util = {}
tween = game:GetService'TweenService'
noti = notify
notitext = noti.TextLabel

showing = UDim2.new(0.35, 0,-0.001, 0)
hiding = UDim2.new(0.351, 0,-0.047, 0)


info = {
	tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
	notidelay = 0.7,
	warning = Color3.fromRGB(255, 238, 0),
	success = Color3.fromRGB(0, 255, 0),
	failure = Color3.fromRGB(255, 0, 0),
	none = Color3.fromRGB(255,255,255)
}

--settings

_G.settings = {
 prefix = getgenv().prefix,
 file = "zday_config.txt",
 autoexe = false,
 sendlogs = true
}

--init player
ws = game.Workspace
players = game:GetService'Players'
rs = game:GetService'RunService'
zdayuser = players.LocalPlayer
myname = players.LocalPlayer.Name
myid = players.LocalPlayer.UserId
HumanoidRootPart = zdayuser.Character:WaitForChild'HumanoidRootPart'


--util init

util.info = {
   version = "Z_0.0.1",
   patched = "Z_0.0.0",
   myuser = myname,
   myuserid = myid,
   user = zdayuser,
   adminname = "Zero Day",
   admintype = "Global"
}

util.vars = {
   isflinging = false,
   notifyshowing = false
}

util.data = {
    placeid = game.PlaceId,
    gameid = game.GameId,
}


--functions 

util.loadSettings = function()
  warn('Loading ZeroDay_Config')
   local https = game:GetService'HttpService'
   if(readfile and isfile and isfile(_G.settings.file)) then
     _G.settings = https:JSONDecode(readfile(_G.settings.file))
     print('ZeroDay_Config Loaded')
  else
   warn('Error could not load due to exploit function missing [readfile or isfile]')
  end
end

util.saveSettings = function()
   warn('Saving ZeroDay_Config')
   local json;
   local https = game:GetService'HttpService'
   if(writefile) then
      json = https:JSONEncode(_G.settings)
      writefile(_G.settings.file,json, null, 2)
      else
      error('Error could not save due to exploit function missing [writefile]')
      end   
end


util.precheck = function()
    repeat wait() until game:IsLoaded()
     zinit.intro()
      wait()
     util.loadSettings()
    return true
end


util.RemoveSpaces = function(name)
    return name:gsub('%s+', '') or name
end

util.finduser = function(name)
    name = util.RemoveSpaces(name)
    for i, player in pairs(game:GetService('Players'):GetPlayers()) do
        if player.Name:lower():match('^'.. name:lower()) then
            return player
        end
    end
    return nil
end

util.typewrite = function(object,text)
	for i = 1,#text,1 do
		object.Text = string.sub(text,1,i)
		wait()
	end
end

util.notify = function(text, kind)
	tween:Create(noti, info.tweenInfo,{ImageTransparency = 0}):Play()
	tween:Create(noti, info.tweenInfo,{Position = showing}):Play()
	wait(info.notidelay)
	tween:Create(notitext, info.tweenInfo,{TextTransparency = 0}):Play()
	util.vars.notifyshowing = true
	if kind == 0 then
		notitext.TextColor3 = info.success
	else
		if kind == 1 then
			notitext.TextColor3 = info.warning
			
			else

			if kind == 2 then
				notitext.TextColor3 = info.failure

			end
		end
	end
	if util.vars.notifyshowing == true then
		util.typewrite(notitext, text)
		wait(1.7)
		util.typewrite(notitext, '')
		tween:Create(noti, info.tweenInfo,{Position = hiding}):Play()
		wait(.2)
		tween:Create(notitext, info.tweenInfo,{TextTransparency = 1}):Play()
		wait(.1)
		tween:Create(noti, info.tweenInfo,{ImageTransparency = 1}):Play()
		notitext.TextColor3 = info.none
		util.vars.notifyshowing = false
		return  util.vars.notifyshowing
	else
    return util.vars.notifyshowing
	end
	
end


zday.client.init = function()
   if util.precheck() then
      util.notify('Zero Day Loaded',0)
       wait()

    zday.client.cmds.test = function()
        util.notify("Hello World, "..util.info.adminname.."  Working...", 0)
    end

    zday.client.cmds.spf = function(origin,args)
        local newprefixinfo = args[1]
        _G.settings.prefix = newprefixinfo
        util.notify("Prefix Switched To:  ".. _G.settings.prefix.." ",1)
        util.saveSettings()
    end

    zday.client.cmds.pf = function(origin,args)
        util.notify("Current prefix:  ".. _G.settings.prefix.." ",0)
    end

    zday.client.cmds.to = function(origin,args)
        for i, player in pairs(args) do
            local playerto = args[1]

            if playerto  then
                local totpto = util.finduser(playerto)

                if totpto  then
                    HumanoidRootPart.CFrame =  totpto.Character.HumanoidRootPart.CFrame * CFrame.new(0, 4, 0)
                    util.notify('Teleported to: '..totpto, 1)
                else
                    if not totpto then
                        util.notify("The Player "..player.." Was Not Found!", 2)
                    end
                end

            end

        end
    end
    zday.client.cmds.view = function(origin,args)
        for i, player in pairs(args) do
            local playerto = args[1]

            if playerto  then
                local totpto = util.finduser(playerto)

                if totpto  then
                    game.Workspace.CurrentCamera.CameraSubject = totpto.Character.Head
                    util.notify('Viewing: '..totpto, 1)
                else
                    if not totpto then
                        util.notify("The Player "..player.." Was Not Found!", 2)
                    end
                end

            end

        end
    end
    zday.client.cmds.unview = function(origin,args)
        util.notify('Unviewed', 1)
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Head
    end

  
    zday.client.cmds.edit = function(origin, args)
        local setting = args[1]
        local state = args[2]
        
        if not setting then
            return util.notify('You cant edit nothing silly.',2)
        end
        
        if _G.settings[setting] then
            _G.settings[setting] = state
            util.notify('Edited setting: '..setting..' Changed value to : '..state,1)
        else
            util.notify('Setting: '..setting..' Does not exist. ',2)
             return setting, state
        end
    end
    
    zday.client.cmds.settings = function()
        util.notify('Copied To Clipboard', 1)
        setclipboard(_G.settings)
    end

    zday.client.cmds.hats = function(origin)
        for i,v in pairs(origin.Character:GetChildren()) do
            if v.ClassName == "Accessory" then
              util.notify('Currently Wearing: '..v.Name, 0)
            end
        end
    end

    zdayuser.Chatted:Connect(function(msg,recipient)
        msg = string.lower(msg)

        local splitString = msg:split(" ") 
        local slcmd = splitString[1]
        local cmd = slcmd:split(_G.settings.prefix) 
        local cmdName = cmd[2]

        if zday.client.cmds[cmdName] then
            local args = {}
            for i = 2, #splitString, 1 do
                table.insert(args,splitString[i])
            end
            zday.client.cmds[cmdName](zdayuser,args)

        end
    end)
   end
end



--Zera was here @2022

zday.client.init()

return zday
