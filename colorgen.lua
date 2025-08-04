VERSION = "0.0.1"

math.randomseed(os.time())

local micro = import("micro")
local config = import("micro/config")
local os = import("os")
local filepath = import("path/filepath")

local styles = {
	"",
	"bold ",
	"italic ",
	"underline ",
}

local colors = {
	"black",
	"red",
	"green",
	"yellow",
	"blue",
	"magenta",
	"cyan",
	"white",
	"brightblack",
	"brightred",
	"brightgreen",
	"brightyellow",
	"brightblue",
	"brightmagenta",
	"brightcyan",
	"brightwhite",
}

local function s()
	local index = math.random(1, #styles)
	return styles[index]
end

local function c(ex1, ex2)
	while true do
		local index = math.random(1, #colors)
		local color = colors[index]
		if color ~= ex1 and color ~= ex2 then
			return color
		end
	end
end

local function color_pairs(except)
	local background = c(except)
	local foreground = c(background)
	return foreground, background
end

local function generate_colorscheme()
	local lines = {}

	local f, b = color_pairs() -- default
	local l = c(f) -- cursor-line

	table.insert(lines, 'color-link default "' .. s() .. f .. "," .. b .. '"')
	table.insert(lines, 'color-link comment "' .. s() .. c(b, l) .. '"')
	table.insert(lines, 'color-link identifier "' .. s() .. c(b, l) .. '"')
	table.insert(lines, 'color-link constant "' .. s() .. c(b, l) .. '"')
	table.insert(lines, 'color-link statement "' .. s() .. c(b, l) .. '"')
	table.insert(lines, 'color-link symbol "' .. s() .. c(b, l) .. '"')
	table.insert(lines, 'color-link preproc "' .. s() .. c(b, l) .. '"')
	table.insert(lines, 'color-link type "' .. s() .. c(b, l) .. '"')
	table.insert(lines, 'color-link special "' .. s() .. c(b, l) .. '"')
	table.insert(lines, 'color-link underlined "' .. s() .. c(b, l) .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link error "' .. s() .. x .. "," .. y .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link todo "' .. s() .. x .. "," .. y .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link selection "' .. s() .. x .. "," .. y .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link statusline "' .. s() .. x .. "," .. y .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link tabbar "' .. s() .. x .. "," .. y .. '"')
	table.insert(lines, 'color-link indent-char "' .. s() .. c(b, l) .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link line-number "' .. s() .. x .. "," .. y .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link gutter-error "' .. s() .. x .. "," .. y .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link gutter-warning "' .. s() .. x .. "," .. y .. '"')
	table.insert(lines, 'color-link diff-added "' .. s() .. c(b, l) .. '"')
	table.insert(lines, 'color-link diff-modified "' .. s() .. c(b, l) .. '"')
	table.insert(lines, 'color-link diff-deleted "' .. s() .. c(b, l) .. '"')
	table.insert(lines, 'color-link cursor-line "' .. s() .. l .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link current-line-number "' .. s() .. x .. "," .. y .. '"')
	table.insert(lines, 'color-link color-column "' .. s() .. c(b, l) .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link ignore "' .. s() .. x .. "," .. y .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link scrollbar "' .. s() .. x .. "," .. y .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link divider "' .. s() .. x .. "," .. y .. '"')
	table.insert(lines, 'color-link message "' .. s() .. c(b) .. '"')
	local x, y = color_pairs(b)
	table.insert(lines, 'color-link error-message "' .. s() .. x .. "," .. y .. '"')

	return table.concat(lines, "\n")
end

local generated = nil
local count = 1

function ColorgenCmd(bp)
	generated = generate_colorscheme()
	local name = "colorgen" .. count
	config.AddRuntimeFileFromMemory(config.RTColorscheme, name, generated)
	config.SetGlobalOption("colorscheme", name)
	count = count + 1
end

function SavecolorgenCmd(bp, args)
	local name
	if #args >= 1 then
		name = args[1]
	else
		name = "colorgen"
	end

	if generated == nil then
		micro.InfoBar():Error("No colorschemes are generated yet")
		return
	end

	local dir = filepath.Join(config.ConfigDir, "colorschemes")
	local path = filepath.Join(dir, name .. ".micro")

	local ok, err = pcall(os.MkdirAll, dir, 493) -- 493 = 0755
	if not ok then
		micro.InfoBar():Error("Failed to create colorschemes directory: " .. err)
		return
	end

	local file = io.open(path, "w")
	if not file then
		micro.InfoBar():Error("Failed to open file: " .. err)
		return
	end
	file:write(generated)
	file:close()

	micro.InfoBar():Message("Saved to " .. path)
end

function init()
	config.MakeCommand("colorgen", ColorgenCmd, config.NoComplete)
	config.MakeCommand("savecolorgen", SavecolorgenCmd, config.NoComplete)
	config.TryBindKey("Ctrl-Alt-l", "lua:colorgen.ColorgenCmd", false)
	config.AddRuntimeFile("colorgen", config.RTHelp, "help/colorgen.md")
end
