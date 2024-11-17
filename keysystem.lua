local keySystem = {}

keySystem.isKeyless = false

local accountId = 99714

local fRequest, fStringFormat, fSpawn, fWait = request or http.request or http_request or syn.request, string.format, task.spawn, task.wait;
local localPlayerId = game:GetService("Players").LocalPlayer.UserId;
local rateLimit, rateLimitCountdown, errorWait = false, 0, false;

function keySystem.getLink()
	return fStringFormat("https://gateway.platoboost.com/a/%i?id=%i", accountId, localPlayerId);
end; 

function keySystem.verify(key)
    local url = string.format("https://api-gateway.platoboost.com/v1/public/whitelist/%i/%i?key=%s", accountId, localPlayerId, key)

    local success, response = pcall(function()
        return game:HttpGet(url)
    end)

    if success then
        local data = game.HttpService:JSONDecode(response)
        if data and type(data) == "table" then
            return data.success
        end
    end
end

return keySystem
