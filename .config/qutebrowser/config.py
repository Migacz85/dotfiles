# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()
# When to find text on a page case-insensitively.
# Type: String
# Valid values:
#   - always: Search case-insensitively.
#   - never: Search case-sensitively.
#   - smart: Search case-sensitively if there are capital characters.
c.search.ignore_case = 'smart'

# blink-settings=darkMode=4
# Find text on a page incrementally, renewing the search for each typed
# character.
# Type: Bool
c.search.incremental = True
c.editor.command = ['konsole', '-e', 'vim {}']

#Setting dark mode
config.set("colors.webpage.darkmode.enabled", True)
# config.load_autoconfig()

# How to open links in an existing instance if a new one is launched.
# This happens when e.g. opening a link from a terminal. See
# `new_instance_open_target_window` to customize in which window the
# link is opened in.
# Type: String
# Valid values:
#   - tab: Open a new tab in the existing window and activate the window.
#   - tab-bg: Open a new background tab in the existing window and activate the window.
#   - tab-silent: Open a new tab in the existing window without activating the window.
#   - tab-bg-silent: Open a new background tab in the existing window without activating the window.
#   - window: Open in a new window.
c.new_instance_open_target = 'tab'

# Which window to choose when opening links as new tabs. When
# `new_instance_open_target` is not set to `window`, this is ignored.
# Type: String
# Valid values:
#   - first-opened: Open new tabs in the first (oldest) opened window.
#   - last-opened: Open new tabs in the last (newest) opened window.
#   - last-focused: Open new tabs in the most recently focused window.
#   - last-visible: Open new tabs in the most recently visible window.
c.new_instance_open_target_window = 'last-focused'

# Name of the session to save by default. If this is set to null, the
# session which was last loaded is saved.
# Type: SessionName
c.session.default_name = None

# Load a restored tab as soon as it takes focus.
# Type: Bool
c.session.lazy_restore = False

# Additional arguments to pass to Qt, without leading `--`. With
# QtWebEngine, some Chromium arguments (see
# https://peter.sh/experiments/chromium-command-line-switches/ for a
# list) will work.
# Type: List of String

# c.qt.args = ["blink-settings=darkMode=4"]


# Force software rendering for QtWebEngine. This is needed for
# QtWebEngine to work with Nouveau drivers and can be useful in other
# scenarios related to graphic issues.
# Type: String
# Valid values:

#   - software-opengl: Tell LibGL to use a software implementation of GL (`LIBGL_ALWAYS_SOFTWARE` / `QT_XCB_FORCE_SOFTWARE_OPENGL`)
#   - qt-quick: Tell Qt Quick to use a software renderer instead of OpenGL. (`QT_QUICK_BACKEND=software`)
#   - chromium: Tell Chromium to disable GPU support and use Skia software rendering instead. (`--disable-gpu`)
#   - none: Don't force software rendering.
c.qt.force_software_rendering = 'none'

# Force a Qt platform to use. This sets the `QT_QPA_PLATFORM`
# environment variable and is useful to force using the XCB plugin when
# running QtWebEngine on Wayland.
# Type: String
c.qt.force_platform = None

# Which Chromium process model to use. Alternative process models use
# less resources, but decrease security and robustness. See the
# following pages for more details:    -
# https://www.chromium.org/developers/design-documents/process-models
# - https://doc.qt.io/qt-5/qtwebengine-features.html#process-models
# Type: String
# Valid values:
#   - process-per-site-instance: Pages from separate sites are put into separate processes and separate visits to the same site are also isolated.
#   - process-per-site: Pages from separate sites are put into separate processes. Unlike Process per Site Instance, all visits to the same site will share an OS process. The benefit of this model is reduced memory consumption, because more web pages will share processes. The drawbacks include reduced security, robustness, and responsiveness.
#   - single-process: Run all tabs in a single process. This should be used for debugging purposes only, and it disables `:open --private`.
c.qt.process_model = 'process-per-site-instance'

# When to use Chromium's low-end device mode. This improves the RAM
# usage of renderer processes, at the expense of performance.
# Type: String
# Valid values:
#   - always: Always use low-end device mode.
#   - auto: Decide automatically (uses low-end mode with < 1 GB available RAM).
#   - never: Never use low-end device mode.
c.qt.low_end_device_mode = 'auto'

# Turn on Qt HighDPI scaling. This is equivalent to setting
# QT_AUTO_SCREEN_SCALE_FACTOR=1 in the environment. It's off by default
# as it can cause issues with some bitmap fonts. As an alternative to
# this, it's possible to set font sizes and the `zoom.default` setting.
# Type: Bool
c.qt.highdpi = False

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# List of user stylesheet filenames to use.
# Type: List of File, or File

# Duration (in milliseconds) to show messages in the statusbar for. Set
# to 0 to never clear messages.
# Type: Int
c.messages.timeout = 4000

# Show a filebrowser in upload/download prompts.
# Type: Bool
c.prompt.filebrowser = True

# Rounding radius (in pixels) for the edges of prompts.
# Type: Int
c.prompt.radius = 8

# When to show the scrollbar.
# Type: String
# Valid values:
#   - always: Always show the scrollbar.
#   - never: Never show the scrollbar.
#   - when-searching: Show the scrollbar when searching for text in the webpage. With the QtWebKit backend, this is equal to `never`.
c.scrolling.bar = 'when-searching'

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = False

# Languages to use for spell checking. You can check for available
# languages and install dictionaries using scripts/dictcli.py. Run the
# script with -h/--help for instructions.
# Type: List of String
# Valid values:
#   - af-ZA: Afrikaans (South Africa)
#   - bg-BG: Bulgarian (Bulgaria)
#   - ca-ES: Catalan (Spain)
#   - cs-CZ: Czech (Czech Republic)
#   - da-DK: Danish (Denmark)
#   - de-DE: German (Germany)
#   - el-GR: Greek (Greece)
#   - en-AU: English (Australia)
#   - en-CA: English (Canada)
#   - en-GB: English (United Kingdom)
#   - en-US: English (United States)
#   - es-ES: Spanish (Spain)
#   - et-EE: Estonian (Estonia)
#   - fa-IR: Farsi (Iran)
#   - fo-FO: Faroese (Faroe Islands)
#   - fr-FR: French (France)
#   - he-IL: Hebrew (Israel)
#   - hi-IN: Hindi (India)
#   - hr-HR: Croatian (Croatia)
#   - hu-HU: Hungarian (Hungary)
#   - id-ID: Indonesian (Indonesia)
#   - it-IT: Italian (Italy)
#   - ko: Korean
#   - lt-LT: Lithuanian (Lithuania)
#   - lv-LV: Latvian (Latvia)
#   - nb-NO: Norwegian (Norway)
#   - nl-NL: Dutch (Netherlands)
#   - pl-PL: Polish (Poland)
#   - pt-BR: Portuguese (Brazil)
#   - pt-PT: Portuguese (Portugal)
#   - ro-RO: Romanian (Romania)
#   - ru-RU: Russian (Russia)
#   - sh: Serbo-Croatian
#   - sk-SK: Slovak (Slovakia)
#   - sl-SI: Slovenian (Slovenia)
#   - sq: Albanian
#   - sr: Serbian
#   - sv-SE: Swedish (Sweden)
#   - ta-IN: Tamil (India)
#   - tg-TG: Tajik (Tajikistan)
#   - tr-TR: Turkish (Turkey)
#   - uk-UA: Ukrainian (Ukraine)
#   - vi-VN: Vietnamese (Viet Nam)
c.spellcheck.languages = []

# Default zoom level.
# Type: Perc
c.zoom.default = '100%'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #888888, stop:1 #505050)'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '10pt monospace'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = 'bold 10pt monospace'

# Font used for the debugging console.
# Type: QtFont
c.fonts.debug_console = '10pt monospace'

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = '10pt monospace'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = '10pt monospace'

# Font used for error messages.
# Type: Font
c.fonts.messages.error = '10pt monospace'

# Font used for info messages.
# Type: Font
c.fonts.messages.info = '10 pt monospace'

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = '10pt monospace'

# Font used for prompts.
# Type: Font
c.fonts.prompts = '10pt sans-serif'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '10pt monospace'

# Font used in the tab bar.
# Type: QtFont
# c.fonts.tabs = '13pt monospace'

# This setting can be used to map keys to other keys. When the key used
# as dictionary-key is pressed, the binding for the key used as
# dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map Ctrl-[ to Escape. Note that
# when a key is bound (via `bindings.default` or `bindings.commands`),
# the mapping is ignored.
# Type: Dict

c.bindings.key_mappings = {'<Ctrl+6>': '<Ctrl+^>', '<Ctrl+Enter>': '<Ctrl+Return>', '<Ctrl+[>': '<Escape>', '<Ctrl+j>': '<Return>', '<Ctrl+m>': '<Return>', '<Enter>': '<Return>', '<Shift+Enter>': '<Return>', '<Shift+Return>': '<Return>'}

# Bindings for normal mode
config.bind(',q', 'config-cycle content.user_stylesheets /home/migacz/Downloads/git/solarized-everything-css/css/darculized/darculized-all-sites.css ""'  )
config.bind(',w', 'config-cycle content.user_stylesheets /home/migacz/Downloads/git/solarized-everything-css/css/apprentice/apprentice-all-sites.css ""' )
config.bind(',e', 'config-cycle content.user_stylesheets /home/migacz/Downloads/git/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css ""' )
config.bind(',r', 'config-cycle content.user_stylesheets /home/migacz/Downloads/git/solarized-everything-css/css/solarized-dark/solarized-dark-all-sites.css ""' )
config.bind(',a', 'config-cycle content.user_stylesheets /home/migacz/.cache/wal/colors.css /home/migacz/Downloads/git/solarized-everything-css/css/wall.css ""' )
config.bind(',a', 'config-cycle content.user_stylesheets /home/migacz/.cache/wal/colors.css /home/migacz/Downloads/git/solarized-everything-css/css/custom_dark/custom_dark.css ""' )
config.bind(',n', 'config-cycle content.user_stylesheets /home/migacz/Downloads/git/solarized-everything-css/css/darculized-all-sites.css ""' )

config.bind(',k', 'spawn --userscript /home/migacz/.scripts/send-link.sh')


config.bind('z', 'hint links spawn mpv --ytdl-format=best {hint-url}')
config.bind('x', 'spawn mpv --ytdl-format=best {url}')
config.load_autoconfig(False)
