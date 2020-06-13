extends Line2D

var pointarray = []

var importedarray = []

var xmin = 0

var xmax = 1000

var chartheight = 600

var xstep = 2

var volatility = .025

func add_point_to_array(x, y, arrayvar):
	arrayvar.append(Vector2(x, y))

func add_point_to_line(x, y):
	add_point(Vector2(x, chartheight - y))

func generate_graph_from_data(arrayvar):
	for i in arrayvar.size():
		add_point(Vector2(arrayvar[i]))

func generate_recursive_data(x, y, yvarmin, yvarmax, pointsleft, arrayvar):
	if pointsleft != -1:
		randomize()
		add_point_to_array(x, y, arrayvar)
		generate_recursive_data(x + xstep, y * (1 + rand_range(yvarmin, yvarmax)), yvarmin, yvarmax, pointsleft - 1, arrayvar)
	else:
		pass

func generate_graph(maxx, maxy, yvarmin, yvarmax):
	generate_recursive_data(12, maxy / 2, yvarmin, yvarmax, maxx / xstep, pointarray)
	generate_graph_from_data(pointarray)

func clear_graph():
	points = []
	pointarray = []

func _New_Graph_Pressed():
	if points != null:
		clear_graph()
	generate_graph(xmax, chartheight, volatility * -1, volatility)

func _on_PointSlider_value_changed(value):
	xstep = 1000 / value

func _on_VolatilitySlider_value_changed(value):
	volatility = value
