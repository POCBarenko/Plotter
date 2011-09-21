require 'graphic_parser'

class Plotter
  attr_accessor :domain, :precision
  
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
end