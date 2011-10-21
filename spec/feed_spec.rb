require File.dirname(__FILE__) + "/spec_helper"

require 'mocha'
include AmazonMWS

AmazonMWS::Base.debug = true

describe Feed do
  
  before do
    config = YAML.load_file(File.dirname(__FILE__) + "/test_config.yml")
    @marketplace = AmazonMWS::Base.new(config)
  end

  describe 'get_feed_submission_list' do
    it 'failure' do 
      @marketplace.stub!(:get).and_return(mock_response(401, :body => File.read(xml_for('error')), :content_type => "text/xml"))
      
      response = @marketplace.feed_submission_list
      response.should be_kind_of(ResponseError)
    end

    it 'success' do
      @marketplace.stub!(:get).and_return(mock_response(200, :body => File.read(xml_for('get_feed_submission_list')), :content_type => "text/xml"))
      
      response = @marketplace.feed_submission_list
      response.should be_kind_of(GetFeedSubmissionListResponse)
    end
  end

end
