for _,connection in pairs (data.raw["space-connection"]) do 
    if connection == nil then
        break
    end
    if connection.from == "nauvis" then
        data.raw["space-connection"][connection.name].from = "hexalith"
    end 
    if connection.to == "nauvis" then
        data.raw["space-connection"][connection.name].to = "hexalith"
    end
end
	

data.raw.planet["nauvis"].hidden = true
data.raw.planet["nauvis"].map_gen_settings = nil