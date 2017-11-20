# frozen_string_literal: true

require 'aws-sdk'

# Parameter store class
class PS
  @client = Aws::SSM::Client.new

  # PS.get_parameter method
  def self.get_parameter(parameter_name, with_decryption)
    resp = @client.get_parameter(
      name: parameter_name,
      with_decryption: with_decryption
    )
    resp.parameter.value # return value
  end

  # PS.put_parameter method
  def self.put_parameter(parameter_name, type, description, value)
    @client.put_parameter(
      name: parameter_name,
      description: description,
      value: value,
      type: type
    )
    puts "Parameter #{parameter_name} was created.\n"
  end

  # PS.delete_parameter method
  def self.delete_parameter(parameter_name)
    @client.delete_parameter(
      name: parameter_name
    )
    puts "Parameter #{parameter_name} was deleted.\n"
  end
end
