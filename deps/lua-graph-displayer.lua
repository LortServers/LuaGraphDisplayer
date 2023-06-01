function calculate_point(x, equasion)
	local _, response = pcall(load("x = " .. x .. " return " .. equasion))
	return response
end

function calculate_graph(left, right, bottom, top, precision, equasion)
	local graph, last = {}
	for i = left, right, precision do
		local value = calculate_point(i, equasion)
		value = math.floor(value / precision) * precision
		if value >= bottom and value <= top then 
			if not graph[value] then graph[value] = {} end
			table.insert(graph[value], i)
			if((last and value < last) or (last == nil)) then last = value end
		end
	end
	return graph, last
end

function visual_graph_iterator(text, left, right, top, precision, min_val, max_val, y, other)
	for x = min_val, max_val, precision do
		text = text .. (((other and left + #text == 0 or x == precision) and y == top) and "^" or (other and left + #text == 0 or x == precision and y == 0) and "+" or (other and left + #text == 0 or x == precision) and "|" or (y == 0 and #text == ((right - left) / precision)) and ">" or (y == 0) and "-" or " ")
	end
	return text
end

function visual_graph_table(left, right, bottom, top, precision, equasion)
	local graph, last_graph = calculate_graph(left, right, bottom, top, precision, equasion)
	local lines, count, last, last_graph_compare = {}, -precision
	for y = top, bottom, -precision do
		local function visual_graph_iterator_short(text, min_val, max_val, other)
			return visual_graph_iterator(text, left, right, top, precision, min_val, max_val, y, other)
		end
		local line = ""
		if graph[y] then
			count = count + precision
			local x_row = graph[y]
			for x in pairs(x_row) do
				line = visual_graph_iterator_short(line, (left + (#line * precision) + precision), x_row[x]) .. "*"
			end
			line = visual_graph_iterator_short(line, ((#line * precision) + precision), ((right - left) + precision), true)
			last, last_graph_compare = graph[y], y
		else
			if last and last_graph_compare and last_graph_compare > last_graph then
				for x in pairs(last) do
					line = visual_graph_iterator_short(line, (left + (#line * precision) + precision), last[x]) .. "."
				end
				line = visual_graph_iterator_short(line, ((#line * precision) + precision), (right - left + precision), true)
			else
				line = visual_graph_iterator_short(line, (left + precision), (right + precision))
			end
		end
		table.insert(lines, line)
	end
	return lines
end

function visual_graph_text(left, right, bottom, top, precision, equasion)
	local graph, text = visual_graph_table(left, right, bottom, top, precision, equasion), ""
	for _, graph_line in pairs(graph) do
		text = text .. graph_line .. "\n"
	end
	return text
end

return {
	calculate_point = calculate_point,
	calculate_graph = calculate_graph,
	visual_graph_table = visual_graph_table,
	visual_graph_text = visual_graph_text
}
