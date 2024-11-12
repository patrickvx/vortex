local keySystem = {}

function keySystem:checkHWID(hwid : string)
return true
end

function keySystem:copyLink(hwid : string)
local url = ""
  setclipboard(url .. "?hwid=" .. hwid)
end
