local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("sel", fmt("SELECT {} FROM {};", { i(1, "*"), i(2) })),
  s("selw", fmt("SELECT {} FROM {} WHERE {};", { i(1, "*"), i(2), i(3) })),
  s("ins", fmt("INSERT INTO {} ({}) VALUES ({})", { i(1), i(2), i(3) })),
  s("upd", fmt("UPDATE {} SET {} WHERE {}", { i(1), i(2), i(3) })),
  s("del", fmt("DELETE FROM {} WHERE {}", { i(1), i(2) })),
  s("create", fmt("CREATE TABLE {} (\n    {} PRIMARY KEY,\n    {}\n);", { i(1), i(2), i(3) })),
  s("alter", fmt("ALTER TABLE {} {}", { i(1), i(2) })),
  s("drop", fmt("DROP TABLE {};", { i(1) })),
  s("join", fmt("SELECT {} FROM {}\n{} JOIN {} ON {} = {}", { i(1), i(2), c(3, { t("INNER"), t("LEFT"), t("RIGHT"), t("FULL") }), i(4), i(5), i(6) })),
  s("group", fmt("SELECT {}, COUNT(*) FROM {} GROUP BY {};", { i(1), i(2), i(1) })),
  s("order", fmt("SELECT {} FROM {} ORDER BY {} {};", { i(1, "*"), i(2), i(3), c(4, { t("ASC"), t("DESC") }) })),
  s("limit", fmt("SELECT {} FROM {} LIMIT {};", { i(1, "*"), i(2), i(3) })),
  s("distinct", fmt("SELECT DISTINCT {} FROM {};", { i(1), i(2) })),
  s("union", fmt("SELECT {} FROM {}\nUNION\nSELECT {} FROM {};", { i(1), i(2), i(1), i(3) })),
  s("case", fmt("CASE\n    WHEN {} THEN {}\n    ELSE {}\nEND", { i(1), i(2), i(3) })),
  s("cte", fmt("WITH {} AS (\n    {}\n)\nSELECT {} FROM {};", { i(1), i(2), i(3), i(1) })),
  s("index", fmt("CREATE INDEX {} ON {} ({})", { i(1), i(2), i(3) })),
  s("view", fmt("CREATE VIEW {} AS\nSELECT {} FROM {};", { i(1), i(2), i(3) })),
  s("trigger", fmt("CREATE TRIGGER {}\n{} ON {}\nFOR EACH ROW\nBEGIN\n    {}\nEND;", { i(1), c(2, { t("BEFORE INSERT"), t("AFTER INSERT"), t("BEFORE UPDATE"), t("AFTER UPDATE"), t("BEFORE DELETE"), t("AFTER DELETE") }), i(3), i(4) })),
  s("func", fmt("CREATE OR REPLACE FUNCTION {} ({})\nRETURNS {} AS $$\n{}\n$$ LANGUAGE plpgsql;", { i(1), i(2), i(3), i(4) })),
  s("now", { t("NOW()") }),
  s("current_date", { t("CURRENT_DATE") }),
  s("count", fmt("COUNT({})", { i(1, "*") })),
  s("sum", fmt("SUM({})", { i(1) })),
  s("avg", fmt("AVG({})", { i(1) })),
  s("min", fmt("MIN({})", { i(1) })),
  s("max", fmt("MAX({})", { i(1) })),
}