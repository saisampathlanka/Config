local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("fn", fmt("func {}({}) {} {{\n    {}\n}}", { i(1), i(2), i(3), i(4) })),
  s("main", fmt("func main() {{\n    {}\n}}", { i(1) })),
  s("struct", fmt("type {} struct {{\n    {}\n}}", { i(1), i(2) })),
  s("iface", fmt("type {} interface {{\n    {}\n}}", { i(1), i(2) })),
  s("if", fmt("if {} {{\n    {}\n}}", { i(1), i(2) })),
  s("else", fmt("else {{\n    {}\n}}", { i(1) })),
  s("for", fmt("for {} {{\n    {}\n}}", { i(1), i(2) })),
  s("forr", fmt("for {} := {}; {} < {}; {}++ {{\n    {}\n}}", { i(1), i(2), i(1), i(3), i(1), i(4) })),
  s("switch", fmt("switch {} {{\ncase {}:\n    {}\ndefault:\n    {}\n}}", { i(1), i(2), i(3), i(4) })),
  s("select", fmt("select {{\ncase {}:\n    {}\n}}", { i(1), i(2) })),
  s("defer", fmt("defer {}()", { i(1) })),
  s("go", fmt("go {}({})", { i(1), i(2) })),
  s("chan", fmt("make(chan {})", { i(1) })),
  s("err", fmt("if err != nil {{\n    return {}\n}}", { i(1) })),
  s("print", fmt("fmt.Println({})", { i(1) })),
  s("printf", fmt('fmt.Printf("{{}}", {})', { i(1) })),
  s("logf", fmt('log.Printf("{{}}", {})', { i(1) })),
  s("http", fmt('http.HandleFunc("{}", func(w http.ResponseWriter, r *http.Request) {{\n    {}\n}})', { i(1), i(2) })),
  s("test", fmt("func Test{}(t *testing.T) {{\n    {}\n}}", { i(1), i(2) })),
  s("bench", fmt("func Benchmark{}(b *testing.B) {{\n    {}\n}}", { i(1), i(2) })),
  s("json", fmt('`json:"{}"`', { i(1) })),
}