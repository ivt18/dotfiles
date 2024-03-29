-- Necessary abbreviations
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- Some LaTeX-specific conditional expansion functions
local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- For visual snippets
local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else  -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {

s({trig = "itt", snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\textit{<>}",
        {
            d(1, get_visual),
        }
    )
),

s({trig = "udd", snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\underline{<>}",
        {
            d(1, get_visual),
        }
    )
),

s({trig = "bdd", snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\textbf{<>}",
        {
            d(1, get_visual),
        }
    )
),

s({trig = 'xtt', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\texttt{<>}",
        {
            d(1, get_visual),
        }
    )
),

s({trig = 'phh', snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "\\emph{<>}",
        {
            d(1, get_visual),
        }
    )
),

}
