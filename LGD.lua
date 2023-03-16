print("Lua Graph Displayer v1.0")
print("\nNOTE: Setting precision and/or ranges to high amounts will affect performance and/or may not display fully properly on screen")

function enter(t, c)
	io.write(t)
	return not c and tonumber(io.read()) or c and io.read()
end

local q = enter("\n\nPlease enter an equasion that is correct with Lua syntax (use the \"x\" character to represent the x).\ny = ", true)

local y = function(x) local _, p = pcall(load("x = " .. x .. "\nreturn " .. q)) return p end

local p = --[[enter("Please enter precision (default is 1): ")]] 1 -- Not yet ready and fully implemented.

local b = enter("Please enter Y bottom range (e.g. -100): ")

local t = enter("Please enter Y top range (e.g. 100): ")

local l = enter("Please enter X left range (e.g. -100): ")

local r = enter("Please enter X right range (e.g. 100): ")

local e = {}

for i = l, r, p do
	local v = math.floor(y(i))
	if v >= b and v <= t then 
		if not e[v] then e[v] = {} end
		table.insert(e[v], i)
	end
end

l = 0
for _, v in pairs(e) do
	for _, t in pairs(v) do
		if t < l then
			l = t
		end
	end
end

print("")

local last
local count = -1

for i = t, b, -p do
	local a = ""
	if e[i] then
		count = count + 1
		local n = e[i]
		for j in pairs(n) do
			for k = l + #a + 1, n[j], p do
				a = (k == 1 and i == t) and a .. "^" or (k == 1) and a .. "|" or (i == 0 and #a == (r - l)) and a .. ">" or (i == 0) and a .. "-" or a .. " "
			end
			a = a .. "*"
		end
		for k = #a + 1, (r - l) + 1, p do
			a = (l - (-#a) == 0 and i == t) and a .. "^" or (l - (-#a) == 0) and a .. "|" or (i == 0 and #a == (r - l)) and a .. ">" or (i == 0) and a .. "-" or a .. " "
		end
		last = e[i]
	else
		if last and count ~= #e then
			for j in pairs(last) do
				for k = l + #a + 1, last[j], p do
					a = (k == 1 and i == t) and a .. "^" or (k == 1) and a .. "|" or (i == 0 and #a == (r - l)) and a .. ">" or (i == 0) and a .. "-" or a .. " "
				end
				a = a .. "."
			end
			for k = #a + 1, (r - l) + 1, p do
				a = (l - (-#a) == 0 and i == t) and a .. "^" or (l - (-#a) == 0) and a .. "|" or (i == 0 and #a == (r - l)) and a .. ">" or (i == 0) and a .. "-" or a .. " "
			end
		else
			for j = l + 1, (r + 1), p do
				a = (j == 1 and i == t) and a .. "^" or (j == 1) and a .. "|" or (i == 0 and #a == (r - l)) and a .. ">" or (i == 0) and a .. "-" or a .. " "
			end
		end
	end
	print(a)
end