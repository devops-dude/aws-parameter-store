# frozen_string_literal: true

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'ps.rb'
require 'yaml'

parameters = YAML.load_file(File.join(__dir__, 'parameters.yml'))

# parse yaml file and create parameters specified
parameters.each_key do |name|
  # Create error handling to output sane errors
  begin
    # use ps module and put parameter method to delete parameters
    PS.delete_parameter(name)
  # error handling AWS CLI output
  rescue Aws::SSM::Errors::ServiceError => e
    puts 'Error Creating Parameter: ' + name
    puts "#{e.class} #{e.message}"
  end
end
