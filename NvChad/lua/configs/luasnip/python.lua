local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("ifmain", t('if __name__ == "__main__":')),
}
