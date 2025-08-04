# Color Generator Plugin

**Color Generator** is a fun plugin that randomly generates a new 16-color
colorscheme each time you run the command.

## Usage

Run the following command:

```
colorgen
```

Or press `Ctrl-Alt-l` to instantly generate and switch to a new random
colorscheme.

Save the currently generated theme:

```
savecolorgen [colorscheme-name]
```

If no colorscheme-name is given, the default `colorgen` is used.

## Notes

- The saved theme will be written to `~/.config/micro/colorschemes/colorscheme-name.micro`
- You can use the saved file permanently by setting it in `settings.json`:
```json
"colorscheme": "colorscheme-name"
