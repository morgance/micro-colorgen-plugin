VERSION = "0.0.0"

math.randomseed(os.time())

local micro = import("micro")
local config = import("micro/config")

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

local function c()
	local index = math.random(1, #colors)
	return colors[index]
end

local function generate_colorscheme()
	local lines = {}

	table.insert(lines, 'color-link default "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link comment "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link identifier "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link constant "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link statement "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link symbol "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link preproc "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link type "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link special "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link underlined "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link error "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link todo "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link selection "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link statusline "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link tabbar "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link indent-char "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link line-number "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link gutter-error "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link gutter-warning "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link diff-added "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link diff-modified "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link diff-deleted "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link cursor-line "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link current-line-number "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link color-column "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link ignore "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link scrollbar "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link divider "' .. s() .. c() .. "," .. c() .. '"')
	table.insert(lines, 'color-link message "' .. s() .. c() .. '"')
	table.insert(lines, 'color-link error-message "' .. s() .. c() .. "," .. c() .. '"')

	return table.concat(lines, "\n")
end

local count = 1

function ColorgenCmd(bp)
	local text = generate_colorscheme()
	config.AddRuntimeFileFromMemory(config.RTColorscheme, "colorgen" .. count, text)
	local current = config.GetGlobalOption("colorscheme")
	if current ~= "colorgen" .. count then
		config.SetGlobalOption("colorscheme", "colorgen" .. count)
	end
	count = count + 1
end

function init()
	config.MakeCommand("colorgen", ColorgenCmd, config.NoComplete)
	config.TryBindKey("Ctrl-Alt-l", "lua:colorgen.ColorgenCmd", false)
	config.AddRuntimeFile("colorgen", config.RTHelp, "help/colorgen.md")
end
