require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
  content_type :json
  components = HTTParty.get('https://api.statuspage.io/v1/pages/sp67ggpjvfh5/components.json?api_key=' + ENV['api_key'])

  response = {}
  components.each do |component|
  	response[component['name']] = { 'updated_at' => component['updated_at'], 'status' => component['status'] }
  end

  response.to_json
end
