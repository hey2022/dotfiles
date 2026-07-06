local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local function w(context, nodes, opts)
    if type(context) ~= "string" and context.trig and context.snippetType == "autosnippet" then
        context.trig = ";" .. context.trig
    end
    return s(context, nodes, opts)
end

ls.add_snippets("cpp", {
    w(
        "cpt",
        fmt(
            [[
        #include <bits/stdc++.h>
        using namespace std;

        #ifdef LOCAL
        #include "dbg.h"
        #else
        #define dbg(...) __VA_ARGS__
        #endif

        void solve() {{
            {}
        }}

        int main() {{
            ios::sync_with_stdio(false);
            cin.tie(nullptr);
            solve();
            cout << flush;
            return 0;
        }}
        ]],
            i(0)
        )
    ),
    w("d4", {
        t({
            "const int dx[] = { 0,  1,  0, -1};",
            "const int dy[] = {-1,  0,  1,  0};",
        }),
    }),
    w("d8", {
        t({
            "const int dx[] = { 0,  1,  1,  1,  0, -1, -1, -1};",
            "const int dy[] = {-1, -1,  0,  1,  1,  1,  0, -1};",
        }),
    }),
    w(
        "bounds_check",
        fmt(
            [[
        if ({} >= 0 && {} < {} && {} >= 0 && {} < {}) {{
            {}
        }}
        ]],
            {
                i(1, "nx"),
                rep(1),
                i(2, "w"),
                i(3, "ny"),
                rep(3),
                i(4, "h"),
                i(0),
            }
        )
    ),
    w({ trig = "ll", snippetType = "autosnippet" }, t("long long")),
    w({ trig = "ull", snippetType = "autosnippet" }, t("unsigned long long")),
    w({ trig = "dbl", snippetType = "autosnippet" }, t("double")),
    w({ trig = "ldb", snippetType = "autosnippet" }, t("long double")),
    w({ trig = "str", snippetType = "autosnippet" }, t("string ")),

    w({ trig = "pair", snippetType = "autosnippet" }, fmt("pair<{}, {}> {}", { i(1), i(2), i(0) })),
    w({ trig = "arr", snippetType = "autosnippet" }, fmt("arr<{}> {}", { i(1), i(0) })),
    w({ trig = "vec", snippetType = "autosnippet" }, fmt("vector<{}> {}", { i(1), i(0) })),
    w({ trig = "vi", snippetType = "autosnippet" }, t("vector<int>")),
    w({ trig = "vl", snippetType = "autosnippet" }, t("vector<long long>")),
    w({ trig = "vd", snippetType = "autosnippet" }, t("vector<long double>")),
    w({ trig = "vb", snippetType = "autosnippet" }, t("vector<bool>")),
    w({ trig = "vs", snippetType = "autosnippet" }, t("vector<string>")),
    w({ trig = "vc", snippetType = "autosnippet" }, t("vector<char>")),

    w({ trig = "vvi", snippetType = "autosnippet" }, t("vector<vector<int>>")),
    w({ trig = "vvl", snippetType = "autosnippet" }, t("vector<vector<long long>>")),
    w({ trig = "vvd", snippetType = "autosnippet" }, t("vector<vector<long double>>")),
    w({ trig = "vvb", snippetType = "autosnippet" }, t("vector<vector<bool>>")),
    w({ trig = "vvs", snippetType = "autosnippet" }, t("vector<vector<string>>")),
    w({ trig = "vvc", snippetType = "autosnippet" }, t("vector<vector<char>>")),
    w(
        { trig = "iff", snippetType = "autosnippet" },
        fmt(
            [[
        if ({}) {{
            {}
        }}
        ]],
            {
                i(1, "cond"),
                i(2),
            }
        )
    ),
    w(
        { trig = "ife", snippetType = "autosnippet" },
        fmt(
            [[
        if ({}) {{
            {}
        }} else {{
            {}
        }}
        ]],
            {
                i(1, "cond"),
                i(2),
                i(3),
            }
        )
    ),
    w(
        { trig = "whilee", snippetType = "autosnippet" },
        fmt(
            [[
        while ({}) {{
            {}
        }}
        ]],
            {
                i(1, "cond"),
                i(2),
            }
        )
    ),
    w(
        { trig = "forr", snippetType = "autosnippet" },
        fmt(
            [[
        for (int {} = {}; {} < {}; ++{}) {{
            {}
        }}
    ]],
            { i(1, "i"), i(2, "0"), rep(1), i(3, "n"), rep(1), i(0) }
        )
    ),
    w(
        { trig = "for=", snippetType = "autosnippet" },
        fmt(
            [[
        for (int {} = {}; {} <= {}; ++{}) {{
            {}
        }}
    ]],
            { i(1, "i"), i(2, "0"), rep(1), i(3, "n"), rep(1), i(0) }
        )
    ),
    w(
        { trig = "roff", snippetType = "autosnippet" },
        fmt(
            [[
        for (int {} = {} - 1; {} >= {}; --{}) {{
            {}
        }}
    ]],
            { i(1, "i"), i(2, "n"), rep(1), i(3, "0"), rep(1), i(0) }
        )
    ),
    w(
        { trig = "rof=", snippetType = "autosnippet" },
        fmt(
            [[
        for (int {} = {}; {} >= {}; --{}) {{
            {}
        }}
    ]],
            { i(1, "i"), i(2, "n"), rep(1), i(3, "0"), rep(1), i(0) }
        )
    ),
    w(
        { trig = "fore", snippetType = "autosnippet" },
        fmt(
            [[
        for (auto& {} : {}) {{
            {}
        }}
    ]],
            { i(1, "e"), i(2, "c"), i(0) }
        )
    ),
    w({ trig = "all", snippetType = "autosnippet" }, fmt("begin({}), end({}){}", { i(1), rep(1), i(0) })),
    w({ trig = "rall", snippetType = "autosnippet" }, fmt("rbegin({}), rend({}){}", { i(1), rep(1), i(0) })),
    w({ trig = "sz", snippetType = "autosnippet" }, fmt("(int) {}.size(){}", { i(1), i(0) })),

    w({ trig = "pb", snippetType = "autosnippet" }, fmt("push_back({});\n{}", { i(1), i(0) })),
    w({ trig = "epb", snippetType = "autosnippet" }, fmt("emplace_back({});\n{}", { i(1), i(0) })),
    w({ trig = "ff", snippetType = "autosnippet" }, t("first")),
    w({ trig = "ss", snippetType = "autosnippet" }, t("second")),
})
