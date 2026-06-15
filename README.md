# Micro ColorGen Plugin: Random 16-Color Schemes for Micro Editor

https://github.com/morgance/micro-colorgen-plugin/releases

![Releases badge](https://img.shields.io/badge/releases-download-brightgreen?style=for-the-badge&logo=github)

A lively, playful plugin for the Micro text editor. Each time you run the color generator command, it creates a fresh 16-color color theme. The plugin keeps your workspace bright and unique, turning every editing session into a small palette adventure.

Table of contents
- Overview
- Why this plugin exists
- What you get
- How colorgen works
- Quick start and setup
- Detailed usage
- Palette biology: color theory in code
- Commands, shortcuts, and workflow
- Configuration and customization
- Design decisions and architecture
- Accessibility and testing
- Development and contribution
- Roadmap
- Troubleshooting
- Licensing and attribution
- Credits and references

Overview
This plugin is built for the Micro editor, a compact terminal-based editor loved by many for its speed and simplicity. It acts as a little color lab inside your editing environment. Every time you run the generator, you receive a brand-new 16-color palette. The colors cover a broad spectrum, designed to work well across a variety of syntax highlighting, UI chrome, and text styles. The result is a fresh look without manual tweaking. This makes long coding sessions feel new again and can help you spot code by color texture rather than just by line shape.

Why this plugin exists
Color matters in code. It helps with readability, focus, and memory. Yet creating harmonious color schemes by hand can be time-consuming. Micro ColorGen brings a playful, fast approach. It eliminates the guesswork by producing a complete palette in seconds. The plugin is lightweight, non-invasive, and designed to slot smoothly into your existing Micro workflow. If you love experimentation and want a tool that nudges you toward new color combinations, this plugin is for you.

What you get
- A command that generates a full 16-color palette on demand
- Compatibility with Micro’s color and syntax highlighting system
- A variety of palettes that blend contrast, hue diversity, and readability
- A simple, predictable workflow for testing and refining themes
- Lightweight code with a clean separation between palette data and display logic

How colorgen works
At a high level, the generator builds a 16-color palette from a mix of base hues, accents, and neutrals. The algorithm aims for good contrast, consistent saturation, and balanced luminance across the set. It does not rely on external services. It uses basic color math to ensure colors cover the spectrum, then arranges them in a way that works with common syntax tokens and UI elements.

The palette is stored in a small data structure inside the plugin. When you trigger the generator, Micro’s color system receives the palette, updates the display, and applies the new theme to the current session. The process is fast, deterministic in its random seeds per run, and repeatable enough to provide a stable workflow for testing different contrasts.

Quick start and setup
- Prerequisites: You need Micro installed and access to its plugin system. The plugin is designed to be drop-in compatible. No extra runtime dependencies are required.
- Install: Use Micro’s plugin manager to install micro-colorgen-plugin.
- Run: Execute the color generation command to produce a new 16-color palette for the active session.
- Persist: If you want to keep a palette, save it to your theme files or copy the color values to your theme configuration.

Install
- Open Micro and install the plugin with the built-in plugin manager.
- If your Micro setup uses a custom plugin directory, place the plugin files in your plugins directory and restart Micro.
- For manual setup, copy the plugin files to your Micro configuration path. The plugin is written to be simple to drop into this location.

Usage
- Activate the generator with the plugin’s command. The plugin replaces the current color theme with a new 16-color palette.
- You can re-run the generator to explore many palettes in one session.
- If you want to compare palettes, quickly toggle between two or three generated themes to see which one improves readability or reduces eye strain.

Detailed usage
- Trigger the palette generator:
  - In Micro, call the function exposed by the plugin. The exact command name is designed to be intuitive, like colorgen or palette-gen.
  - The plugin applies the palette immediately, updating the editor chrome, syntax highlighting, and clipboard hints if supported.
- Save a palette:
  - After generating a favorable palette, save it to a theme file that Micro can load on startup.
  - Consider naming conventions that reflect the palette’s characteristics, such as “sunset-16,” “cool-tones-04,” or “high-contrast-16.”
- Apply a saved palette:
  - Load the saved theme file into Micro. The plugin will apply the colors, ensuring consistency across sessions.
- Revert and compare:
  - If you want to revert, load a previously saved palette from your themes directory. You can switch back and forth to compare readability and preference.

Palette biology: color theory in code
A good palette isn’t just a collection of pretty colors. It has structure. The 16-color scheme focuses on:
- Core neutrals for backgrounds and surfaces
- Primary hues for syntax tokens
- Secondary hues for literals, strings, and punctuation
- Accent colors for UI elements and editor hints
- Contrast balance to ensure legibility at common font sizes and line heights
- Accessibility considerations, including contrast ratios and color differentiation, especially for users with color vision deficiency

The generator uses a few guiding rules:
- Ensure a broad hue distribution across the color wheel to maximize distinct token colors
- Maintain consistent saturation to avoid jarring transitions
- Keep luminance differences that help distinguish text from the background
- Provide enough variation so that syntax categories stay legible without manual tweaking

Colors matter in context. The same 16 colors can look different across terminals with different background settings. The generator aims for palettes that remain usable on both light and dark backgrounds, with a bias toward readability in typical terminal themes. It also considers common color token pairings to avoid clashes and to maintain a calm, coherent appearance.

Tables, palettes, and examples
Here is an illustrative example of a 16-color palette. The goal is clarity and readability, not to force a single look on every project. You can tweak this example to fit your environment or as a starting point for your own experiments.

- Neutral background: #1E1E1E
- Surface: #2A2A2A
- Text: #EDEDED
- Primary text: #F6F6F6
- Foreground: #CCCCCC
- Accent 1: #FF6B6B
- Accent 2: #6BFFCE
- Accent 3: #6B9CFF
- Accent 4: #FFD36B
- Token keyword: #FF8CFF
- Token function: #7CFF66
- Token variable: #33A1FF
- Token string: #FFDE59
- Token number: #E07FFF
- Token comment: #7A7A7A
- Token types: #1DD1A1
- Token literal: #FF6F61

Palette preview
<div>
  <svg width="320" height="80" viewBox="0 0 320 80" xmlns="http://www.w3.org/2000/svg" aria-label="Palette preview">
    <rect x="0" y="0" width="20" height="80" fill="#1E1E1E"/>
    <rect x="20" y="0" width="20" height="80" fill="#2A2A2A"/>
    <rect x="40" y="0" width="20" height="80" fill="#EDEDED"/>
    <rect x="60" y="0" width="20" height="80" fill="#1E1E1E" opacity="0"/>
    <rect x="80" y="0" width="20" height="80" fill="#FF6B6B"/>
    <rect x="100" y="0" width="20" height="80" fill="#6BFFCE"/>
    <rect x="120" y="0" width="20" height="80" fill="#6B9CFF"/>
    <rect x="140" y="0" width="20" height="80" fill="#FFD36B"/>
    <rect x="160" y="0" width="20" height="80" fill="#FF8CFF"/>
    <rect x="180" y="0" width="20" height="80" fill="#7CFF66"/>
    <rect x="200" y="0" width="20" height="80" fill="#33A1FF"/>
    <rect x="220" y="0" width="20" height="80" fill="#FFDE59"/>
    <rect x="240" y="0" width="20" height="80" fill="#E07FFF"/>
    <rect x="260" y="0" width="20" height="80" fill="#7A7A7A"/>
    <rect x="280" y="0" width="20" height="80" fill="#1DD1A1"/>
    <rect x="300" y="0" width="20" height="80" fill="#FF6F61"/>
  </svg>
</div>

These swatches demonstrate the vivid mix of hues and neutrals a colorgen can deliver. You can copy these hex values or allow the generator to produce something different on each run.

Commands, shortcuts, and workflow
- colorgen: The primary command to generate a new palette
  - This command refreshes the current session with a new hex color set and updates the editor UI
- colorgen-save <name>: Save the current palette as a named theme
  - Choose a descriptive name that helps you remember its mood or use-case
- colorgen-load <name>: Load a previously saved palette
  - This is useful for quick comparisons between palettes
- colorgen-list: List all saved palettes
  - Quick reference to switch between palettes
- colorgen-clear: Clear the current palette
  - Revert to the editor’s default color scheme

Keyboard shortcuts
- Quick generate: Press a specific key combination to trigger the generator
- Quick save: Use another combination to save the current palette
- Quick load: Navigate to previously saved palettes with arrows and an enter

Configuration and customization
- Background mode: Choose a light or dark background bias to influence color choices
- Palette size: The plugin targets 16 colors by default, but you can adapt for different contexts
- Contrast target: A configurable target for text-to-background contrast
- Token mapping: Map specific token types to preferred colors
- Custom color seeds: Seed the generator with a starting color to direct its exploration
- Persist across sessions: Decide whether a palette should be saved automatically on exit

Design decisions and architecture
- Lightweight footprint: The generator is designed to be small and fast
- Clear separation: Palette data, color application logic, and UI bindings are isolated
- Stateless generation: The generator uses a per-run state to ensure repeatability while still offering fresh outputs
- Extensibility: The data model supports additional colors or custom mappings without breaking existing palettes
- Portability: The plugin relies on Micro’s standard plugin APIs and uses plain JSON-like structures to describe palettes

Accessibility and testing
- Accessibility: The palettes consider contrast and color differentiation for readability
- Font considerations: Palettes are tested against typical terminal font metrics
- Local testing: You can run the generator in isolation to verify color outputs
- Automated tests: A lightweight test suite validates color generation logic and palette application

Development and contribution
- How to contribute:
  - Fork the repository and create a feature branch
  - Implement changes with clear, small commits
  - Add tests for new functionality
  - Open a pull request with a plain description of changes
- Coding standards:
  - Write clear, small functions
  - Keep data structures simple and well-documented
  - Add comments where logic could be unclear
- Local setup:
  - Install the plugin locally in your Micro environment
  - Run the generator and verify the palette is applied to the editor
  - Save and load palettes to ensure that persistence works as expected
- Testing locally:
  - Run unit tests for color computations
  - Manually test palette changes across terminals with different backgrounds
  - Verify that color token mapping remains consistent across palette changes

Roadmap
- Expand color space coverage to include more evenly distributed hues
- Improve accessibility features with explicit WCAG-related guidance
- Add user presets and templates for common tasks (dark mode coding, UI-focused palettes, etc.)
- Create a visual gallery of generated palettes to help users pick styles
- Improve performance when loading very large sets of palettes

Troubleshooting
- Palette not applying: Ensure the plugin is loaded correctly and that you’re triggering the correct command. Check for conflicts with other color-related plugins.
- Colors look washed on dark background: Try a palette with stronger contrast or adjust the contrast setting in configurations.
- Palette not saving: Confirm you have write permissions to your saved palettes directory and that there is enough space on the disk.

Licensing and attribution
- The project uses an open-source license to encourage adoption and collaboration. See the LICENSE file in the repository for details.
- If you reuse or adapt the palette logic, acknowledge the original project and provide a link to the repository.

Changelog
- v0.x.y: Initial release with core 16-color generator
- v0.x.z: Minor performance improvements and bug fixes
- v0.x.x: Future updates will follow semantic versioning and include more features

Credits and references
- The Micro editor and its plugin ecosystem provide the framework for this tool
- The palette design principles draw on established color theory, practical UX testing, and user feedback
- Thanks to all early adopters who tested palettes and shared their experiences

Download and deployment note
The plugin is distributed via the releases page. To get started, visit the Releases page and download the appropriate file for your system. After downloading, place the file in your Micro plugins directory or load it through Micro’s plugin manager. If you are curious about the specific file you should download, you can navigate to the Releases page to view the available assets and their details.

Releases page navigation
- Visit the Releases page to view all available builds and assets
- Download the suitable asset for your environment
- Follow the installation steps described in the repository’s documentation
- After installation, run the color generator command to create a new palette

See the Releases page for more details and the latest updates: [Releases page](https://github.com/morgance/micro-colorgen-plugin/releases)

Palette samples and inspiration gallery
- Palette moods: bold, pastel, neon, muted, high-contrast
- Each palette is designed to be practical for real-world code editing, with attention to syntax tokens and editor chrome
- You can generate dozens of palettes in a single session and compare them side by side to find your preferred style

Implementation notes
- The generator stores color data in a lightweight structure that can be easily serialized to disk
- The color-to-token mapping is designed to be deterministic for a given seed, so you can replicate palettes if needed
- The plugin uses straightforward arithmetic to navigate the color space and avoid repeating colors in the same palette

Notes on usage with various Micro themes
- If you switch between multiple themes frequently, you can create a personal workflow that toggles palettes on demand
- For experiments, save multiple palettes with meaningful names and switch between them to find the best match for your workflow

Final thoughts
Micro ColorGen combines playfulness with practicality. It makes color exploration part of the editing process rather than a separate task. The tool helps you discover palettes that improve readability and reduce eye strain, while keeping the experience lightweight and seamless within Micro.

Remember: the palette you choose should support your coding patterns, not distract you from the task at hand. The generator is designed to be a flexible helper that invites experimentation and customization, so you can tailor the editor’s look to your own taste and work style.