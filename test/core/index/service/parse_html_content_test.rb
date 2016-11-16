require 'test_helper'

class ParseHTMLContentTest < ActiveSupport::TestCase
  def call_service(url)
    Index::Service::ParseHTMLContent.call(url)
  end

  test 'should return hash of tags' do
    res = { h1: ['Example Domain'], a: ['http://www.iana.org/domains/example'] }
    assert_equal call_service('http://example.com/'), res
  end

  test 'should return empty hash' do
    assert_equal call_service('http://invalid.example.com/'), {}
  end
end
