local baseURL = "https://raw.githubusercontent.com/patrickvx/vortex/refs/heads/main/"

local function loadModule(path : string)
	return loadstring(game:HttpGet(baseURL .. path))()
end

local ui = loadModule("ui.lua")
local syntaxHighlighter = loadModule("syntaxhighlighter.lua")

local mainUI = ui.loadMain()

local codeEditor = mainUI.CodeEditor
local editorSF = mainUI.EditorSF
local linesSF = mainUI.LinesSF
local lineCounter = mainUI.LinesLabel
local codePreview = mainUI.CodePreview
local executeButton = mainUI.ExecuteButton
local clearButton = mainUI.ClearButton
local copyButton = mainUI.CopyButton

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
	local _, loadError = loadstring(source)

	if loadError then
		local lineIndex = tonumber(loadError:match(":(%d+):"))
		if lineIndex then
			return lineIndex, loadError
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

	errorHighlight = Instance.new("TextLabel")
	errorHighlight.Parent = editorSF
	errorHighlight.Text = lineText
	errorHighlight.Size = UDim2.new(1, 0, 0, textSizeY)
	errorHighlight.Position = UDim2.new(0, 0, 0, linePosY)
	errorHighlight.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	errorHighlight.TextSize = codeEditor.TextSize
	errorHighlight.Font = Enum.Font.RobotoMono
	errorHighlight.TextColor3 = Color3.fromRGB(0, 0, 0)
	errorHighlight.TextXAlignment = Enum.TextXAlignment.Left
	errorHighlight.BorderSizePixel = 0
end

local function updateLines(currentLine)
	local source = codeEditor.Text
	local lines = source:split("\n")
	local newText = ""

	print(currentLine)

	for i = 1, #lines do
		if i == currentLine then
			newText ..= "<b>" .. i .. "</b>\n"
		else
			newText ..= "<font color='#aaa'>" .. i .. "</font>\n"
		end
	end

	lineCounter.Text = newText
end

local function round(num : number, dp : number)
	return math.round(num * (10 ^ dp)) / (10 ^ dp)
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
			wait(errorThreshold)
			if round(tick() - textChanged, 2) == round(errorThreshold, 2) then
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

game.LogService.MessageOut:Connect(function(msg, msgType)
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
end)

executeButton.MouseButton1Click:Connect(function()
	loadstring(codeEditor.Text)()
end)

clearButton.MouseButton1Click:Connect(function()
	codeEditor.Text = ""
end)

copyButton.MouseButton1Click:Connect(function()
	setclipboard(codeEditor.Text)
end)
