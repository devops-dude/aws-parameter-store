# frozen_string_literal: true

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'ps.rb'
require 'yaml'

parameters = YAML.load_file(File.join(__dir__, 'parameters.yml'))

# loop through yaml file and create parameters specified
parameters.each do |name, values|
  type = values[0]
  description = values[1]
  parameter_value = values[2]
  

  # Create error handling to output sane errors
  begin
    # use ps module and put parameter method to create parameters
    PS.put_parameter(name, type, description, parameter_value)
  rescue Aws::SSM::Errors::ServiceError => e
    puts 'Error Creating Parameter: ' + name
    #puts "An error of type #{e.class} happened, message is:\n"
    #puts e.message
    puts "#{e.class} #{e.message}"
  end
end
