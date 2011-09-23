require 'graphic_parser'
require 'csv'

class Plotter
  attr_accessor :domain, :precision
  
  def initialize(domain=(-5..5), precision=1)
    @domain, @precision = domain, precision
  end
  
  def plot(*function)
    functions = {}
    graphic_parser = GraphicParser.new
    
    function.each do |f|
      graph = {}
      
      parsed_function = graphic_parser.parse f
      x = @domain.min
      while x <= @domain.max do
        graph[x] = parsed_function.call(x)
        x += precision
      end
      
      functions[f] = graph
    end
    functions
  end
  
  def plot_csv(function)
    csv = CSV.generate do |c|
      c << ['X', 'Y']
      plot(function).values.first.each do |k,v|
        c << [k, v]
      end
    end
    csv
  end
end