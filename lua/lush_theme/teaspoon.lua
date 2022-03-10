--
-- Built with Lush. Enable lush.ify on this file:
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

-- palette
local palette = {
  special = hsl("#707070"),
}

-- LSP/Linters get confused here.
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    Normal { bg = hsl("#252525"), fg = hsl("#d9d9d9") },
    -- Visual mode selection
    Visual { bg = hsl("#000000"), fg = hsl("#fddd99"), gui="standout" },
    -- Visual mode selection when vim is "Not Owning the Selection".
    VisualNOS { Visual },
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- NormalNC     { }, -- normal text in non-current windows
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.


    -- (preferred) any constant
    Constant { fg = hsl("#6fbcbd") },
    -- A string constant: "this is a string"
    String { fg = hsl("#98bcbd") },
    -- A character constant: 'c', '\n'
    Character { fg = hsl("#e09b99") },
    -- A number constant: 234, 0xff
    Number { fg = hsl("#ffdd99") },
    -- A boolean constant: TRUE, false
    Boolean { fg = hsl("#99aabb") },
    -- A floating point constant: 2.3e10
    Float { Number },

    -- (preferred) any variable name
    Identifier { fg = hsl("#ffbfbd") },
    -- Function       { }, -- function name (also: methods for classes)
    Function { fg = hsl("#dfdebd") },

    -- (preferred) any statement
    Statement { gui = "bold", fg = hsl("#98bc99") },
    -- if, then, else, endif, switch, etc.
    Conditional { fg = hsl("#98bede") },
    -- Repeat         { }, --   for, do, while, etc.
    Repeat { fg = hsl("#719cdf") },
    -- case, default, etc.
    Label { Statement },
    -- "sizeof", "+", "*", etc.
    Operator { fg = hsl("#dedd99") },
    -- Any other keyword
    Keyword { fg = hsl("#e17899") },
    -- try, catch, throw
    Exception { fg = hsl("#ee4455") },

    -- (preferred) generic Preprocessor
    PreProc { fg = hsl("#bdbb72") },
    -- preprocessor #include
    Include { fg = hsl("#e19972") },
    -- preprocessor #define
    Define { Include },
    -- same as Define
    Macro { Include },
    -- preprocessor #if, #else, #endif, etc.
    PreCondit { Include },

    -- (preferred) int, long, char, etc.
    Type { gui = "bold", fg = hsl("#dfbc72") },
    -- static, register, volatile, etc.
    StorageClass { Type },
    -- struct, union, enum, etc.
    Structure { fg = hsl("#77ddff") },
    -- A typedef
    Typedef { Type },

    -- (preferred) any special symbol
    Special { fg = hsl("#ffbd98") },
    -- special character in a constant
    SpecialChar { Special },
    -- can use CTRL-] on this
    Tag { Special },
    -- character that needs attention
    Delimiter { fg = hsl("#be9873") },
    StringDelimiter { Delimiter },
    -- special things inside a comment
    SpecialComment { Special },
    -- debugging statements
    Debug { Special },

    -- (preferred) text that stands out, HTML links
    -- seoul was hsl("#e0bebc")
    Underlined { gui = "underline", fg = hsl("#88aaee"), sp = hsl("#88aaee").darken(10) },
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- (preferred) left blank, hidden  |hl-Ignore|
    Ignore { bg = hsl("#252525"), fg = hsl("#4b4b4b") },

    -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Todo { bg = hsl("#060606"), fg = hsl(340, 90, 66) },

    -- Any comment
    -- seoul is hsl("#719872")
    Comment { fg = hsl(30, 10, 50) },
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    -- See |pi_paren.txt|
    MatchParen { bg = hsl("#4b4b4b") },


    -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpecialKey { fg = palette.special },
    -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
    -- See also |hl-EndOfBuffer|.
    NonText { gui = "bold", fg = SpecialKey.fg },
    -- Filler lines (~) after the end of the buffer.
    EndOfBuffer { NonText },
    -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Whitespace { NonText },

    -- Directory names (and other special names in listings)
    Directory { fg = hsl("#dfdebd") },


    -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    IncSearch { bg = hsl("#333233"), gui = "reverse", fg = hsl("#ffdd00") },
    -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    Search { bg = IncSearch.fg.rotate(140), fg = IncSearch.bg },

    QuickFixLine { Search },
    Substitute { Search },

    -- current match in 'wildmenu' completion
    WildMenu { bg = hsl("#dedc00"), fg = hsl("#9a7372") },


    -- [ messages ]
    -- Any erroneous construct
    Error { bg = hsl("#730b00"), fg = Normal.fg },
    -- Error messages on the command line
    ErrorMsg { Error },


    -- |more-prompt|
    MoreMsg { gui = "bold", fg = hsl("#e19972") },
    -- 'showmode' message (e.g., "-- INSERT -- ")
    ModeMsg { MoreMsg },

    -- Warning messages
    WarningMsg { fg = hsl("#dfbc72") },

    -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNr { bg = hsl("#333233"), fg = hsl("#999872") },
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
    CursorLine { bg = hsl("#171717") },
    -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorColumn { CursorLine },
    -- Used for the columns set with 'colorcolumn'
    ColorColumn { CursorLine },
    -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineNr { bg = hsl("#171717"), gui = "bold", fg = hsl("#be7572") },


    -- |hit-enter| prompt and yes/no questions
    Question { gui = "bold", fg = hsl("#dfbc72") },

    -- Status line of current window
    StatusLine { fg = hsl("#dfdebd"), gui = "bold", bg = hsl("#9a7372") },
    MsgSeparator { StatusLine },
    -- Status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    StatusLineNC { fg = hsl("#dfdebd"), bg = hsl("#3f3f3f") },
    StatusLineTerm { StatusLine },
    StatusLineTermNC { StatusLineNC },

    -- The column separating vertically split windows
    VertSplit { fg = hsl("#060606"), bg = hsl("#060606") },

    -- [ floatingwindow ]
    -- Normal text in floating windows.
    NormalFloat { CursorLine },
    FloatBorder { VertSplit },
    FloatShadow { bg = hsl("#000000"), blend = "80" },
    FloatShadowThrough { bg = FloatShadow.bg, blend = "100" },



    -- Titles for output from ":set all", ":autocmd" etc.
    Title { gui = "bold", fg = hsl("#e0bebc") },

    -- Line used for closed folds
    Folded { bg = hsl("#333233"), fg = hsl("#999872") },
    -- 'foldcolumn'
    FoldColumn { bg = Folded.bg, fg = Folded.fg.lighten(30) },

    -- [ mode:diff ]
    -- Added line |diff.txt|
    DiffAdd { bg = hsl("#006f00") },
    -- Changed line |diff.txt|
    DiffChange { bg = hsl("#4b4b4b") },
    -- Deleted line |diff.txt|
    DiffDelete { bg = hsl("#9a7372"), },
    -- Changed text within a changed line |diff.txt|
    DiffText { bg = hsl("#730b00"), gui = "bold" },

    -- column where |signs| are displayed
    SignColumn { bg = hsl("#252525"), fg = hsl("#e19972") },

    -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Conceal { bg = hsl("#171717"), fg = hsl("#e9e9e9") },

    -- [ spellchecker ]
    -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellBad { sp = hsl("#FF5555"), gui = "undercurl" },
    -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellCap { sp = hsl("#5555FF"), gui = "undercurl" },
    -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    SpellRare { sp = hsl("#991177"), gui = "undercurl" },
    -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellLocal { sp = hsl("#55BBff"), gui = "undercurl" },

    -- [ popupmenu ]
    -- Popup menu: normal item.
    Pmenu { bg = hsl("#ffdfdf"), fg = hsl("#333233") },
    -- Popup menu: selected item.
    PmenuSel { bg = hsl("#9b1d72"), fg = hsl("#d9d9d9") },
    -- Popup menu: scrollbar.
    PmenuSbar { bg = hsl("#719872") },
    -- Popup menu: Thumb of the scrollbar.
    PmenuThumb { bg = hsl("#007173") },


    -- [ tabline ]
    -- Tab line, not active tab page label
    TabLine { bg = hsl("#565656"), gui = "underline" },
    -- Tab line, active tab page label
    TabLineSel { bg = hsl("#007173"), gui = "bold", fg = hsl("#dfdebd") },
    -- Tab line, where there are no labels
    TabLineFill { gui = "reverse", fg = hsl("#3f3f3f") },

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
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
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

    -- [ syntax:ruby ]
    rubyClass { fg = hsl("#0099bd") },
    rubyRegexp { fg = hsl("#dedd99") },
    rubyRegexpDelimiter { fg = hsl("#e17899") },
    rubyArrayDelimiter { fg = hsl("#7299bc") },
    rubyBlockParameterList { fg = hsl("#dedd99") },
    rubyCurlyBlockDelimiter { fg = hsl("#bdbc98") },
    rubyPredefinedIdentifier { fg = hsl("#ffffdf") },

    -- [ plugin:telescope ]
    TelescopePromptCounter { NonText },
    TelescopePreviewHyphen { NonText },
    TelescopeResultsDiffUntracked { NonText },
    TelescopePreviewMatch { Search },
    TelescopePreviewDirectory { Directory },
    TelescopePreviewDate { Directory },
    TelescopeResultsLineNr { LineNr },
    TelescopeSelection { Visual },
    TelescopePreviewLine { Visual },
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
    GitGutterAdd { bg = hsl("#333233"), fg = hsl("#98bc99") },
    GitGutterChange { bg = hsl("#333233"), fg = hsl("#719cdf") },
    GitGutterDelete { bg = hsl("#333233"), fg = hsl("#e12672") },
    GitGutterChangeDelete { bg = hsl("#333233"), fg = hsl("#e17899") },

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
    ZenBg { bg = hsl("#232323"), fg = hsl("#232323") },

    -- [ plugin:nvim-cmp ]
    CmpItemAbbrDefault { fg = hsl("#333233") },
    CmpItemAbbr { CmpItemAbbrDefault },
    CmpItemAbbrDeprecatedDefault { fg = hsl("#719872") },
    CmpItemAbbrDeprecated { CmpItemAbbrDeprecatedDefault },
    CmpItemAbbrMatchDefault { fg = hsl("#333233") },
    CmpItemAbbrMatch { CmpItemAbbrMatchDefault },
    CmpItemAbbrMatchFuzzyDefault { fg = hsl("#333233") },
    CmpItemAbbrMatchFuzzy { CmpItemAbbrMatchFuzzyDefault },
    CmpItemKindDefault { fg = hsl("#ffbd98") },
    CmpItemMenuDefault { fg = hsl("#333233") },
    CmpItemMenu { CmpItemMenuDefault },


    -- [ plugin:cheatsheet.nvim ]
    cheatDescription { String },
    cheatCode { Statement },
    cheatSeparator { Keyword },
    cheatMetadataTag { Include },
    cheatMetadataSection { Structure },
    cheatComment { Comment },
    cheatMetadataComment { Comment },


    -- [ plugin:ale ]
    -- TODO: remove?
    ALEErrorSign { bg = hsl("#252525"), fg = hsl("#e12672") },
    ALEWarningSign { bg = hsl("#252525"), fg = hsl("#e09b99") },


    -- TODO: unknown origin
    diffLine { Constant },
    diffAdded { fg = hsl("#98bc99") },
    diffRemoved { fg = hsl("#e09b99") },
    ShadeBrightnessPopup { Number },
    IndentGuidesOdd { bg = hsl("#171717") },
    IndentGuidesEven { bg = hsl("#333233") },
    -- SignifySignAdd { bg = "#333233", fg = "#98bc99" },
    -- SignifySignChange { bg = "#333233", fg = "#719cdf" },
    -- SignifySignDelete { bg = "#333233", fg = "#e12672" },
    ExtraWhitespace { bg = hsl("#171717") },
    ShadeOverlay { bg = "none", gui = "nocombine" },
    -- colorizer_mb_a3cff5 { bg = hsl("#a3cff5"), fg = "black" },
  }
end)

return theme

-- vi:nowrap
