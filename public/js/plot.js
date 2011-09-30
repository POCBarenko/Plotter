function Map(){
	this.length = 0;
	this.items = new Array();
	
	this.getItem = function(in_key) {
		return this.items[in_key];
	}

	this.setItem = function(in_key, in_value){
		this.items[in_key] = in_value;
		this.length++;
	}
}

Plot = {
	plot: function(func){
		var precision = parseFloat($('#precision').val());
		var min = parseFloat($('#min').val());
		var max = parseFloat($('#max').val());
		
      	google.setOnLoadCallback(Plot.draw);
		try{
	        var data = new google.visualization.DataTable();

	        data.addColumn('string', 'X');
	        data.addColumn('number', 'Y');

			var theFunction = function(){return eval(func);}
			var values = new Map();
			for(var x = min; x<=max; x += precision){
				var y = theFunction();
				values.setItem(parseFloat(x.toFixed(3)), parseFloat(y.toFixed(3)));
			}

			data.addRows(values.length);
			var counter = 0;
			for(var x in values.items){
				data.setValue(counter, 0, x.toString());
				data.setValue(counter, 1, values.items[x]);
				counter++;
			}
	
	        var chart = new google.visualization.LineChart($('#chart')[0]);
	        chart.draw(data, {width: 800, height: 600, title: 'Y = '+func, legend:'none', max:max, min:min});
		}catch(e){
			alert(e);
		}		
	}
} 

PlotEvents = {
	ready: function(){
		$('#action').click(function(event){
			event.stopPropagation();
			event.preventDefault();
			Plot.plot($('#func').val());
		});
	}
} 

$(function(){PlotEvents.ready()});
