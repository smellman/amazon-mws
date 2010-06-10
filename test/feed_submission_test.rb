require File.join(File.dirname(__FILE__), 'test_helper')
require 'yaml'

class FeedSubmissionTest < Test::Unit::TestCase
  def setup
    config = YAML.load_file( File.join(File.dirname(__FILE__), '../lib/amazon/mws.yml') )
    
    AmazonMWS::Base.establish_connection!(
      config['production']
    )
  end
  
  def test_get_feed_submission_list
    # AmazonMWS::API.submit_feed(:product_data, :product, @product)
    # response = AmazonMWS::API.get_feed_submission_list
    
    #response = AmazonMWS::API.request_report(:flat_file_orders)

    #report_id = response["RequestReportResponse"]["RequestReportResult"]["ReportRequestInfo"]["ReportRequestId"]


    response = AmazonMWS::API.get_report_list
    
    report_id = response["GetReportListResult"]["ReportInfo"]["ReportId"]
    
    response = AmazonMWS::API.get_report(report_id)    
    #response = AmazonMWS::API.get_report_request_list
    
    #response = AmazonMWS::API.get_report_request_count
    puts response.inspect
  end
end