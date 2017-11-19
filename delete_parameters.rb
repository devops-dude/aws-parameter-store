# frozen_string_literal: true

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'ps.rb'
require 'yaml'

parameters = YAML.load_file(File.join(__dir__, 'parameters.yml'))

# parse yaml file and create parameters specified
parameters.each_key do |name|
  PS.delete_parameter(name)
end
