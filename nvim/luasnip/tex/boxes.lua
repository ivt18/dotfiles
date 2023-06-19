local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {

s({trig="qs", dscr="Question environment"},
    fmta(
        "\\qs{<>}{<>}",
        {
            i(1),
            i(2),
        }
    ),
    {condition = line_begin}
),

}
