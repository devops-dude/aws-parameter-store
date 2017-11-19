# frozen_string_literal: true

# code coverage reports
require 'simplecov'
SimpleCov.start

# test file in lib
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'ps.rb'
