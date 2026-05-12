local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("cpp", {
    s(
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
            return 0;
        }}
        ]],
            i(0)
        )
    ),
    s("d4", {
        t({
            "const int dx[] = { 0,  1,  0, -1};",
            "const int dy[] = {-1,  0,  1,  0};",
        }),
    }),
    s("d8", {
        t({
            "const int dx[] = { 0,  1,  1,  1,  0, -1, -1, -1};",
            "const int dy[] = {-1, -1,  0,  1,  1,  1,  0, -1};",
        }),
    }),
    s(
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
    s({ trig = "ll", snippetType = "autosnippet" }, t("long long")),
    s({ trig = "ull", snippetType = "autosnippet" }, t("unsigned long long")),
    s({ trig = "dbl", snippetType = "autosnippet" }, t("double")),
    s({ trig = "ldb", snippetType = "autosnippet" }, t("long double")),
    s({ trig = "str", snippetType = "autosnippet" }, t("string")),

    s({ trig = "pair", snippetType = "autosnippet" }, fmt("pair<{}, {}> {}", { i(1), i(2), i(0) })),
    s({ trig = "arr", snippetType = "autosnippet" }, fmt("arr<{}> {}", { i(1), i(0) })),
    s({ trig = "vec", snippetType = "autosnippet" }, fmt("vector<{}> {}", { i(1), i(0) })),
    s({ trig = "vi", snippetType = "autosnippet" }, t("vector<int>")),
    s({ trig = "vl", snippetType = "autosnippet" }, t("vector<long long>")),
    s({ trig = "vd", snippetType = "autosnippet" }, t("vector<long double>")),
    s({ trig = "vb", snippetType = "autosnippet" }, t("vector<bool>")),
    s({ trig = "vs", snippetType = "autosnippet" }, t("vector<string>")),
    s({ trig = "vc", snippetType = "autosnippet" }, t("vector<char>")),

    s({ trig = "vvi", snippetType = "autosnippet" }, t("vector<vector<int>>")),
    s({ trig = "vvl", snippetType = "autosnippet" }, t("vector<vector<long long>>")),
    s({ trig = "vvd", snippetType = "autosnippet" }, t("vector<vector<long double>>")),
    s({ trig = "vvb", snippetType = "autosnippet" }, t("vector<vector<bool>>")),
    s({ trig = "vvs", snippetType = "autosnippet" }, t("vector<vector<string>>")),
    s({ trig = "vvc", snippetType = "autosnippet" }, t("vector<vector<char>>")),
    s(
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
    s(
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
    s(
        { trig = "while ", snippetType = "autosnippet" },
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
    s(
        { trig = "for", snippetType = "autosnippet" },
        fmt(
            [[
        for (int {} = {}; {} < {}; ++{}) {{
            {}
        }}
    ]],
            { i(1, "i"), i(2, "0"), rep(1), i(3, "n"), rep(1), i(0) }
        )
    ),
    s(
        { trig = "efor", snippetType = "autosnippet" },
        fmt(
            [[
        for (int {} = {}; {} <= {}; ++{}) {{
            {}
        }}
    ]],
            { i(1, "i"), i(2, "0"), rep(1), i(3, "n"), rep(1), i(0) }
        )
    ),
    s(
        { trig = "rof", snippetType = "autosnippet" },
        fmt(
            [[
        for (int {} = {} - 1; {} >= {}; --{}) {{
            {}
        }}
    ]],
            { i(1, "i"), i(2, "n"), rep(1), i(3, "0"), rep(1), i(0) }
        )
    ),
    s(
        { trig = "erof", snippetType = "autosnippet" },
        fmt(
            [[
        for (int {} = {}; {} >= {}; --{}) {{
            {}
        }}
    ]],
            { i(1, "i"), i(2, "n"), rep(1), i(3, "0"), rep(1), i(0) }
        )
    ),
    s(
        { trig = "each", snippetType = "autosnippet" },
        fmt(
            [[
        for (auto& {} : {}) {{
            {}
        }}
    ]],
            { i(1, "e"), i(2, "c"), i(0) }
        )
    ),
    s({ trig = "all", snippetType = "autosnippet" }, fmt("begin({}), end({}){}", { i(1), rep(1), i(0) })),
    s({ trig = "rall", snippetType = "autosnippet" }, fmt("rbegin({}), rend({}){}", { i(1), rep(1), i(0) })),
    s({ trig = "sz", snippetType = "autosnippet" }, fmt("(int) {}.size(){}", { i(1), i(0) })),

    s({ trig = "pb", snippetType = "autosnippet" }, fmt("push_back({});\n{}", { i(1), i(0) })),
    s({ trig = "epb", snippetType = "autosnippet" }, fmt("emplace_back({});\n{}", { i(1), i(0) })),
    s({ trig = "ff", snippetType = "autosnippet" }, t("first")),
    s({ trig = "ss", snippetType = "autosnippet" }, t("second")),
})
