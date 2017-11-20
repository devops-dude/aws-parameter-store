# frozen_string_literal: true

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'ps.rb'
require 'yaml'

# load yaml file
parameters = YAML.load_file(File.join(__dir__, 'parameters.yml'))

# parse yaml file and check if parameters exist
parameters.each do |parameter_name, values|
  type = values[0]

  # if type is String set with_decryption to false else set it to true
  # true or false is required by the AWS CLI to lookup a parameter
  if type == 'String'
    with_decryption = false
  elsif type != 'String'
    with_decryption = true
  end

  begin
    # use ps module and put parameter method to fetch parameters
    print "#{parameter_name}="
    print PS.get_parameter(parameter_name, with_decryption) + "\n"
  # error handling AWS CLI output
  rescue Aws::SSM::Errors::ServiceError => e
    puts 'Error Fetching Parameter: ' + parameter_name
    puts "#{e.class} #{e.message}"
  end
end
