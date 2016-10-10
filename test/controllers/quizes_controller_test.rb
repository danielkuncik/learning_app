require 'test_helper'

class QuizesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get quizes_new_url
    assert_response :success
  end

end
