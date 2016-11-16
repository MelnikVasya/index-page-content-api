require 'test_helper'

class IndexTest < ActiveSupport::TestCase
  test 'the store accessors' do
    index = indices(:index_1)

    assert_equal index.h1, ['Main page title']
    assert_equal index.h2, ['Second page title']
    assert_equal index.h3, ['Third page title']
    assert_equal index.a, ['http://example.com/']
  end
end
