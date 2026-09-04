local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("def", fmt("def {} ({}):\n    {}", { i(1), i(2), i(3) })),
  s("async", fmt("async def {} ({}):\n    {}", { i(1), i(2), i(3) })),
  s("class", fmt("class {}:\n    def __init__(self, {}):\n        {}", { i(1), i(2), i(3) })),
  s("if", fmt("if {}:\n    {}", { i(1), i(2) })),
  s("else", fmt("else:\n    {}", { i(1) })),
  s("elif", fmt("elif {}:\n    {}", { i(1), i(2) })),
  s("for", fmt("for {} in {}:\n    {}", { i(1), i(2), i(3) })),
  s("while", fmt("while {}:\n    {}", { i(1), i(2) })),
  s("try", fmt("try:\n    {}\nexcept {}:\n    {}", { i(1), i(2), i(3) })),
  s("with", fmt("with {} as {}:\n    {}", { i(1), i(2), i(3) })),
  s("print", fmt("print({})", { i(1) })),
  s("main", fmt("if __name__ == '__main__':\n    {}", { i(1) })),
  s("lambda", fmt("lambda {}: {}", { i(1), i(2) })),
  s("list", fmt("[{} for {} in {}]", { i(1), i(2), i(3) })),
  s("dict", fmt("{{{}: {} for {} in {}}}", { i(1), i(2), i(3), i(4) })),
  s("set", fmt("{{{} for {} in {}}}", { i(1), i(2), i(3) })),
  s("typing", fmt("from typing import {}\n{}", { i(1), i(2) })),
  s("dataclass", fmt("@dataclass\nclass {}:\n    {}", { i(1), i(2) })),
  s("property", fmt("@property\ndef {}(self):\n    {}", { i(1), i(2) })),
  s("staticmethod", fmt("@staticmethod\ndef {} ({}):\n    {}", { i(1), i(2), i(3) })),
  s("classmethod", fmt("@classmethod\ndef {} (cls, {}):\n    {}", { i(1), i(2), i(3) })),
}