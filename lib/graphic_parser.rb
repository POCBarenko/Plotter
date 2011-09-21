class GraphicParser
  def parse(function)
    return nil if function.nil?
    o = (class << Object.new; self; end)
    Proc.new do |x|
      o.module_eval("x=#{x}") 
      o.module_eval(function)
    end
  end
end