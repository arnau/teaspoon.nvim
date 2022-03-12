-- Built with [Lush](https://github.com/rktjmp/lush.nvim).
--
-- Enable lush.ify on this file:
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

-- palette
local palette = {
  black = hsl("#252525"),
  blue = hsl("#99bbdd"),
  brown = hsl("#be9873"),
  cyan = hsl("#99ddee"),
  darkgrey = hsl("#333333"),
  gold = hsl("#ffe766"),
  green = hsl("#99bb99"),
  grey = hsl(30, 10, 50),
  lime = hsl("#dedd99"),
  orange = hsl("#ffaa77"),
  pink = hsl("#ffbbbb"),
  purple = hsl("#dda0dd"),
  rosybrown = hsl("#bc8f8f"),
  salmon = hsl("#fcaca3"),
  white = hsl("#d9d9d9"),
  yellow = hsl("#ffdd99"),

  -- deep
  deep_black = hsl("#000000"),
  deep_cyan = hsl("#00ccff"),
  deep_blue = hsl("#5555FF"),
  deep_green = hsl("#006600"),
  deep_teal = hsl("#008080"),
  deep_grey = hsl("#4b4b4b"),
  deep_darkgrey = hsl("#1a1a1a"),
  deep_orange = hsl("#ff5555"),
  deep_pink = hsl(340, 90, 66),
  deep_purple = hsl("#991177"),
  deep_rosybrown = hsl("#9a7372"),
  deep_red = hsl("#770000"),
  deep_salmon = hsl("#fa8072"),
  deep_white = hsl("#ffffff"),
  deep_yellow = hsl("#ffdd00"),
}

local function tame(colour)
  return colour.darken(10).desaturate(40)
end

-- LSP/Linters get confused here.
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    Normal { bg = palette.black, fg = palette.white },
    -- Visual mode selection
    Visual { bg = palette.deep_black },
    -- Visual mode selection when vim is "Not Owning the Selection".
    VisualNOS { Visual },

    -- MsgArea      { }, -- Area for messages and cmdline
    -- NormalNC     { }, -- normal text in non-current windows

    -- [ generic ]

    -- (preferred) any constant
    Constant { fg = palette.pink },
    -- A string constant: "this is a string"
    String { fg = tame(palette.cyan).desaturate(40) },
    -- A character constant: 'c', '\n'
    Character { fg = tame(palette.pink) },
    -- A number constant: 234, 0xff
    Number { fg = palette.lime },
    -- A boolean constant: TRUE, false
    Boolean { fg = tame(palette.green) },
    -- A floating point constant: 2.3e10
    Float { Number },

    -- (preferred) any variable name
    Identifier { fg = palette.pink },
    -- function name (also: methods for classes)
    Function { fg = palette.yellow.desaturate(30) },

    -- (preferred) any statement
    Statement { gui = "bold", fg = palette.green },
    -- if, then, else, endif, switch, etc.
    Conditional { fg = palette.blue },
    -- for, do, while, etc.
    Repeat { Conditional },
    -- case, default, etc.
    Label { Statement },
    -- "sizeof", "+", "*", etc.
    Operator { fg = palette.lime },
    -- Any other keyword
    Keyword { fg = tame(palette.cyan) },
    -- try, catch, throw
    Exception { fg = palette.deep_orange },

    -- (preferred) generic Preprocessor
    PreProc { fg = tame(palette.lime) },
    -- preprocessor #include
    Include { fg = tame(palette.yellow.desaturate(50)) },
    -- preprocessor #define
    Define { fg = tame(palette.orange) },
    -- same as Define
    Macro { Include },
    -- preprocessor #if, #else, #endif, etc.
    PreCondit { Define },

    -- (preferred) int, long, char, etc.
    -- Type { gui = "bold", fg = tame(palette.orange) },
    Type { fg = tame(palette.gold) },
    -- static, register, volatile, etc.
    StorageClass { Type },
    -- struct, union, enum, etc.
    Structure { fg = palette.cyan },
    -- A typedef
    Typedef { Type },

    -- (preferred) any special symbol
    Special { fg = tame(palette.pink) },
    -- special character in a constant
    SpecialChar { Special },
    -- can use CTRL-] on this
    Tag { Special },
    -- character that needs attention
    Delimiter { fg = palette.brown },
    StringDelimiter { Delimiter },
    -- special things inside a comment
    SpecialComment { Special },
    -- debugging statements
    Debug { Special },

    -- (preferred) text that stands out, HTML links
    Underlined { gui = "underline", fg = palette.blue, sp = tame(palette.blue) },
    Bold { gui = "bold" },
    Italic { gui = "italic" },

    -- (preferred) left blank, hidden  |hl-Ignore|
    Ignore { bg = palette.black, fg = palette.deep_grey },

    -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Todo { bg = palette.deep_black, fg = palette.deep_pink },

    -- Any comment
    Comment { fg = palette.grey },

    -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpecialKey { fg = palette.darkgrey.lighten(50) },
    -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
    -- See also |hl-EndOfBuffer|.
    NonText { gui = "bold", fg = SpecialKey.fg },
    -- Filler lines (~) after the end of the buffer.
    EndOfBuffer { NonText },
    -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Whitespace { NonText },

    -- Directory names (and other special names in listings)
    Directory { fg = tame(palette.yellow) },

    -- [ search ]
    -- See 'incsearch' highlighting. Also used for the text replaced with ":s///c"
    IncSearch { bg = palette.black, gui = "reverse", fg = palette.deep_yellow },
    -- See 'hlsearch'.
    Search { bg = palette.deep_cyan, fg = "bg" },
    -- |:substitute| replacement text highlighting
    Substitute { Search },
    -- Current |quickfix| item in the quickfix window.
    QuickFixLine { Search, bg = tame(palette.deep_cyan) },
    -- See |pi_paren.txt|
    MatchParen { bg = palette.orange, fg = "bg" },
    -- current match in 'wildmenu' completion
    WildMenu { bg = tame(palette.deep_yellow), fg = palette.black },

    -- [ messages ]
    -- Any erroneous construct
    Error { bg = palette.deep_red, fg = palette.white },
    -- Error messages on the command line
    ErrorMsg { Error },

    -- |more-prompt|
    MoreMsg { gui = "bold", fg = tame(palette.orange) },
    -- 'showmode' message (e.g., "-- INSERT -- ")
    ModeMsg { MoreMsg },

    -- Warning messages
    WarningMsg { fg = tame(palette.yellow) },

    -- Line number for ":number".
    LineNr { bg = palette.darkgrey, fg = tame(palette.yellow).desaturate(70).darken(30) },
    -- Combined with |hl-CursorLine| when the cursor is there.
    LineNrAbove { LineNr },
    LineNrBelow { LineNr },

    -- [ cursor ]
    -- Character under the cursor
    Cursor { bg = "fg", fg = "bg" },
    -- The character under the cursor when |language-mapping| is used (see 'guicursor')
    lCursor { Cursor },
    -- Cursor in a focused terminal
    TermCursor { gui = "reverse", cterm = "reverse" },
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorLine { bg = palette.black.darken(40) },
    -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorColumn { CursorLine },
    -- Used for the columns set with 'colorcolumn'
    ColorColumn { CursorLine },
    -- Like LineNr
    CursorLineNr { bg = palette.deep_black, gui = "bold", fg = tame(palette.pink) },

    -- |hit-enter| prompt and yes/no questions
    Question { gui = "bold", fg = tame(palette.yellow) },

    -- Status line of current window
    StatusLine { fg = palette.yellow.lighten(50), gui = "bold", bg = palette.rosybrown },
    -- Separator for scrolled messages, `msgsep` flag of 'display'
    MsgSeparator { StatusLine },
    StatusLineTerm { StatusLine },
    -- Status lines of not-current windows.
    StatusLineNC { fg = StatusLine.fg, bg = palette.darkgrey },
    StatusLineTermNC { StatusLineNC },

    -- The column separating vertically split windows
    VertSplit { fg = palette.deep_black, bg = palette.deep_black },

    -- [ floatingwindow ]
    -- Normal text in floating windows.
    NormalFloat { CursorLine },
    FloatBorder { VertSplit },
    FloatShadow { bg = palette.deep_black, blend = "80" },
    FloatShadowThrough { bg = FloatShadow.bg, blend = "100" },

    -- Titles for output from ":set all", ":autocmd" etc.
    Title { gui = "bold", fg = palette.pink },

    -- Line used for closed folds
    Folded { bg = palette.deep_grey, fg = tame(palette.lime) },
    -- 'foldcolumn'
    FoldColumn { bg = Folded.bg, fg = Folded.fg.lighten(30) },

    -- [ mode:diff ]
    -- Added line |diff.txt|
    DiffAdd { bg = palette.deep_green },
    -- Changed line |diff.txt|
    DiffChange { bg = palette.deep_grey },
    -- Deleted line |diff.txt|
    DiffDelete { bg = tame(palette.deep_rosybrown) },
    -- Changed text within a changed line |diff.txt|
    DiffText { bg = palette.deep_red, gui = "bold" },

    -- column where |signs| are displayed
    SignColumn { bg = palette.darkgrey, fg = palette.salmon },

    -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Conceal { bg = palette.deep_darkgrey, fg = palette.white },

    -- [ spellchecker ]
    -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellBad { sp = palette.deep_salmon, gui = "undercurl" },
    -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellCap { sp = palette.deep_yellow, gui = "undercurl" },
    -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    SpellRare { sp = palette.deep_purple, gui = "undercurl" },
    -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellLocal { sp = palette.deep_cyan, gui = "undercurl" },

    -- [ popupmenu ]
    -- Popup menu: normal item.
    Pmenu { bg = palette.pink.lighten(50), fg = palette.black },
    -- Popup menu: selected item.
    PmenuSel { bg = palette.deep_pink, fg = palette.deep_white },
    -- Popup menu: scrollbar.
    PmenuSbar { bg = palette.cyan, fg = Pmenu.fg },
    -- Popup menu: Thumb of the scrollbar.
    PmenuThumb { bg = palette.deep_cyan, fg = Pmenu.fg },

    -- [ tabline ]
    -- Tab line, not active tab page label
    TabLine { bg = palette.darkgrey.lighten(20), gui = "underline" },
    -- Tab line, active tab page label
    TabLineSel { bg = palette.deep_teal, gui = "bold", fg = palette.yellow },
    -- Tab line, where there are no labels
    TabLineFill { bg = palette.darkgrey },

    RedrawDebugNormal { gui = "reverse" },
    RedrawDebugClear { bg = "yellow" },
    RedrawDebugComposed { bg = "green" },
    RedrawDebugRecompose { bg = "red" },

    -- [ diagnostic ]
    -- See :h diagnostic-highlights
    DiagnosticError { fg = "red" },
    DiagnosticWarn { fg = "orange" },
    DiagnosticInfo { fg = "lightblue" },
    DiagnosticHint { fg = "lightgrey" },
    DiagnosticVirtualTextError { DiagnosticError },
    DiagnosticVirtualTextWarn { DiagnosticWarn },
    DiagnosticVirtualTextInfo { DiagnosticInfo },
    DiagnosticVirtualTextHint { DiagnosticHint },
    -- See |vim.diagnostic.open_float()|
    DiagnosticFloatingError { DiagnosticError },
    DiagnosticFloatingWarn { DiagnosticWarn },
    DiagnosticFloatingInfo { DiagnosticInfo },
    DiagnosticFloatingHint { DiagnosticHint },
    -- Used for signs in sign column.
    DiagnosticSignError { DiagnosticError },
    DiagnosticSignWarn { DiagnosticWarn },
    DiagnosticSignInfo { DiagnosticInfo },
    DiagnosticSignHint { DiagnosticHint },
    DiagnosticUnderlineError { sp = "red", gui = "underline" },
    DiagnosticUnderlineWarn { sp = "orange", gui = "underline" },
    DiagnosticUnderlineInfo { sp = "lightblue", gui = "underline" },
    DiagnosticUnderlineHint { sp = "lightgrey", gui = "underline" },

    -- [ nvim ]
    NvimInvalid { Error },
    NvimInternalError { NvimInvalid },
    NvimFigureBrace { NvimInternalError },
    NvimInvalidSingleQuotedUnknownEscape { NvimInternalError },
    NvimInvalidSpacing { ErrorMsg },
    NvimSingleQuotedUnknownEscape { NvimInternalError },
    NvimNumber { Number },
    NvimSpacing { Normal },
    NvimString { String },
    NvimIdentifier { Identifier },
    NvimAssignment { Operator },
    NvimOperator { Operator },
    NvimNumberPrefix { Type },
    NvimOptionSigil { Type },
    NvimParenthesis { Delimiter },
    NvimColon { Delimiter },
    NvimComma { Delimiter },
    NvimArrow { Delimiter },

    -- [ lsp ]
    -- See :h lsp-highlight
    --
    -- LspReferenceText            { } , -- used for highlighting "text" references
    -- LspReferenceRead            { } , -- used for highlighting "read" references
    -- LspReferenceWrite           { } , -- used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- [ treesitter ]
    -- See :h nvim-treesitter-highlights
    TSAnnotation { PreProc },
    TSAttribute { PreProc },
    TSBoolean { Boolean },
    TSCharacter { Character },
    TSComment { Comment },
    TSConditional { Conditional },
    TSConstBuiltin { Special },
    TSConstMacro { Define },
    TSConstant { Constant },
    TSConstructor { Special },
    TSDanger { WarningMsg },
    TSEmphasis { gui = "italic" },
    TSEnvironment { Macro },
    TSEnvironmentName { Type },
    -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    TSException { Exception },
    TSField { Identifier },
    TSFloat { Float },
    TSFuncBuiltin { Special },
    TSFuncMacro { Macro },
    TSFunction { Function },
    TSInclude { Include },
    TSKeyword { Keyword },
    TSKeywordFunction { Keyword },
    -- TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    -- TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
    TSLabel { Label },
    TSLiteral { String },
    TSMath { Special },
    TSMethod { Function },
    TSNamespace { Include },
    TSNone { fg = "foreground" },
    -- TSNote               { } , -- Text representation of an informational note.
    TSNumber { Number },
    TSOperator { Operator },
    TSParameter { Identifier },
    -- TSParameterReference { } , -- References to parameters of a function.
    TSProperty { Identifier },
    TSPunctBracket { Delimiter },
    TSPunctDelimiter { Delimiter },
    TSPunctSpecial { Delimiter },
    TSRepeat { Repeat },
    TSStrike { gui = "strikethrough" },
    TSString { String },
    -- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
    TSStringRegex { String },
    -- TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
    TSStrong { gui = "bold" },
    TSSymbol { Identifier },
    -- TSTag                { } , -- Tags like HTML tag names.
    -- TSTagAttribute       { } , -- HTML tag attributes.
    TSTagDelimiter { Delimiter },
    TSText { TSNone },
    TSTextReference { Constant },
    TSTitle { Title },
    TSType { Type },
    TSTypeBuiltin { Type },
    TSURI { Underlined },
    TSUnderline { gui = "underline" },
    -- TSVariable           { } , -- Variable names that don't fit into other categories.
    TSVariableBuiltin { Special },
    TSWarning { Todo },

    -- [ syntax:lua ]
    luaParenError { Error },
    luaBraceError { Error },
    luaError { Error },
    luaTodo { Todo },
    luaString2 { String },
    luaString { String },
    luaConstant { Constant },
    luaNumber { Number },
    luaFunction { Function },
    luaFunc { Identifier },
    luaElse { Conditional },
    luaCond { Conditional },
    luaStatement { Statement },
    luaRepeat { Repeat },
    luaFor { Repeat },
    luaIn { Operator },
    luaOperator { Operator },
    luaTable { Structure },
    luaComment { Comment },

    -- [ plugin:telescope ]
    TelescopePromptCounter { NonText },
    TelescopePreviewHyphen { NonText },
    TelescopeResultsDiffUntracked { NonText },
    TelescopePreviewMatch { Search },
    TelescopePreviewDirectory { Directory },
    TelescopePreviewDate { Directory },
    TelescopeResultsLineNr { LineNr },
    TelescopeSelection { Visual },
    TelescopePreviewLine { TelescopeSelection },
    TelescopeResultsDiffAdd { DiffAdd },
    TelescopeResultsDiffChange { DiffChange },
    TelescopeResultsDiffDelete { DiffDelete },
    TelescopeNormal { Normal },
    TelescopePreviewExecute { String },
    TelescopePreviewSize { String },
    TelescopePreviewPipe { Constant },
    TelescopePreviewCharDev { Constant },
    TelescopePreviewBlock { Constant },
    TelescopePreviewRead { Constant },
    TelescopePreviewUser { Constant },
    TelescopePreviewGroup { Constant },
    TelescopeResultsConstant { Constant },
    TelescopeResultsNumber { Number },
    TelescopeResultsClass { Function },
    TelescopeResultsField { Function },
    TelescopeResultsFunction { Function },
    TelescopeMultiIcon { Identifier },
    TelescopePromptPrefix { Identifier },
    TelescopeResultsIdentifier { Identifier },
    TelescopePreviewSocket { Statement },
    TelescopePreviewWrite { Statement },
    TelescopeResultsOperator { Operator },
    TelescopePreviewSticky { Keyword },
    TelescopeMultiSelection { Type },
    TelescopeMatching { Special },
    TelescopePreviewLink { Special },
    TelescopeResultsComment { Comment },

    -- [ plugin:gitgutter ]
    GitGutterAdd { bg = palette.darkgrey, fg = palette.green },
    GitGutterChange { bg = palette.darkgrey, fg = palette.blue },
    GitGutterDelete { bg = palette.darkgrey, fg = palette.deep_salmon },
    GitGutterChangeDelete { bg = palette.darkgrey, fg = palette.purple },

    -- [ plugin:gitsigns ]
    GitSignsAddInline { TermCursor },
    GitSignsDeleteInline { TermCursor },
    GitSignsChangeInline { TermCursor },
    GitSignsCurrentLineBlame { NonText },
    GitSignsAddLn { DiffAdd },
    GitSignsChangeLn { DiffChange },
    GitSignsDeleteLn { DiffDelete },
    GitSignsAdd { GitGutterAdd },
    GitSignsChange { GitGutterChange },
    GitSignsDelete { GitGutterDelete },

    -- [ plugin:lualine ]
    -- lualine_b_inactive { bg = hsl("#30302c"), fg = hsl("#666656") },
    -- lualine_c_inactive { bg = "#30302c", fg = "#666656" },
    -- lualine_a_inactive { bg = "#30302c", gui = "bold", fg = "#808070" },
    -- lualine_b_normal { bg = "#4e4e43", fg = "#e8e8d3" },
    -- lualine_c_normal { bg = "#30302c", fg = "#808070" },
    -- lualine_a_normal { bg = "#87afaf", gui = "bold", fg = "#30302c" },
    -- lualine_b_replace { bg = "#4e4e43", fg = "#e8e8d3" },
    -- lualine_a_replace { bg = "#df5f87", gui = "bold", fg = "#30302c" },
    -- lualine_b_insert { bg = "#4e4e43", fg = "#e8e8d3" },
    -- lualine_a_insert { bg = "#87af87", gui = "bold", fg = "#30302c" },
    -- lualine_b_visual { bg = "#4e4e43", fg = "#e8e8d3" },
    -- lualine_a_visual { bg = "#d7afaf", gui = "bold", fg = "#30302c" },
    -- lualine_b_diff_added_normal { bg = "#4e4e43", fg = "#98bc99" },
    -- lualine_b_diff_added_insert { bg = "#4e4e43", fg = "#98bc99" },
    -- lualine_b_diff_added_visual { bg = "#4e4e43", fg = "#98bc99" },
    -- lualine_b_diff_added_replace { bg = "#4e4e43", fg = "#98bc99" },
    -- lualine_b_diff_added_command { bg = "#4e4e43", fg = "#98bc99" },
    -- lualine_b_diff_added_terminal { bg = "#4e4e43", fg = "#98bc99" },
    -- lualine_b_diff_added_inactive { bg = "#30302c", fg = "#98bc99" },
    -- lualine_b_diff_modified_normal { bg = "#4e4e43", fg = "#719cdf" },
    -- lualine_b_diff_modified_insert { bg = "#4e4e43", fg = "#719cdf" },
    -- lualine_b_diff_modified_visual { bg = "#4e4e43", fg = "#719cdf" },
    -- lualine_b_diff_modified_replace { bg = "#4e4e43", fg = "#719cdf" },
    -- lualine_b_diff_modified_command { bg = "#4e4e43", fg = "#719cdf" },
    -- lualine_b_diff_modified_terminal { bg = "#4e4e43", fg = "#719cdf" },
    -- lualine_b_diff_modified_inactive { bg = "#30302c", fg = "#719cdf" },
    -- lualine_b_diff_removed_normal { bg = "#4e4e43", fg = "#e12672" },
    -- lualine_b_diff_removed_insert { bg = "#4e4e43", fg = "#e12672" },
    -- lualine_b_diff_removed_visual { bg = "#4e4e43", fg = "#e12672" },
    -- lualine_b_diff_removed_replace { bg = "#4e4e43", fg = "#e12672" },
    -- lualine_b_diff_removed_command { bg = "#4e4e43", fg = "#e12672" },
    -- lualine_b_diff_removed_terminal { bg = "#4e4e43", fg = "#e12672" },
    -- lualine_b_diff_removed_inactive { bg = "#30302c", fg = "#e12672" },
    -- lualine_b_diagnostics_error_normal { bg = "#4e4e43", fg = "#ff0000" },
    -- lualine_b_diagnostics_error_insert { bg = "#4e4e43", fg = "#ff0000" },
    -- lualine_b_diagnostics_error_visual { bg = "#4e4e43", fg = "#ff0000" },
    -- lualine_b_diagnostics_error_replace { bg = "#4e4e43", fg = "#ff0000" },
    -- lualine_b_diagnostics_error_command { bg = "#4e4e43", fg = "#ff0000" },
    -- lualine_b_diagnostics_error_terminal { bg = "#4e4e43", fg = "#ff0000" },
    -- lualine_b_diagnostics_error_inactive { bg = "#30302c", fg = "#ff0000" },
    -- lualine_b_diagnostics_warn_normal { bg = "#4e4e43", fg = "#ffa500" },
    -- lualine_b_diagnostics_warn_insert { bg = "#4e4e43", fg = "#ffa500" },
    -- lualine_b_diagnostics_warn_visual { bg = "#4e4e43", fg = "#ffa500" },
    -- lualine_b_diagnostics_warn_replace { bg = "#4e4e43", fg = "#ffa500" },
    -- lualine_b_diagnostics_warn_command { bg = "#4e4e43", fg = "#ffa500" },
    -- lualine_b_diagnostics_warn_terminal { bg = "#4e4e43", fg = "#ffa500" },
    -- lualine_b_diagnostics_warn_inactive { bg = "#30302c", fg = "#ffa500" },
    -- lualine_b_diagnostics_info_normal { bg = "#4e4e43", fg = "#add8e6" },
    -- lualine_b_diagnostics_info_insert { bg = "#4e4e43", fg = "#add8e6" },
    -- lualine_b_diagnostics_info_visual { bg = "#4e4e43", fg = "#add8e6" },
    -- lualine_b_diagnostics_info_replace { bg = "#4e4e43", fg = "#add8e6" },
    -- lualine_b_diagnostics_info_command { bg = "#4e4e43", fg = "#add8e6" },
    -- lualine_b_diagnostics_info_terminal { bg = "#4e4e43", fg = "#add8e6" },
    -- lualine_b_diagnostics_info_inactive { bg = "#30302c", fg = "#add8e6" },
    -- lualine_b_diagnostics_hint_normal { bg = "#4e4e43", fg = "#d3d3d3" },
    -- lualine_b_diagnostics_hint_insert { bg = "#4e4e43", fg = "#d3d3d3" },
    -- lualine_b_diagnostics_hint_visual { bg = "#4e4e43", fg = "#d3d3d3" },
    -- lualine_b_diagnostics_hint_replace { bg = "#4e4e43", fg = "#d3d3d3" },
    -- lualine_b_diagnostics_hint_command { bg = "#4e4e43", fg = "#d3d3d3" },
    -- lualine_b_diagnostics_hint_terminal { bg = "#4e4e43", fg = "#d3d3d3" },
    -- lualine_b_diagnostics_hint_inactive { bg = "#30302c", fg = "#d3d3d3" },

    -- [ plugin:beacon.nvim ]
    BeaconDefault { bg = "white" },
    Beacon { BeaconDefault },

    -- [ plugin:zen-mode.nvim ]
    ZenBg { bg = palette.black, fg = palette.black },

    -- [ plugin:nvim-cmp ]
    CmpItemAbbrDefault { fg = palette.deep_black },
    CmpItemAbbr { CmpItemAbbrDefault },
    CmpItemAbbrDeprecatedDefault { fg = palette.green },
    CmpItemAbbrDeprecated { CmpItemAbbrDeprecatedDefault },
    CmpItemAbbrMatchDefault { fg = palette.darkgrey },
    CmpItemAbbrMatch { CmpItemAbbrMatchDefault },
    CmpItemAbbrMatchFuzzyDefault { fg = palette.darkgrey },
    CmpItemAbbrMatchFuzzy { CmpItemAbbrMatchFuzzyDefault },
    CmpItemKindDefault { fg = hsl("#ffbd98") },
    CmpItemMenuDefault { fg = palette.darkgrey },
    CmpItemMenu { CmpItemMenuDefault },

    -- [ plugin:cheatsheet.nvim ]
    cheatDescription { String },
    cheatCode { Statement },
    cheatSeparator { Keyword },
    cheatMetadataTag { Include },
    cheatMetadataSection { Structure },
    cheatComment { Comment },
    cheatMetadataComment { Comment },

    -- TODO: unknown origin
    diffLine { Constant },
    diffAdded { fg = palette.green },
    diffRemoved { fg = palette.salmon },
    ShadeBrightnessPopup { Number },
    IndentGuidesOdd { bg = palette.darkgrey.lighten(10) },
    IndentGuidesEven { bg = palette.darkgrey },
    -- SignifySignAdd { bg = "#333233", fg = "#98bc99" },
    -- SignifySignChange { bg = "#333233", fg = "#719cdf" },
    -- SignifySignDelete { bg = "#333233", fg = "#e12672" },
    ExtraWhitespace { bg = palette.darkgrey },
    ShadeOverlay { bg = "none", gui = "nocombine" },
  }
end)

return theme

-- vi:nowrap
