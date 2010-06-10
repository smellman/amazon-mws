require 'rubygems'
require 'cgi'
require 'uri'
require 'openssl'
require 'net/https'
require 'time'
require 'date'
require 'hmac'
require 'hmac-sha2'
require 'base64'
require 'builder'
require "rexml/document"

# ROXML - nokogiri and roxml are the only dependencies
I_KNOW_I_AM_USING_AN_OLD_AND_BUGGY_VERSION_OF_LIBXML2 = true
# module ROXML
#   XML_PARSER = 'nokogiri' # or 'libxml'
# end
require 'roxml'
# /ROXML


$:.unshift(File.dirname(__FILE__))
require 'lib/extensions'
require 'builder'
#require_library_or_gem 'mime/types', 'mime-types' unless defined? MIME::Types

module AmazonMWS
end



require 'lib/memoizable'

require 'feed_builder'
require 'feed_enumerations'
require 'feed'
require 'report_enumerations'
require 'report'


require 'response'
require 'feed_submission'
require 'report_request'
require 'report_info'
require 'report_schedule'
Dir.glob(File.join(File.dirname(__FILE__), 'response/*.rb')).each {|f| require f }

require 'base'
require 'version'
require 'exceptions'
require 'connection'
require 'connection/management'
require 'connection/request_builder'
require 'authentication'
require 'authentication/query_string'
require 'authentication/signature'


AmazonMWS::Base.class_eval do
  include AmazonMWS::Feed
  include AmazonMWS::Report
end

require_library_or_gem 'xmlsimple', 'xml-simple' unless defined? XmlSimple
=begin
# If libxml is installed, we use the FasterXmlSimple library, that provides most of the functionality of XmlSimple
# except it uses the xml/libxml library for xml parsing (rather than REXML). If libxml isn't installed, we just fall back on
# XmlSimple.
AWS::S3::Parsing.parser =
  begin
    require_library_or_gem 'xml/libxml'
    # Older version of libxml aren't stable (bus error when requesting attributes that don't exist) so we
    # have to use a version greater than '0.3.8.2'.
    raise LoadError unless XML::Parser::VERSION > '0.3.8.2'
    $:.push(File.join(File.dirname(__FILE__), '..', '..', 'support', 'faster-xml-simple', 'lib'))
    require_library_or_gem 'faster_xml_simple' 
    FasterXmlSimple
  rescue LoadError
    XmlSimple
  end
=end