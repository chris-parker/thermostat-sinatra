require 'sinatra/base'
require './models/thermostat'
require './DataMapperSetup'

class ThermoServer < Sinatra::Base
  get '/temperature' do
    headers( "Access-Control-Allow-Origin" => "*" )
    return "No name" unless params[:name]
    your_thermostat = Thermostat.first(name: params[:name])
    your_thermostat ? your_thermostat.temperature.to_s : "Your thermostat was not found :("
  end

  post '/temperature' do
    headers( "Access-Control-Allow-Origin" => "*" )
    thermostat = Thermostat.first_or_create(name: params[:name])
    return "No temperature" unless params[:temperature]
    thermostat.temperature = params[:temperature]
    if thermostat.name
      thermostat.save
      "Temperature was saved!"
    else
      "We didn't save anything :("
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
