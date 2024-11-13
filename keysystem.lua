local keySystem = {}

-- Plato configuration
local accountId = 99716; -- Plato account id [IMPORTANT]
local allowPassThrough = false; -- Allow user through if error occurs, may reduce security
local allowKeyRedeeming = false; -- Automatically check keys to redeem if valid
local useDataModel = false;

-- Plato callbacks
local onMessage = Instance.new("BindableFunction")
keySystem.onMessage = onMessage

-- Plato internals [START]
local fRequest, fStringFormat, fSpawn, fWait = request or http.request or http_request or syn.request, string.format, task.spawn, task.wait;
local localPlayerId = game:GetService("Players").LocalPlayer.UserId;
local rateLimit, rateLimitCountdown, errorWait = false, 0, false;
-- Plato internals [END]

-- Plato global functions [START]
function keySystem.getLink()
	return fStringFormat("https://gateway.platoboost.com/a/%i?id=%i", accountId, localPlayerId);
end;

function keySystem.verify(key)
	if errorWait or rateLimit then 
		return false;
	end;

	onMessage:Invoke("Checking key...");

	if (useDataModel) then
		local status, result = pcall(function() 
			return game:HttpGetAsync(fStringFormat("https://api-gateway.platoboost.com/v1/public/whitelist/%i/%i?key=%s", accountId, localPlayerId, key));
		end);

		if status then
			if string.find(result, "true") then
				onMessage("Successfully whitelisted!");
				return true;
			elseif string.find(result, "false") then
				if allowKeyRedeeming then
					local status1, result1 = pcall(function()
						return game:HttpPostAsync(fStringFormat("https://api-gateway.platoboost.com/v1/authenticators/redeem/%i/%i/%s", accountId, localPlayerId, key), {});
					end);

					if status1 then
						if string.find(result1, "true") then
							onMessage:Invoke("Successfully redeemed key!");
							return true;
						end;
					end;
				end;

				onMessage:Invoke("Key is invalid!");
				return false;
			else
				return false;
			end;
		else
			onMessage:Invoke("An error occured while contacting the server!");
			return allowPassThrough;
		end;
	else
		local status, result = pcall(function() 
			return fRequest({
				Url = fStringFormat("https://api-gateway.platoboost.com/v1/public/whitelist/%i/%i?key=%s", accountId, localPlayerId, key),
				Method = "GET"
			});
		end);

		if status then
			if result.StatusCode == 200 then
				if string.find(result.Body, "true") then
					onMessage:Invoke("Successfully whitelisted key!");
					return true;
				else
					if (allowKeyRedeeming) then
						local status1, result1 = pcall(function() 
							return fRequest({
								Url = fStringFormat("https://api-gateway.platoboost.com/v1/authenticators/redeem/%i/%i/%s", accountId, localPlayerId, key),
								Method = "POST"
							});
						end);

						if status1 then
							if result1.StatusCode == 200 then
								if string.find(result1.Body, "true") then
									onMessage:Invoke("Successfully redeemed key!");
									return true;
								end;
							end;
						end;
					end;

					return false;
				end;
			elseif result.StatusCode == 204 then
				onMessage:Invoke("Account wasn't found, check accountId");
				return false;
			elseif result.StatusCode == 429 then
				if not rateLimit then 
					rateLimit = true;
					rateLimitCountdown = 10;
					fSpawn(function() 
						while rateLimit do
							onMessage:Invoke(fStringFormat("You are being rate-limited, please slow down. Try again in %i second(s).", rateLimitCountdown));
							fWait(1);
							rateLimitCountdown = rateLimitCountdown - 1;
							if rateLimitCountdown < 0 then
								rateLimit = false;
								rateLimitCountdown = 0;
								onMessage:Invoke("Rate limit is over, please try again.");
							end;
						end;
					end); 
				end;
			else
				return allowPassThrough;
			end;    
		else
			return allowPassThrough;
		end;
	end;
end;
-- Plato global functions [END]

return keySystem
