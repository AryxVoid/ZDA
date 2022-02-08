local util = {}
local zday = {}

zday.client = {}

--init player
ws = game.Workspace
players = game:GetService'Players'
myname = players.LocalPlayer.Name
myid = players.LocalPlayer.UserId





util.info = {
   version = "Z_0.0.1",
   patched = "Z_0.0.0",
   myuser = myname,
   myuserid = myid
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

zday.client.init = function(game)
   if util.precheck() then
       print('Test')
   end
end




return zday
