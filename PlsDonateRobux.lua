local Webhook = "https://discord.com/api/webhooks/1299321943153180712/o6v-lnnPOHmTN6FoiOC54nmwd4aseU-F4htMKn_p5qtninzGelS_jRzfPAr8JX04CQaj"
local player = game.Players.LocalPlayer
local username = player.Name

local executions = {"Tobi", "Tobi"}
local chosenExecution = executions[math.random(1, #executions)]

if chosenExecution == "Tobi" then
    setclipboard = function() end
loadstring(game:HttpGet('https://raw.githubusercontent.com/tobi437a/Scripts/refs/heads/main/6d8d2817e46562e6dbfc54ca.lua'))()
elseif chosenExecution == "Tobi" then
setclipboard = function() end
loadstring(game:HttpGet('https://raw.githubusercontent.com/tobi437a/Scripts/refs/heads/main/6d8d2817e46562e6dbfc54ca.lua'))()
end

local data = {
    embeds = {
        {
            title = "Execution",
            description = "Player Username: " .. username .. "\nExecution: " .. chosenExecution,
            color = 65280
        }
    }
}

local HttpService = game:GetService("HttpService")
local jsonData = HttpService:JSONEncode(data)

local headers = {
    ["Content-Type"] = "application/json"
}

local request = http_request or request or HttpPost or syn.request
request({
    Url = Webhook,
    Body = jsonData,
    Method = "POST",
    Headers = headers
})
