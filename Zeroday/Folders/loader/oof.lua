local util = {}
ws = game.Workspace

util.info = {
   players = game:GetService'Players',
   user = players.LocalPlayer,
   currentuser = user.Name,
   version = "Z_0.0.1"
   patched = "Z_0.0.0"
}



util.data = {
    placeid = game.PlaceId,
    prefix = getgenv().prefix
    sendlogs = getgenv().settings['log']
}

