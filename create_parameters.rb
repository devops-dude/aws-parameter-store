# frozen_string_literal: true

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'ps.rb'
require 'yaml'

parameters = YAML.load_file(File.join(__dir__, 'parameters.yml'))

# loop through yaml file and create parameters specified
parameters.each do |name, values|
  description = values[0]
  parameter_value = values[1]
  type = values[2]

  # Create error handling to output sane errors  
  begin
  	# use ps module and put parameter method to create parameters
    PS.put_parameter(name, description, parameter_value, type)
  rescue Aws::SSM::Errors::ServiceError => e
  	puts "Error creating" + name + ":"
  	puts "An error of type #{e.class} happened, message is #{e.message}"
    puts e.message
  end
end
