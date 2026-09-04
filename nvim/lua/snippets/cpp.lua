local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("main", fmt("int main() {{\n    {}\n    return 0;\n}}", { i(1) })),
  s("fn", fmt("{} {}({}) {{\n    {}\n}}", { i(1), i(2), i(3), i(4) })),
  s("class", fmt("class {} {{\npublic:\n    {}\nprivate:\n    {}\n}};", { i(1), i(2), i(3) })),
  s("struct", fmt("struct {} {{\n    {}\n}};", { i(1), i(2) })),
  s("for", fmt("for ({}; {}; {}) {{\n    {}\n}}", { i(1), i(2), i(3), i(4) })),
  s("while", fmt("while ({}) {{\n    {}\n}}", { i(1), i(2) })),
  s("if", fmt("if ({}) {{\n    {}\n}}", { i(1), i(2) })),
  s("else", fmt("else {{\n    {}\n}}", { i(1) })),
  s("switch", fmt("switch ({}) {{\ncase {}:\n    {}\n    break;\ndefault:\n    {}\n}}", { i(1), i(2), i(3), i(4) })),
  s("try", fmt("try {{\n    {}\n}} catch (const std::exception& e) {{\n    {}\n}}", { i(1), i(2) })),
  s("vec", fmt("std::vector<{}> {}", { i(1), i(2) })),
  s("map", fmt("std::unordered_map<{}, {}> {}", { i(1), i(2), i(3) })),
  s("pair", fmt("std::pair<{}, {}> {}", { i(1), i(2), i(3) })),
  s("lambda", fmt("[{}]({}) {{ {} }}", { i(1), i(2), i(3) })),
  s("cout", fmt("std::cout << {} << std::endl;", { i(1) })),
  s("cin", fmt("std::cin >> {};", { i(1) })),
  s("include", fmt("#include <{}>", { i(1) })),
  s("using", fmt("using namespace {};", { i(1) })),
  s("const", fmt("const {} {} = {};", { i(1), i(2), i(3) })),
  s("constexpr", fmt("constexpr {} {} = {};", { i(1), i(2), i(3) })),
  s("auto", fmt("auto {} = {};", { i(1), i(2) })),
  s("nullptr", { t("nullptr") }),
  s("move", fmt("std::move({})", { i(1) })),
  s("forward", fmt("std::forward<{}>( {})", { i(1), i(2) })),
  s("make_unique", fmt("std::make_unique<{}>( {})", { i(1), i(2) })),
  s("make_shared", fmt("std::make_shared<{}>( {})", { i(1), i(2) })),
}