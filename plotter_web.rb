$LOAD_PATH << './lib'
require 'rubygems'
require 'sinatra'
require 'plotter'

get '/' do
  erb :index
end

get '/function/:function.csv' do
  domain = ((params[:min] ||-5) .. (params[:max] || 5))
  precision = params[:precision] || 0.1

  p domain
  p precision

  Plotter.new(domain, precision).plot_csv(params[:function])
end

get '/function/:function' do
  domain = ((params[:min] ||-5) .. (params[:max] || 5))
  precision = params[:precision] || 0.1
  
  Plotter.new(domain, precision).plot(params[:function]).values.first.to_s
end

