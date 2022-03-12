local palette = require("palette")

local colours = {
  black = palette.black.hex,
  green = palette.green.hex,
  blue = palette.blue.hex,
  pink = palette.pink.hex,
  yellow = palette.yellow.hex,
  gray = palette.grey.hex,
  darkgrey = palette.darkgrey.hex,
  deep_grey = palette.deep_grey.hex,
}

return {
  normal = {
    a = { bg = colours.blue, fg = colours.black, gui = "bold" },
    b = { bg = colours.deep_grey, fg = colours.yellow },
    c = { bg = colours.darkgrey, fg = colours.grey },
  },
  insert = {
    a = { bg = colours.green, fg = colours.black, gui = "bold" },
    b = { bg = colours.deep_grey, fg = colours.yellow },
    c = { bg = colours.darkgrey, fg = colours.grey },
  },
  visual = {
    a = { bg = colours.pink, fg = colours.black, gui = "bold" },
    b = { bg = colours.deep_grey, fg = colours.yellow },
    c = { bg = colours.darkgrey, fg = colours.grey },
  },
  replace = {
    a = { bg = colours.orange, fg = colours.black, gui = "bold" },
    b = { bg = colours.deep_grey, fg = colours.yellow },
    c = { bg = colours.darkgrey, fg = colours.grey },
  },
  command = {
    a = { bg = colours.yellow, fg = colours.black, gui = "bold" },
    b = { bg = colours.deep_grey, fg = colours.yellow },
    c = { bg = colours.darkgrey, fg = colours.grey },
  },
  inactive = {
    a = { bg = colours.darkgrey, fg = colours.grey, gui = "bold" },
    b = { bg = colours.darkgrey, fg = colours.grey },
    c = { bg = colours.darkgrey, fg = colours.grey },
  },
}
