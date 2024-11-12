local baseURL = "https://raw.githubusercontent.com/patrickvx/vortex/refs/heads/main/"

local function loadModule(path : string)
  return loadstring(game:HttpGet(baseURL .. path))()
end
