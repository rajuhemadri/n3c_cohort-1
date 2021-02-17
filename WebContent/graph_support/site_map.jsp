<script type="text/javascript">
	//Width and height of map
	var width = 960;
	var height = 500;

	// Load the Cohort Data
	d3.json("${param.data_page}", function(error, data) {
		if (error) throw error;

		var myObserver = new ResizeObserver(entries => {
			entries.forEach(entry => {
				var newWidth = Math.floor(entry.contentRect.width);
				// console.log('body width '+newWidth);
				if (newWidth > 0) {
					d3.select("${param.dom_element}").select("svg").remove();
					width = newWidth;
					height = width / 2;
					draw();
				}
			});
		});
		myObserver.observe(d3.select("${param.dom_element}").node());

		draw();

		function draw() {
			// D3 Projection
			var projection = d3.geoAlbersUsa()
				.translate([width / 2, height / 2]) // translate to center of screen
				.scale([width]); // scale things down so see entire US

			// Define path generator
			var path = d3.geoPath() // path generator that will convert GeoJSON to SVG paths
				.projection(projection); // tell path generator to use albersUsa projection


			var svg = d3.select("${param.dom_element}")
				.append("svg")
				.attr("width", width)
				.attr("height", height);

			// Color Scale For Legend and Map 
			//var color = d3.scaleOrdinal() 
			//	.domain([1, 2, 3, 4, 5, 6, 7, 8, 9])
			//	.range(["#bce4d8", "#b6e1d8", "#a8d9d4", "#a4d8d3", "#9ed4d2", "#80c3cb", "#65b4c3", "#3791b0", "#2d5985"]);

			var dataArray = [];

			var states = data.states;

			for (var d = 0; d < states.length; d++) {
				dataArray.push(parseFloat(states[d].count))
			}

			var color = d3.scaleLinear()
				.domain([d3.min(dataArray, function(d) { return d; }), d3.max(dataArray, function(d) { return d; })])
				.range(["#bce4d8", "#2d5985"]);


			// Load GeoJSON data and merge with cohort data
			d3.json("${param.state_page}", function(json) {

				// Loop through each state data value in the json array
				for (var i = 0; i < states.length; i++) {
					var dataState = states[i].name;
					var dataValue = states[i].count;
					var dataRegion = states[i].region;
					// Find the corresponding state inside the GeoJSON
					for (var j = 0; j < json.features.length; j++) {
						var jsonState = json.features[j].properties.name;
						if (dataState == jsonState) {
							// Copy the data value into the JSON
							json.features[j].properties.value = dataValue;
							json.features[j].properties.color = dataRegion;
							break;
						}
					}
				}

				// Bind the data to the SVG and create one path per GeoJSON feature
				svg.selectAll("path")
					.data(json.features)
					.enter()
					.append("path")
					.attr("d", path)
					.style("stroke", "#fff")
					.style("stroke-width", "1")
					.style("fill", "#bce4d8");
			});

			d3.json("${param.site_page}", function(graph) {
				var locationBySite = [],
					positions = [];

				var sites = graph.sites.filter(function(site) {
					var location = [site.longitude, site.latitude];
					locationBySite[site.id] = projection(location);
					positions.push(projection(location));
					return true;
				});

				var tool_tip = d3.tip()
					.attr("class", "d3-tip")
					.offset([-8, 0])
					.html(function(d) { return d.site; });
				svg.call(tool_tip);

				svg.selectAll("circle")
					.data(sites)
					.enter().append("svg:circle")
					.style("stroke", "#fff")
					.style("fill", function(d) { return color(d.id % 10); })
					//.on("click", function(d) { window.open(d.url, "_self"); })
					.attr("cx", function(d, i) { return positions[i][0]; })
					.attr("cy", function(d, i) { return positions[i][1]; })
					.attr("r", function(d, i) { return 4; })
					.on("mouseover", tool_tip.show)
					.on("mouseout", tool_tip.hide);
			});
		};
	});

</script>

