local util = {}
local zday = {}

--client stuff

zday.client = {}
zday.client.cmds = {}

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
zdayuser = players.LocalPlayer
myname = players.LocalPlayer.Name
myid = players.LocalPlayer.UserId



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
   error('Error could not load due to exploit function missing [readfile or isfile]')
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


zday.client.init = function()
   if util.precheck() then
       print('Zero Day Loaded, Using Prefix: ['.._G.settings.prefix..']')
       wait()

zday.client.cmds.test = function()
        print("Hello World, "..util.info.adminname.."  Working...")
end
  
zday.client.cmds.spf = function(origin,args)
   local newprefixinfo = args[1]
   _G.settings.prefix = newprefixinfo
   print("Saved new prefix to, ".. _G.settings.file.." ")
   util.saveSettings()
end
  
zday.client.cmds.pf = function(origin,args)
   print("Current prefix:  ".. _G.settings.prefix.." ")
end
  
zday.client.cmds.goto = function(origin,args)
    for i, player in pairs(args) do
        local playerto = args[1]

        if playerto  then
            local totpto = util.finduser(playerto)

            if totpto  then
            HumanoidRootPart.CFrame =  totpto.Character.HumanoidRootPart.CFrame * CFrame.new(0, 4, 0)
            else
                if not totpto then
                    warn("The Player "..player.." Was Not Found!")
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
            else
                if not totpto then
                    warn("The Player "..player.." Was Not Found!")
                end
            end

        end

    end
end
zday.client.cmds.unview = function(origin,args)
    game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Head
end
  
zday.client.cmds.edit = function(origin, args)
     local setting = args[1]
     local state = args[2]
     _G.settings[setting] = state
     warn('Edited setting: '..setting..' Changed value to : '..state
     util.saveSettings()
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
        zday.client.cmds[cmdName](plr,args)

    end
end)
   end
end




return zday
