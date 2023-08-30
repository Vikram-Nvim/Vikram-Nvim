return {
 'L3MON4D3/LuaSnip',
 config = function()

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

--HTML SNIPPETS
ls.add_snippets("html", {

 s("id", { 
		t('id="'), i(1), t('"')
 }),
 s("c", { 
		t('class="'), i(1), t('"')
 }),
 s("on", { 
		t('onclick="'), i(1), t('"')
 }),
 
})

--CSS SNIPPETS
ls.add_snippets("css", {
 
 s("tr", { 
		t('transform: '), i(1), t(';')
 }),
 s("t", { 
		t('translate('), i(1), t(')')
 }),
 s("tx", { 
		t('translateX('), i(1), t(')')
 }),
 s("ty", { 
		t('translateY('), i(1), t(')')
 }),
 s("g", { 
		t('gap: '), i(1), t(';')
 }),
 
})

--JS SNIPPETS
ls.add_snippets("javascript", {
 
 -- s("id", { 
	-- 	t('id="'), i(1, ""), t('"')
 -- }),
 
})

--REACT SNIPPETS
ls.add_snippets("javascriptreact", {
 
 s("cn", { 
		t('className="'), i(1), t('"')
 }),
 
})

--LUA SNIPPETS
ls.add_snippets("lua", {
 
 s("c", { 
		t({'config = function()'}),
		t({"", " "}), i(1),
		t({"", 'end'}),
 }),

})

 end
}