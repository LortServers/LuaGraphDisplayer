local lgd = require("lua-graph-displayer")

print("Lua Graph Displayer v1.1")
print("\nNOTE: Setting precision and/or ranges to high amounts will affect performance and/or may not display fully properly on screen")

function enter(t, c)
	io.write(t)
	return not c and tonumber(io.read()) or c and io.read()
end

local q = enter("\n\nPlease enter an equasion that is correct with Lua syntax (use the \"x\" character to represent the x).\ny = ", true)

local p = enter("Please enter precision (default is 1): ")

local b = enter("Please enter Y bottom range (e.g. -100): ")

local t = enter("Please enter Y top range (e.g. 100): ")

local l = enter("Please enter X left range (e.g. -100): ")

local r = enter("Please enter X right range (e.g. 100): ")

print(lgd.visual_graph_text(l, r, b, t, p, q))
