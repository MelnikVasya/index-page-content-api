require 'test_helper'
require 'json'

class Api::V1::IndicesControllerTest < ActionController::TestCase
  test 'get index' do
    get :index
    assert_response :success
    assert_equal response.content_type, 'application/vnd.api+json'
    jdata = JSON.parse response.body
    assert_equal jdata['data'].size, 1
  end

  test 'post create success' do
    post :create, params: { url: 'http://example.com/' }
    assert_response :created
    assert_equal response.content_type, 'application/vnd.api+json'
    jdata = JSON.parse response.body
    assert_equal jdata['data']['type'], 'indices'
    assert_equal jdata['data']['attributes']['url'], 'http://example.com/'
    assert_equal jdata['data']['attributes']['tags'].size, 2
  end

  test 'post create unprocessable entity' do
    post :create, params: {}
    assert_response :unprocessable_entity
    assert_equal response.content_type, 'application/vnd.api+json'
    jdata = JSON.parse response.body
    assert_equal jdata['url'], %w(is\ missing is\ in\ invalid\ format)
  end
end
