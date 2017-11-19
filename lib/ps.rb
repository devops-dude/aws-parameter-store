# frozen_string_literal: true

require 'aws-sdk'

# Parameter store module
module PS
  @client = Aws::SSM::Client.new
  def self.get_parameter(parameter_name, with_decryption)
    resp = @client.get_parameter(
      name: parameter_name,
      with_decryption: with_decryption
    )
    # return value for usage with other scripts, or is return automatic?
    # rubocop seems to think return is unecessary
    return resp.parameter.value
  end

  def self.put_parameter(parameter_name, description, value, type)
    @client.put_parameter(
      name: parameter_name,
      description: description,
      value: value,
      type: type
    )
    puts "#{parameter_name} was created.\n"
  end

  def self.delete_parameter(parameter_name)
    @client.delete_parameter(
      name: parameter_name
    )
    puts "#{parameter_name} was deleted.\n"
  end
end
