-- For visual snippets
local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else  -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {

s({trig = "bdd", snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "**<>**",
        {
            d(1, get_visual),
        }
    )
),

s({trig = "itt", snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "_<>_",
        {
            d(1, get_visual),
        }
    )
),

s({trig = "udd", snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "<<u>><><</u>>",
        {
            d(1, get_visual),
        }
    )
),

s({trig = "cdd", snippetType="autosnippet", regTrig = false, wordTrig = true},
    fmta(
        "`<>`",
        {
            d(1, get_visual),
        }
    )
),

s({trig = "code", snippetType="autosnippet"},
    fmta(
        [[
            ```<>
            <>
            ```
        ]],
        {
            i(1),
            i(2)
        }
    ),
    {condition = line_begin}
),

}
