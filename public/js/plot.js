Plot = {
	plot: function(csv){
		var precision = $('precision').value
		
		g = $('graphic')
		g.empty();
		
		var d = Dygraph(
			g,
			csv,
			{rollPeriod: precision, showRoller: true}
		);
	}
}
		
$(Plot.plot(null))