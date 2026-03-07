local c = require("colors")

local set = vim.api.nvim_set_hl

local highlights = {
  -- Vim Basic color mapping
  Normal      = { fg = c.foreground, bg = c.background },
  NormalFloat = { fg = c.foreground, bg = c.background },

  Comment     = { fg = c.color8, italic = true },

  Constant          = { fg = c.color9 },
  String            = { fg = c.color2 },
  Character         = { fg = c.color2 },
  Number            = { fg = c.color9 },
  Boolean           = { fg = c.color9 },

  Identifier        = { fg = c.color4 },
  Function          = { fg = c.color4 },

  Statement         = { fg = c.color5 },
  Keyword           = { fg = c.color5 },
  Conditional       = { fg = c.color5 },
  Repeat            = { fg = c.color5 },

  Type              = { fg = c.color3 },

  CursorLine        = { fg = c.color0 },
  Visual            = { fg = c.color1, bg = c.color14 },

  LineNr            = { fg = c.color8 },
  CursorLineNr      = { fg = c.color3, bold = true },

  -- Treesitter
  ["@comment"]        = { fg = c.color8, italic = true },

  ["@string"]         = { fg = c.color2 },
  ["@character"]      = { fg = c.color2 },
  ["@number"]         = { fg = c.color9 },
  ["@boolean"]        = { fg = c.color9 },

  ["@function"]       = { fg = c.color4 },
  ["@function.call"]  = { fg = c.color4 },

  ["@keyword"]        = { fg = c.color5 },
  ["@keyword.return"] = { fg = c.color5 },

  ["@type"]           = { fg = c.color3 },
  ["@type.builtin"]   = { fg = c.color3 },

  ["@variable"]       = { fg = c.foreground },
  ["@parameter"]      = { fg = c.color7 },

  ["@field"]          = { fg = c.color4 },
  ["@property"]       = { fg = c.color4 },

  -- LSP
  ["@lsp.type.function"]   = { fg = c.color4 },
  ["@lsp.type.method"]     = { fg = c.color4 },
  ["@lsp.type.parameter"]  = { fg = c.color7 },
  ["@lsp.type.variable"]   = { fg = c.foreground },
  ["@lsp.type.property"]   = { fg = c.color4 },
  ["@lsp.type.enumMember"] = { fg = c.color3 },

  -- Diagnostics
  DiagnosticError = { fg = c.color14 },
  DiagnosticWarn  = { fg = c.color12 },
  DiagnosticInfo  = { fg = c.color11 },
  DiagnosticHint  = { fg = c.color9 },

  DiagnosticUnderlineError = { undercurl = true, sp = c.color14 },
  DiagnosticUnderlineWarn  = { undercurl = true, sp = c.color12 },
  DiagnosticUnderlineInfo  = { undercurl = true, sp = c.color11 },
  DiagnosticUnderlineHint  = { undercurl = true, sp = c.color9 },

  -- Popup menu
  Pmenu      = { fg = c.foreground, bg = c.color0 },
  PmenuSel   = { fg = c.background, bg = c.color4 },
  PmenuSbar  = { fg = c.color0 },
  PmenuThumb = { bg = c.c8 },

  -- nvim-cmp
  CmpItemAbbr = { fg = c.foreground },
  CmpItemAbbrMatch = { fg = c.color4, bold = true },

  CmpItemKindFunction = { fg = c.color4 },
  CmpItemKindMethod = { fg = c.color4 },

  CmpItemKindVariable = { fg = c.color7 },
  CmpItemKindField = { fg = c.color7 },

  CmpItemKindClass = { fg = c.color3 },
  CmpItemKindInterface = { fg = c.color3 },

  CmpItemKindKeyword = { fg = c.color5 },
}

for group, opts in pairs(highlights) do
  set(0, group, opts)
end
