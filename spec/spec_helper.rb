require 'rubygems'
require 'yaml'

require File.join(File.dirname(__FILE__), '..', 'lib', 'amazonmws')

def xml_for(name)
  Pathname.new(File.dirname(__FILE__)).expand_path.dirname.join("examples/xml/#{name}.xml")
end

def mock_response(code, options={})
  body = options[:body]
  content_type = options[:content_type]
  
  response = Net::HTTPResponse.send(:response_class, code.to_s).new("1.0", code.to_s, "message")
  response.instance_variable_set(:@body, body)
  response.instance_variable_set(:@read, true)
  response.content_type = content_type
  return response
end
