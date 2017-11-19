# frozen_string_literal: true

require 'aws-sdk'

# Parameter store module
class PS
  @client = Aws::SSM::Client.new
  def self.get_parameter(parameter_name, with_decryption)
    resp = @client.get_parameter(
      name: parameter_name,
      with_decryption: with_decryption
    )
    # return value
    resp.parameter.value
  end

  def self.put_parameter(parameter_name, type, description, value)
    @client.put_parameter(
      name: parameter_name,
      description: description,
      value: value,
      type: type
    )
    puts "Parameter #{parameter_name} was created.\n"
  end

  def self.delete_parameter(parameter_name)
    @client.delete_parameter(
      name: parameter_name
    )
    puts "Parameter #{parameter_name} was deleted.\n"
  end
end
