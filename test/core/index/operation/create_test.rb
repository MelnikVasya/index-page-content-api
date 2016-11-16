require 'test_helper'

class CreateTest < ActiveSupport::TestCase
  def call_operation(params)
    Index::Operation::Create.new.(params)
  end

  test 'post create success' do
    assert_difference 'Index.count', 1 do
      assert call_operation(url: 'http://example.com/').valid?
    end
  end

  test 'post create unprocessable entity' do
    [nil, '', 'INVALID URL', 'http://empty.example.com/'].each do |url|
      assert_difference 'Index.count', 0 do
        assert_not call_operation(url: url).valid?
      end
    end
  end
end
