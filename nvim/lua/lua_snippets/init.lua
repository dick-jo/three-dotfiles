local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Function to create exact 60-char string
local function create_line(prefix, suffix, fill)
  local total = 60
  local fill_count = total - #prefix - #suffix
  return prefix .. string.rep(fill, fill_count) .. suffix
end

-- Add all snippets
ls.add_snippets("svelte", {
  s("!sveltecomp", {
    t {
      '<script lang="ts">',
      "    interface Props {}",
      "",
      "    let {}: Props = $props()",
      "</script>",
      "",
      create_line("<!-- MARKUP ", " -->", "-"),
      '<div class="host"></div>',
      "",
      create_line("<!-- CSS ", " -->", "-"),
      "<style>",
      "",
      "</style>",
    },
  }),
})

ls.add_snippets("all", {
  -- Simple lines (exactly 60 chars each)
  s("!jsline", {
    t(create_line("// ", " //", "-")),
  }),

  s("!cssline", {
    t(create_line("/* ", " */", "-")),
  }),

  s("!htmlline", {
    t(create_line("<!-- ", " -->", "-")),
  }),

  -- Dynamic comments (exactly 60 chars each)
  s("!jscomment", {
    t "// ",
    i(1, "TITLE"),
    f(function(args)
      local text = args[1][1] or "TITLE"
      return create_line("// " .. text .. " ", " //", "-"):sub(#("// " .. text) + 1)
    end, { 1 }),
  }),

  s("!csscomment", {
    t "/* ",
    i(1, "TITLE"),
    f(function(args)
      local text = args[1][1] or "TITLE"
      return create_line("/* " .. text .. " ", " */", "-"):sub(#("/* " .. text) + 1)
    end, { 1 }),
  }),

  s("!htmlcomment", {
    t "<!-- ",
    i(1, "TITLE"),
    f(function(args)
      local text = args[1][1] or "TITLE"
      return create_line("<!-- " .. text .. " ", " -->", "-"):sub(#("<!-- " .. text) + 1)
    end, { 1 }),
  }),
})
