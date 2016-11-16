require 'test_helper'
require 'json'

class Api::V1::IndicesControllerTest < ActionController::TestCase
  test 'GET #index' do
    get :index
    assert_response :success
    assert_equal response.content_type, 'application/vnd.api+json'
    jdata = JSON.parse response.body
    assert_equal jdata['data'][0]['type'], 'indices'
    assert_equal jdata['data'][0]['attributes']['tags'].size, 4
  end
end
