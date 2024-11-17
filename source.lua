local baseURL = "https://raw.githubusercontent.com/patrickvx/vortex/refs/heads/main/"

local function loadModule(path : string)
	return loadstring(game:HttpGet(baseURL .. path))()
end

local keySystem = loadModule("keysystem.lua")
local ui = loadModule("ui.lua")
local syntaxHighlighter = loadModule("syntaxhighlighter.lua")

local mainUI = ui.loadMain()

local gui = ui["gui"]
local codeEditor = mainUI.CodeEditor
local editorSF = mainUI.EditorSF
local linesSF = mainUI.LinesSF
local lineCounter = mainUI.LinesLabel
local codePreview = mainUI.CodePreview
local executeButton = mainUI.ExecuteButton
local clearButton = mainUI.ClearButton
local copyButton = mainUI.CopyButton
local closeButton = mainUI.CloseButton

editorSF.Changed:Connect(function()
	linesSF.CanvasPosition = editorSF.CanvasPosition
end)

local errorHighlight

local function getLineIndex(cursorPos: number)
	if cursorPos == -1 then
		return -1
	end

	local source = codeEditor.Text
	local lineCount = 1

	for i = 1, cursorPos do
		if source:sub(i, i) == "\n" and i ~= cursorPos then
			lineCount += 1
		end
	end

	return lineCount
end

local textChanged = 0
local errorThreshold = 2

local function checkForErrors()
	local source = codeEditor.Text
	
	if source ~= "" then
		local _, loadError = loadstring(source)

		if loadError then
			local lineIndex = tonumber(loadError:match(":(%d+):"))
			if lineIndex then
				return lineIndex, loadError
			end
		end
	end
end

local function highlightError(lineIndex)
	if errorHighlight then
		errorHighlight:Destroy()
	end

	local source = codeEditor.Text
	local textSizeY = game:GetService("TextService"):GetTextSize("", codeEditor.TextSize, codeEditor.Font, Vector2.new(math.huge, math.huge)).Y
	local linePosY = textSizeY * (lineIndex - 1)
	local lines = source:split("\n")
	local lineText = lines[lineIndex]

	errorHighlight = Instance.new("Frame")
	errorHighlight.Parent = editorSF
	errorHighlight.Size = UDim2.new(0, codeEditor.AbsoluteSize.X, 0, textSizeY)
	errorHighlight.Position = UDim2.new(0, 0, 0, linePosY)
	errorHighlight.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	errorHighlight.BackgroundTransparency = 0.5
	errorHighlight.BorderSizePixel = 0
	errorHighlight.ZIndex = 0
end

local function updateLines(currentLine)
	local source = codeEditor.Text
	local lines = source:split("\n")
	local newText = ""

	for i = 1, #lines do
		if i == currentLine then
			newText ..= "<b>" .. i .. "</b>\n"
		else
			newText ..= "<font color='#aaa'>" .. i .. "</font>\n"
		end
	end

	lineCounter.Text = newText
end

codeEditor.Changed:Connect(function(prop)
	if prop == "Text" then
		local lineIndex = getLineIndex(codeEditor.CursorPosition)
		updateLines(lineIndex)
		codePreview.Text = syntaxHighlighter.highlight(syntaxHighlighter.escapeTags(codeEditor.Text))
		if errorHighlight then
			errorHighlight:Destroy()
		end
		textChanged = tick()
		local errorLine, errorMsg = checkForErrors()
		if errorLine then
				print(errorLine)
			wait(errorThreshold)
			if checkForErrors() == errorLine and math.round(tick() - textChanged) == math.round(errorThreshold) then
				highlightError(errorLine)
			end
		end
	elseif prop == "CursorPosition" then
		local lineIndex = getLineIndex(codeEditor.CursorPosition)
		updateLines(lineIndex)
	end
end)

codePreview.Text = syntaxHighlighter.highlight(codePreview.Text)

codeEditor.Focused:Connect(function()
	codePreview.Visible = false
end)

codeEditor.FocusLost:Connect(function()
	codePreview.Visible = true
end)

lastNotification = 0

game.LogService.MessageOut:Connect(function(msg, msgType)
	if tick() - lastNotification >= 0.1 then
		lastNotification = tick()
		
		local bindable = Instance.new("BindableFunction")
	
		bindable.OnInvoke = function(response)
			if response == "Open console" then
				game.StarterGui:SetCore("DevConsoleVisible", true)
			end
		end
		
		game.StarterGui:SetCore("SendNotification", {
			Title = msgType.Name:sub(8),
			Text = msg,
			Duration = 5,
			Button1 = "Open console",
			Button2 = "Close",
			Callback = bindable
		})
	end
end)

executeButton.MouseButton1Click:Connect(function()
	local source = codeEditor.Text
	if source ~= "" then
		local errorLine, errorMsg = checkForErrors()
		if errorLine then
			local textSizeY = game:GetService("TextService"):GetTextSize("", codeEditor.TextSize, codeEditor.Font, Vector2.new(math.huge, math.huge)).Y
			local linePosY = textSizeY * (errorLine - 1)
			game.TweenService:Create(editorSF, TweenInfo.new(0.3), {CanvasPosition = Vector2.new(0, (linePosY - (editorSF.AbsoluteSize.Y / 2) - (textSizeY / 2)))}):Play()
		end
		if errorMsg then
			error(errorMsg)
		end
		loadstring(source)()
	end
end)

clearButton.MouseButton1Click:Connect(function()
	codeEditor.Text = ""
end)

copyButton.MouseButton1Click:Connect(function()
	setclipboard(codeEditor.Text)
end)

closeButton.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

print(keySystem.verify("test123"))
setclipboard(keySystem.getLink())
ui.loadKS()
