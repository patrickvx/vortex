--[[
Scripted by Zenith
https://www.youtube.com/@ZenithScriptsRoblox
]]

local syntaxHighlighter = {}

local keywords = {
	lua = {"local", "function", "end", "if", "then", "and", "or", "not", "while", "repeat", "until", "do", "else", "elseif", "return", "for", "break", "self", "in", "continue"},
	builtins = {"print", "math", "wait", "task", "spawn", "random", "Vector3", "new", "getgenv", "firetouchinterest", "setfpscap", "workspace", "game", "script"}
}

local colors = {
	["comment"] = Color3.fromRGB(131, 131, 131),
	["string"] = Color3.fromRGB(0, 170, 127),
	["number"] = Color3.fromRGB(255, 170, 0),
	["keyword"] = Color3.fromRGB(170, 170, 255),
	["function_call"] = Color3.fromRGB(255, 255, 127),
	["builtin"] = Color3.fromRGB(85, 170, 255),
	["property"] = Color3.fromRGB(85, 85, 255)
}

function syntaxHighlighter.escapeTags(text : string)
    text = text:gsub("<", "&lt;")
    text = text:gsub(">", "&gt;")
    return text
end

local function colorTag(color : Color3, text : string)
	return string.format("<font color='#%02X%02X%02X'>%s</font>", color.R * 255, color.G * 255, color.B * 255, text)
end

local function isEscaped(str : string)
	str = str:sub(2, #str - 1)
	local count = 0
	if #str >= 1 then
		for i = #str, 1, -1 do
			if str:sub(i, i) == "\\" then
				count += 1
			else
				break
			end
		end
	end
	return count % 2 == 1
end

function syntaxHighlighter.highlight(source : string)
	local tokens = {}
	local i = 1
	local len = #source

	while i <= len do
		if source:sub(i, i + 3) == "--[[" then
			local endPos = source:find("]]", i + 4) or len
			table.insert(tokens, colorTag(colors["comment"], source:sub(i, endPos + 1)))
			i = endPos + 2

		elseif source:sub(i, i + 1) == "--" then
			local endPos = source:find("\n", i) or len + 1
			table.insert(tokens, colorTag(colors["comment"], source:sub(i, endPos - 1)))
			i = endPos

		elseif source:sub(i, i):match("[`'\"]") then
			local quote = source:sub(i, i)
			local endPos = source:find(`[{quote}\n]`, i + 1) or len
			while isEscaped(source:sub(i, endPos)) do
				endPos = source:find(`[{quote}\n]`, endPos + 1) or len
				if endPos == len then
					break
				end
			end
			table.insert(tokens, colorTag(colors["string"], source:sub(i, endPos)))
			i = endPos + 1

		elseif source:sub(i, i + 1) == "[[" then
			local endPos = source:find("]]", i + 2) or len
			table.insert(tokens, colorTag(colors["string"], source:sub(i, endPos + 1)))
			i = endPos + 2

		elseif source:sub(i, i):match("%d") or source:sub(i, i + 1):match("%.%d") then
			local numEnd = source:find("[^%w_]", i + 1) or len + 1
			local number = source:sub(i, numEnd - 1)
			table.insert(tokens, colorTag(colors["number"], number))
			i = numEnd

		elseif source:sub(i, i):match("%a") then
			local wordEnd = source:find("[^%w_]", i) or len + 1
			local word = source:sub(i, wordEnd - 1)
			local formatted

			if table.find(keywords.lua, word) then
				formatted = colorTag(colors["keyword"], word)
			elseif table.find(keywords.builtins, word) then
				formatted = colorTag(colors["builtin"], word)
			elseif source:sub(wordEnd, wordEnd):match("[%('\"]") then
				formatted = colorTag(colors["function_call"], word)
			else
				formatted = word
			end

			table.insert(tokens, formatted)
			i = wordEnd
			
		elseif source:sub(i, i) == "." and source:sub(i - 1, i - 1) ~= "." then
			local propertyStart = i + 1
			local propertyEnd = source:find("[^%w_]", propertyStart) or len + 1
			local property = source:sub(propertyStart, propertyEnd - 1)
			table.insert(tokens, ".")
			
			if table.find(keywords.lua, property) then
				table.insert(tokens, colorTag(colors["keyword"], property))
			elseif table.find(keywords.builtins, property) then
				table.insert(tokens, colorTag(colors["builtin"], property))
			elseif source:sub(propertyEnd, propertyEnd):match("[(`'\"]") or source:sub(propertyEnd, propertyEnd + 1) == "[[" then
				table.insert(tokens, colorTag(colors["function_call"], property))
			else
				table.insert(tokens, colorTag(colors["property"], property))
			end
			
			i = propertyEnd
		else
			table.insert(tokens, source:sub(i, i))
			i = i + 1
		end
	end

	return table.concat(tokens)
end

return syntaxHighlighter
