# frozen_string_literal: true

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'ps.rb'
require 'yaml'

# load yaml file
parameters = YAML.load_file(File.join(__dir__, 'parameters.yml'))

# parse yaml file and check if parameters exist
parameters.each do |parameter_name, values|
  type = values[0]

  # if type is SecureString set with_decryption to true
  # true or false is required by the AWS CLI to lookup a parameter
  type == 'SecureString' ? with_decryption = true : false

  begin
    # use ps module and put parameter method to fetch parameters
    puts PS.get_parameter(parameter_name, with_decryption)
  # error handling AWS CLI output
  rescue Aws::SSM::Errors::ServiceError => e
    puts 'Error Fetching Parameter: ' + parameter_name
    puts "#{e.class} #{e.message}"
  end
end
