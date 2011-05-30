Ruby library for Amazon Marketplace Web Service (MWS)
=====================================================

TODO
===========

* Complete the Reports API
* The API calls in general are under development
* Parse the responses intelligently (not just as a hash)
* Better documentation

Intro
===========

AmazonMWS is a set of classes for using the Amazon Marketplace Web Service, a link to Amazon's Seller Central and to your Seller Central account..

This library is in active development, but should now work for the most part. If you would like to contribute to this project, please contact me.

These classes are modeled after aspects of AWS::S3 => http://amazon.rubyforge.org/

Description
===========



Enjoy!

Usage
===========

    require "amazonmws"

    mws = AmazonMWS::Base.new(
       "access_key"=>"MY_KEY",
       "secret_access_key"=>"MY_SECRET",
       "merchant_id"=>"MY_MERCHANT",
       "marketplace_id"=>"MARKETPLACE"
    )

    response = mws.get_report_request_count

    if response.accessors.include?("code")
       puts "Error: #{response.code}. Message: #{response.message}"
    else
       puts "Number of requests is #{response.count}"
    end