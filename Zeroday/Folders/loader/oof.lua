local util = {}
local zday = {}

zday.client = {}
zday.client.cmds = {}

--init player
ws = game.Workspace
players = game:GetService'Players'
zdayuser = players.LocalPlayer
myname = players.LocalPlayer.Name
myid = players.LocalPlayer.UserId





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
    prefix = getgenv().prefix,
}



util.precheck = function()
    repeat wait() until game:IsLoaded()
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
       print('Zero Day Loaded, Using Prefix: ['..util.data.prefix..']')
       wait()

zday.client.cmds.test = function()
        print("Hello World, "..util.info.adminname.."  Working...")
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

zdayuser.Chatted:Connect(function(msg,recipient)
    msg = string.lower(msg)

    local splitString = msg:split(" ") 
    local slcmd = splitString[1]
    local cmd = slcmd:split(util.data.prefix) 
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
