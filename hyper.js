// Future versions of Hyper may add additional config options, which will not
// automatically be merged into this file. See https://hyper.is#cfg for all
// currently supported options.

module.exports = {
  config: {
    // Choose either "stable" for receiving highly polished, or "canary" for less
    // polished but more frequent updates
    updateChannel: 'canary',

    // default font size in pixels for all tabs
    fontSize: 13,

    // font family with optional fallbacks
    fontFamily: '"Iosevka Nerd Font", Iosevka, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BEAM',

    // set to true for blinking cursor
    cursorBlink: true,

    // set to `true` (without backticks) if you're using a Linux setup that doesn't
    // show native menus default: `false` on Linux, `true` on Windows (ignored on
    // macOS)
    showHamburgerMenu: 'true',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: 'true',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '5px 25px',

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish) if
    // left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // Powershell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '/usr/bin/zsh',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i']) by
    // default ['--login'] will be used
    shellArgs: ['-i'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    quickEdit: true,

    // URL to custom bell bellSoundURL: 'http://example.com/bell.mp3', for advanced
    // config flags please refer to https://hyper.is/#cfg

    verminal: {
      fontFamily: '"Iosevka Nerd Font", Iosevka, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
      fontSize: 13
    }    
  },

  // a list of plugins to fetch and install from npm format:
  // [@org/]project[#version] examples:   `hyperpower`   `@company/project`
  // `project#1.0.1`
  plugins: ["gitrocket", "hyperterm-paste", "hyper-tabs-enhanced", "hyper-statusline"],

  // in development, you can create a directory under `~/.hyper_plugins/local/`
  // and include it here to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    'window:devtools': 'crtl+alt+o'
  }
};
