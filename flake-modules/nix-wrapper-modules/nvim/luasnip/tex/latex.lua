-- Upstream snippets https://github.com/iurimateus/luasnip-latex-snippets.nvim/tree/main/lua/luasnip-latex-snippets
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local utils = require("luasnip-latex-snippets.util.utils")
local is_math = utils.with_opts(utils.is_math, true) -- true to use treesitter
local not_math = utils.with_opts(utils.not_math, true) -- true to use treesitter

local function ms(trig, nodes)
    return s(trig, nodes, {
        condition = is_math,
    })
end

ls.add_snippets("tex", {
    ms("vec", fmta("\\vec{<>}", i(1))),
    ms("vv ", t("\\vec{v} ")),
    ms({ trig = "vv(%w)", regTrig = true }, {
        f(function(_, snip)
            return "\\vec{v_" .. snip.captures[1] .. "}"
        end, {}),
    }),
    ms("VVV", t("\\vec{v_1},\\vec{v_2},\\ldots,\\vec{v_n}")),
    ms("s.t.", t("\\text{s.t.}")),
    ms("mtt", fmta("\\mathrm{<>}", i(1))),
}, {
    type = "autosnippets",
})
