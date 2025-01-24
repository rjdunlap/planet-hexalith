script.on_init(function()
    game.forces.player.set_surface_hidden(game.surfaces.nauvis, true)

    if game.surfaces["hexalith"] then
        game.forces["enemy"].set_evolution_factor(1, game.surfaces.hexalith)
    end
  end)

script.on_event(defines.events.on_surface_created, function(event)
    local surface = game.surfaces[event.surface_index]
    if surface.name == "hexalith" then
        game.forces["enemy"].set_evolution_factor(1, surface)
    end

end)