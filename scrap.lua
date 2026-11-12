-- Hexalith scrap: a scrap resource that generates with Nauvis-style patches (vanilla scrap only generates on Fulgora),
-- so the planet has a local source of materials instead of relying on imports.
local resource_autoplace = require("resource-autoplace")
local item_sounds = require("__base__.prototypes.item_sounds")

resource_autoplace.initialize_patch_set("hexalith-scrap", false)

data:extend{{
  type = "autoplace-control",
  name = "hexalith-scrap",
  localised_name = {"", "[entity=hexalith-scrap] ", {"entity-name.hexalith-scrap"}},
  richness = true,
  order = "b-h",
  category = "resource",
}}

local scrap = util.table.deepcopy(data.raw.resource["scrap"])
scrap.name = "hexalith-scrap"
scrap.order = "w-h[hexalith-scrap]"
scrap.minable.result = "hexalith-scrap"
scrap.map_color = {0.45, 0.75, 0.35}
scrap.map_grid = true
scrap.factoriopedia_simulation = nil
scrap.autoplace = resource_autoplace.resource_autoplace_settings{
  name = "hexalith-scrap",
  order = "h",
  base_density = 6,
  base_spots_per_km2 = 2.5,
  has_starting_area_placement = false,
  random_spot_size_minimum = 2,
  random_spot_size_maximum = 5,
  regular_rq_factor_multiplier = 1,
}
data:extend{scrap}

data:extend{{
  type = "item",
  name = "hexalith-scrap",
  icon = "__space-age__/graphics/icons/scrap.png",
  pictures =
  {
    { size = 64, filename = "__space-age__/graphics/icons/scrap.png",   scale = 0.5, mipmap_count = 4 },
    { size = 64, filename = "__space-age__/graphics/icons/scrap-1.png", scale = 0.5, mipmap_count = 4 },
    { size = 64, filename = "__space-age__/graphics/icons/scrap-2.png", scale = 0.5, mipmap_count = 4 },
    { size = 64, filename = "__space-age__/graphics/icons/scrap-3.png", scale = 0.5, mipmap_count = 4 },
    { size = 64, filename = "__space-age__/graphics/icons/scrap-4.png", scale = 0.5, mipmap_count = 4 },
    { size = 64, filename = "__space-age__/graphics/icons/scrap-5.png", scale = 0.5, mipmap_count = 4 },
  },
  subgroup = "fulgora-processes",
  order = "a[hexalith-scrap]-a[hexalith-scrap]",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 50,
  default_import_location = "hexalith",
  weight = 2 * kg,
}}

data:extend{{
  type = "recipe",
  name = "hexalith-scrap-recycling",
  icons = {
    { icon = "__recycler__/graphics/icons/recycling.png" },
    { icon = "__space-age__/graphics/icons/scrap.png", scale = 0.4 },
    { icon = "__recycler__/graphics/icons/recycling-top.png" },
  },
  categories = {"recycling", "hand-crafting"},
  subgroup = "fulgora-processes",
  order = "a[trash]-a[trash-recycling]",
  enabled = false,
  auto_recycle = false,
  energy_required = 0.5,
  ingredients = {{type = "item", name = "hexalith-scrap", amount = 1}},
  results = {
    {type = "item", name = "iron-gear-wheel",       amount = 1, independent_probability = 0.18, show_details_in_recipe_tooltip = false},
    {type = "item", name = "copper-cable",          amount = 1, independent_probability = 0.12, show_details_in_recipe_tooltip = false},
    {type = "item", name = "steel-plate",           amount = 1, independent_probability = 0.06, show_details_in_recipe_tooltip = false},
    {type = "item", name = "stone",                 amount = 1, independent_probability = 0.08, show_details_in_recipe_tooltip = false},
    {type = "item", name = "coal",                  amount = 1, independent_probability = 0.08, show_details_in_recipe_tooltip = false},
    {type = "item", name = "concrete",              amount = 1, independent_probability = 0.05, show_details_in_recipe_tooltip = false},
    {type = "item", name = "solid-fuel",            amount = 1, independent_probability = 0.05, show_details_in_recipe_tooltip = false},
    {type = "item", name = "battery",               amount = 1, independent_probability = 0.03, show_details_in_recipe_tooltip = false},
    {type = "item", name = "advanced-circuit",      amount = 1, independent_probability = 0.03, show_details_in_recipe_tooltip = false},
    {type = "item", name = "low-density-structure", amount = 1, independent_probability = 0.01, show_details_in_recipe_tooltip = false},
  },
}}
