local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("cl", fmt("console.log({})", { i(1) })),
  s("clg", fmt("console.log('{}', {})", { i(1), i(2) })),
  s("fn", fmt("const {} = ({}) => {{\n  {}\n}}", { i(1), i(2), i(3) })),
  s("afn", fmt("async ({}) => {{\n  {}\n}}", { i(1), i(2) })),
  s("imp", fmt("import {{ {} }} from '{}'", { i(1), i(2) })),
  s("exp", fmt("export {{ {} }}", { i(1) })),
  s("def", fmt("export default {}", { i(1) })),
  s("try", fmt("try {{\n  {}\n}} catch (error) {{\n  {}\n}}", { i(1), i(2) })),
  s("it", fmt("it('{}', () => {{\n  {}\n}})", { i(1), i(2) })),
  s("desc", fmt("describe('{}', () => {{\n  {}\n}})", { i(1), i(2) })),
  s("bef", fmt("beforeEach(() => {{\n  {}\n}})", { i(1) })),
  s("af", fmt("afterEach(() => {{\n  {}\n}})", { i(1) })),
  s("int", fmt("interface {} {{\n  {}\n}}", { i(1), i(2) })),
  s("type", fmt("type {} = {}", { i(1), i(2) })),
  s("enum", fmt("enum {} {{\n  {}\n}}", { i(1), i(2) })),
  s("comp", fmt("const {}: React.FC<{}> = ({}) => {{\n  return (\n    {}\n  )\n}}", { i(1), i(2), i(3), i(4) })),
  s("hoc", fmt("const with{} = (WrappedComponent) => {{\n  return (props) => {{\n    return <WrappedComponent {{...props}} />\n  }}\n}}", { i(1) })),
}