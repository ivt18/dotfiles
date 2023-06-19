local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {

s({trig = "h1", dscr="Top-level section", snippetType="autosnippet"},
    fmta(
        [[
            \section{<>}
            \label{<>:<>}
        ]],
        {
            i(1),
            i(2),
            i(3)
        }
    ), 
    {condition = line_begin}  -- set condition in the `opts` table
),

s({trig = "h2", dscr="Sub-level section", snippetType="autosnippet"},
    fmta(
        [[
            \subsection{<>}
            \label{<>:<>}
        ]],
        {
            i(1),
            i(2),
            i(3)
        }
    ), 
    {condition = line_begin}  -- set condition in the `opts` table
),

s({trig = "h3", dscr="Sub-sub-level section", snippetType="autosnippet"},
    fmta(
        [[
            \subsubsection{<>}
            \label{<>:<>}
        ]],
        {
            i(1),
            i(2),
            i(3)
        }
    ), 
    {condition = line_begin}  -- set condition in the `opts` table
),

s({trig = "chap", dscr="Chapter", snippetType="autosnippet"},
    fmta(
        [[
            \chapter{<>}
            \label{chap:<>}
        ]],
        {
            i(1),
            i(2)
        }
    ), 
    {condition = line_begin}  -- set condition in the `opts` table
),

s({trig="fig", dscr="A new figure environmennt"},
    fmta(
        [[
            \begin{figure}[<>]
                \centering
                \includegraphics[<>]{<>}
                \caption{<>}
                \label{fig:<>}
            \end{figure}
        ]],
        {
            i(1),
            i(2),
            i(3),
            i(4),
            i(5)
        }
    ),
    {condition = line_begin}
),

s({trig="new", dscr="A generic new environmennt"},
    fmta(
        [[
            \begin{<>}
              <>
            \end{<>}
        ]],
        {
            i(1),
            i(2),
            rep(1),
        }
    ),
    {condition = line_begin}
),

s({trig="eqq", dscr="Equation environment"},
    fmta(
        [[
            \begin{equation}
              <>
            \end{equation}
        ]],
        {
            i(1),
        }
    ),
    {condition = line_begin}
),

}
