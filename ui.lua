local ui = {}

ui["gui"] = Instance.new("ScreenGui", game.CoreGui)
ui["gui"].Name = "VortexAlphaV1.0"

function ui.loadMain()
	local mainUI = {}

	mainUI["Main"] = Instance.new("Frame", ui["gui"])
	mainUI["Main"].BorderSizePixel = 0
	mainUI["Main"].BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
	mainUI["Main"].AnchorPoint = Vector2.new(0.5, 0.5)
	mainUI["Main"].Size = UDim2.new(0.545478761, 0, 0.827848077, 0)
	mainUI["Main"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["Main"].Name = "Main"
	mainUI["Main"].Position = UDim2.new(0.49977833, 0, 0.499547929, 0)

	mainUI["UICorner"] = Instance.new("UICorner", mainUI["Main"])
	mainUI["UICorner"].CornerRadius = UDim.new(0, 16)

	mainUI["EditorWindow"] = Instance.new("Frame", mainUI["Main"])
	mainUI["EditorWindow"].BorderSizePixel = 0
	mainUI["EditorWindow"].BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
	mainUI["EditorWindow"].Size = UDim2.new(0.884113133, -4, 0.664519727, -4)
	mainUI["EditorWindow"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["EditorWindow"].Name = "EditorWindow"
	mainUI["EditorWindow"].Position = UDim2.new(0.0589555427, 0, 0.135495856, 0)

	mainUI["UICorner2"] = Instance.new("UICorner", mainUI["EditorWindow"])
	mainUI["UICorner2"].Name = "UICorner2"
	mainUI["UICorner2"].CornerRadius = UDim.new(0, 12)

	mainUI["UIStroke"] = Instance.new("UIStroke", mainUI["EditorWindow"])
	mainUI["UIStroke"].Color = Color3.new(0.333333, 0.478431, 1)
	mainUI["UIStroke"].Thickness = 2

	mainUI["LinesFrame"] = Instance.new("Frame", mainUI["EditorWindow"])
	mainUI["LinesFrame"].BorderSizePixel = 0
	mainUI["LinesFrame"].BackgroundColor3 = Color3.new(0.168627, 0.168627, 0.168627)
	mainUI["LinesFrame"].Size = UDim2.new(0.225516424, 0, 1.00000012, 0)
	mainUI["LinesFrame"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["LinesFrame"].Name = "LinesFrame"
	mainUI["LinesFrame"].Position = UDim2.new(-3.56327234e-08, 0, -3.34285204e-08, 0)

	mainUI["UICorner3"] = Instance.new("UICorner", mainUI["LinesFrame"])
	mainUI["UICorner3"].Name = "UICorner3"
	mainUI["UICorner3"].CornerRadius = UDim.new(0, 12)

	mainUI["LinesBorder"] = Instance.new("Frame", mainUI["LinesFrame"])
	mainUI["LinesBorder"].BorderSizePixel = 0
	mainUI["LinesBorder"].BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608)
	mainUI["LinesBorder"].AnchorPoint = Vector2.new(1, 0)
	mainUI["LinesBorder"].Size = UDim2.new(0.224260077, 0, 0.99999994, 0)
	mainUI["LinesBorder"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["LinesBorder"].Name = "LinesBorder"
	mainUI["LinesBorder"].Position = UDim2.new(0.999999702, 0, 3.34285168e-08, 0)

	mainUI["LinesSF"] = Instance.new("ScrollingFrame", mainUI["LinesFrame"])
	mainUI["LinesSF"].Active = true
	mainUI["LinesSF"].BorderSizePixel = 0
	mainUI["LinesSF"].CanvasSize = UDim2.new(0, 0, 0, 0)
	mainUI["LinesSF"].BackgroundColor3 = Color3.new(1, 1, 1)
	mainUI["LinesSF"].ScrollingEnabled = false
	mainUI["LinesSF"].BackgroundTransparency = 1
	mainUI["LinesSF"].AutomaticCanvasSize = Enum.AutomaticSize.Y
	mainUI["LinesSF"].Size = UDim2.new(0.692900002, 0, 0.907987773, 0)
	mainUI["LinesSF"].ScrollBarImageColor3 = Color3.new(0, 0, 0)
	mainUI["LinesSF"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["LinesSF"].ScrollBarThickness = 0
	mainUI["LinesSF"].Name = "LinesSF"
	mainUI["LinesSF"].Position = UDim2.new(-1.58005008e-07, 0, 0.0390000455, 0)

	mainUI["LinesLabel"] = Instance.new("TextLabel", mainUI["LinesSF"])
	mainUI["LinesLabel"].BorderSizePixel = 0
	mainUI["LinesLabel"].RichText = true
	mainUI["LinesLabel"].TextXAlignment = Enum.TextXAlignment.Right
	mainUI["LinesLabel"].TextYAlignment = Enum.TextYAlignment.Top
	mainUI["LinesLabel"].BackgroundColor3 = Color3.new(1, 1, 1)
	mainUI["LinesLabel"].TextSize = 22
	mainUI["LinesLabel"].TextColor3 = Color3.new(1, 1, 1)
	mainUI["LinesLabel"].AutomaticSize = Enum.AutomaticSize.Y
	mainUI["LinesLabel"].Size = UDim2.new(1, 0, 1, 0)
	mainUI["LinesLabel"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["LinesLabel"].Text = "1"
	mainUI["LinesLabel"].BackgroundTransparency = 1
	mainUI["LinesLabel"].Font = Enum.Font.RobotoMono
	mainUI["LinesLabel"].Name = "LinesLabel"

	mainUI["EditorSF"] = Instance.new("ScrollingFrame", mainUI["EditorWindow"])
	mainUI["EditorSF"].Active = true
	mainUI["EditorSF"].BorderSizePixel = 0
	mainUI["EditorSF"].CanvasSize = UDim2.new(0, 0, 0, 0)
	mainUI["EditorSF"].BackgroundColor3 = Color3.new(1, 1, 1)
	mainUI["EditorSF"].BackgroundTransparency = 1
	mainUI["EditorSF"].AutomaticCanvasSize = Enum.AutomaticSize.XY
	mainUI["EditorSF"].Size = UDim2.new(0.693147302, 0, 0.907554209, 0)
	mainUI["EditorSF"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["EditorSF"].Name = "EditorSF"
	mainUI["EditorSF"].Position = UDim2.new(0.259739518, 0, 0.0394336209, 0)

	mainUI["CodeEditor"] = Instance.new("TextBox", mainUI["EditorSF"])
	mainUI["CodeEditor"].BorderSizePixel = 0
	mainUI["CodeEditor"].MultiLine = true
	mainUI["CodeEditor"].ClearTextOnFocus = false
	mainUI["CodeEditor"].TextXAlignment = Enum.TextXAlignment.Left
	mainUI["CodeEditor"].TextYAlignment = Enum.TextYAlignment.Top
	mainUI["CodeEditor"].BackgroundColor3 = Color3.new(1, 1, 1)
	mainUI["CodeEditor"].TextSize = 22
	mainUI["CodeEditor"].TextColor3 = Color3.new(1, 1, 1)
	mainUI["CodeEditor"].AutomaticSize = Enum.AutomaticSize.XY
	mainUI["CodeEditor"].Size = UDim2.new(1, 0, 1, 0)
	mainUI["CodeEditor"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["CodeEditor"].Text = 'print("Hello, World!")'
	mainUI["CodeEditor"].BackgroundTransparency = 1
	mainUI["CodeEditor"].Font = Enum.Font.RobotoMono
	mainUI["CodeEditor"].Name = "CodeEditor"

	mainUI["CodePreview"] = Instance.new("TextLabel", mainUI["EditorSF"])
	mainUI["CodePreview"].BorderSizePixel = 0
	mainUI["CodePreview"].RichText = true
	mainUI["CodePreview"].TextXAlignment = Enum.TextXAlignment.Left
	mainUI["CodePreview"].TextYAlignment = Enum.TextYAlignment.Top
	mainUI["CodePreview"].BackgroundColor3 = Color3.new(1, 1, 1)
	mainUI["CodePreview"].TextSize = 22
	mainUI["CodePreview"].TextColor3 = Color3.new(1, 1, 1)
	mainUI["CodePreview"].AutomaticSize = Enum.AutomaticSize.XY
	mainUI["CodePreview"].Size = UDim2.new(1, 0, 1, 0)
	mainUI["CodePreview"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["CodePreview"].Text = 'print("Hello, World!")'
	mainUI["CodePreview"].BackgroundTransparency = 1
	mainUI["CodePreview"].Font = Enum.Font.RobotoMono
	mainUI["CodePreview"].Name = "CodePreview"
	mainUI["CodePreview"].ZIndex = 2

	mainUI["UIPadding"] = Instance.new("UIPadding", mainUI["EditorSF"])
	mainUI["UIPadding"].PaddingRight = UDim.new(0, 10)
	mainUI["UIPadding"].PaddingBottom = UDim.new(0, 10)

	mainUI["ExecuteButton"] = Instance.new("TextButton", mainUI["Main"])
	mainUI["ExecuteButton"].BorderSizePixel = 0
	mainUI["ExecuteButton"].TextSize = 24
	mainUI["ExecuteButton"].TextColor3 = Color3.new(1, 1, 1)
	mainUI["ExecuteButton"].BackgroundColor3 = Color3.new(0.333333, 0.478431, 1)
	mainUI["ExecuteButton"].Size = UDim2.new(0.199893832, 0, 0.110421404, 0)
	mainUI["ExecuteButton"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["ExecuteButton"].Text = "Execute"
	mainUI["ExecuteButton"].FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	mainUI["ExecuteButton"].Name = "ExecuteButton"
	mainUI["ExecuteButton"].Position = UDim2.new(0.0563973747, 0, 0.82673955, 0)

	mainUI["UICorner"] = Instance.new("UICorner", mainUI["ExecuteButton"])
	mainUI["UICorner"].CornerRadius = UDim.new(0, 12)

	mainUI["ClearButton"] = Instance.new("TextButton", mainUI["Main"])
	mainUI["ClearButton"].BorderSizePixel = 0
	mainUI["ClearButton"].TextSize = 24
	mainUI["ClearButton"].TextColor3 = Color3.new(1, 1, 1)
	mainUI["ClearButton"].BackgroundColor3 = Color3.new(0.333333, 0.478431, 1)
	mainUI["ClearButton"].Size = UDim2.new(0.199893713, 0, 0.110421404, 0)
	mainUI["ClearButton"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["ClearButton"].Text = "Clear"
	mainUI["ClearButton"].FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	mainUI["ClearButton"].Name = "ClearButton"
	mainUI["ClearButton"].Position = UDim2.new(0.286551327, 0, 0.82673955, 0)

	mainUI["UICorner"] = Instance.new("UICorner", mainUI["ClearButton"])
	mainUI["UICorner"].CornerRadius = UDim.new(0, 12)

	mainUI["SaveButton"] = Instance.new("TextButton", mainUI["Main"])
	mainUI["SaveButton"].BorderSizePixel = 0
	mainUI["SaveButton"].TextSize = 24
	mainUI["SaveButton"].TextColor3 = Color3.new(1, 1, 1)
	mainUI["SaveButton"].BackgroundColor3 = Color3.new(0.333333, 0.478431, 1)
	mainUI["SaveButton"].Size = UDim2.new(0.199893594, 0, 0.110421404, 0)
	mainUI["SaveButton"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["SaveButton"].Text = "Save"
	mainUI["SaveButton"].FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	mainUI["SaveButton"].Name = "SaveButton"
	mainUI["SaveButton"].Position = UDim2.new(0.514264524, 0, 0.82673955, 0)

	mainUI["UICorner"] = Instance.new("UICorner", mainUI["SaveButton"])
	mainUI["UICorner"].CornerRadius = UDim.new(0, 12)

	mainUI["CopyButton"] = Instance.new("TextButton", mainUI["Main"])
	mainUI["CopyButton"].BorderSizePixel = 0
	mainUI["CopyButton"].TextSize = 24
	mainUI["CopyButton"].TextColor3 = Color3.new(1, 1, 1)
	mainUI["CopyButton"].BackgroundColor3 = Color3.new(0.333333, 0.478431, 1)
	mainUI["CopyButton"].Size = UDim2.new(0.199893713, 0, 0.110421404, 0)
	mainUI["CopyButton"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["CopyButton"].Text = "Copy"
	mainUI["CopyButton"].FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	mainUI["CopyButton"].Name = "CopyButton"
	mainUI["CopyButton"].Position = UDim2.new(0.741191804, 0, 0.82673955, 0)

	mainUI["UICorner"] = Instance.new("UICorner", mainUI["CopyButton"])
	mainUI["UICorner"].CornerRadius = UDim.new(0, 12)

	mainUI["TitleLabel"] = Instance.new("TextLabel", mainUI["Main"])
	mainUI["TitleLabel"].BorderSizePixel = 0
	mainUI["TitleLabel"].BackgroundColor3 = Color3.new(1, 1, 1)
	mainUI["TitleLabel"].TextSize = 24
	mainUI["TitleLabel"].TextColor3 = Color3.new(1, 1, 1)
	mainUI["TitleLabel"].Size = UDim2.new(0.867918015, 0, 0.119113155, 0)
	mainUI["TitleLabel"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["TitleLabel"].Text = "Vortex Alpha V1.0"
	mainUI["TitleLabel"].BackgroundTransparency = 1
	mainUI["TitleLabel"].FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	mainUI["TitleLabel"].Name = "TitleLabel"
	mainUI["TitleLabel"].Position = UDim2.new(0.0670404583, 0, -1.04158406e-08, 0)

	mainUI["CloseButton"] = Instance.new("TextButton", mainUI["Main"])
	mainUI["CloseButton"].BorderSizePixel = 0
	mainUI["CloseButton"].TextSize = 24
	mainUI["CloseButton"].TextColor3 = Color3.new(1, 1, 1)
	mainUI["CloseButton"].BackgroundColor3 = Color3.new(1, 1, 1)
	mainUI["CloseButton"].Size = UDim2.new(0.108126119, 0, 0.119113125, 0)
	mainUI["CloseButton"].BorderColor3 = Color3.new(0, 0, 0)
	mainUI["CloseButton"].Text = "X"
	mainUI["CloseButton"].BackgroundTransparency = 1
	mainUI["CloseButton"].FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	mainUI["CloseButton"].Name = "CloseButton"
	mainUI["CloseButton"].Position = UDim2.new(0.891841292, 0, 0, 0)

	return mainUI
end

ui.loadKS = function()
	local ksUI = {}

	ksUI["Main"] = Instance.new("Frame", ui["gui"])
	ksUI["Main"].BorderSizePixel = 0
	ksUI["Main"].BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	ksUI["Main"].Size = UDim2.new(0, 432, 0, 193)
	ksUI["Main"].Position = UDim2.new(0.2797, 0, 0.21905, 0)
	ksUI["Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	ksUI["Main"].Name = "Main"

	ksUI["UICorner"] = Instance.new("UICorner", ksUI["Main"])

	ksUI["KeyInput"] = Instance.new("TextBox", ksUI["Main"])
	ksUI["KeyInput"].CursorPosition = -1
	ksUI["KeyInput"].TextColor3 = Color3.fromRGB(179, 179, 179)
	ksUI["KeyInput"].PlaceholderColor3 = Color3.fromRGB(179, 179, 179)
	ksUI["KeyInput"].BorderSizePixel = 0
	ksUI["KeyInput"].TextSize = 14
	ksUI["KeyInput"].Name = "KeyInput"
	ksUI["KeyInput"].BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	ksUI["KeyInput"].FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ksUI["KeyInput"].ClearTextOnFocus = false
	ksUI["KeyInput"].PlaceholderText = "Enter Key Here"
	ksUI["KeyInput"].Size = UDim2.new(0, 407, 0, 34)
	ksUI["KeyInput"].Position = UDim2.new(0.03009, 0, 0.25008, 0)
	ksUI["KeyInput"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	ksUI["KeyInput"].Text = ""

	ksUI["UICorner2"] = Instance.new("UICorner", ksUI["InputBox"])

	ksUI["TitleLabel"] = Instance.new("TextLabel", ksUI["Main"])
	ksUI["TitleLabel"].TextWrapped = true
	ksUI["TitleLabel"].BorderSizePixel = 0
	ksUI["TitleLabel"].TextScaled = true
	ksUI["TitleLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ksUI["TitleLabel"].TextSize = 14
	ksUI["TitleLabel"].FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ksUI["TitleLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
	ksUI["TitleLabel"].BackgroundTransparency = 1
	ksUI["TitleLabel"].Size = UDim2.new(0, 200, 0, 26)
	ksUI["TitleLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	ksUI["TitleLabel"].Text = "Key System"
	ksUI["TitleLabel"].Name = "TitleLabel"
	ksUI["TitleLabel"].Position = UDim2.new(0.26852, 0, 0.04644, 0)

	ksUI["CheckButton"] = Instance.new("TextButton", ksUI["Main"])
	ksUI["CheckButton"].BorderSizePixel = 0
	ksUI["CheckButton"].TextSize = 14
	ksUI["CheckButton"].TextColor3 = Color3.fromRGB(255, 255, 255)
	ksUI["CheckButton"].BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	ksUI["CheckButton"].FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ksUI["CheckButton"].Size = UDim2.new(0, 148, 0, 35)
	ksUI["CheckButton"].Name = "CheckButton"
	ksUI["CheckButton"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	ksUI["CheckButton"].Text = "Check Key"
	ksUI["CheckButton"].Position = UDim2.new(0.07407, 0, 0.50819, 0)

	ksUI["UICorner3"] = Instance.new("UICorner", ksUI["CheckButton"])

	ksUI["CopyLinkButton"] = Instance.new("TextButton", ksUI["Main"])
	ksUI["CopyLinkButton"].BorderSizePixel = 0
	ksUI["CopyLinkButton"].TextSize = 14
	ksUI["CopyLinkButton"].TextColor3 = Color3.fromRGB(255, 255, 255)
	ksUI["CopyLinkButton"].BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	ksUI["CopyLinkButton"].FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ksUI["CopyLinkButton"].Size = UDim2.new(0, 148, 0, 35)
	ksUI["CopyLinkButton"].Name = "CopyLinkButto"
	ksUI["CopyLinkButton"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	ksUI["CopyLinkButton"].Text = "Get Link"
	ksUI["CopyLinkButton"].Position = UDim2.new(0.56944, 0, 0.50819, 0)

	ksUI["UICorner4"] = Instance.new("UICorner", ksUI["CopyLinkButton"])

	ksUI["DestroyButton"] = Instance.new("TextButton", ksUI["Main"])
	ksUI["DestroyButton"].BorderSizePixel = 0
	ksUI["DestroyButton"].TextSize = 14
	ksUI["DestroyButton"].TextColor3 = Color3.fromRGB(255, 255, 255)
	ksUI["DestroyButton"].BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	ksUI["DestroyButton"].FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ksUI["DestroyButton"].Size = UDim2.new(0, 148, 0, 35)
	ksUI["DestroyButton"].Name = "DestroyButton"
	ksUI["DestroyButton"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	ksUI["DestroyButton"].Text = "Destroy UI"
	ksUI["DestroyButton"].Position = UDim2.new(0.32639, 0, 0.7426, 0)

	ksUI["UICorner5"] = Instance.new("UICorner", ksUI["DestroyButton"])

	return ksUI
end

return ui
