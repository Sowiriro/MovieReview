require 'test_helper'

class MovieImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get movie_images_index_url
    assert_response :success
  end

  test "should get new" do
    get movie_images_new_url
    assert_response :success
  end

  test "should get edit" do
    get movie_images_edit_url
    assert_response :success
  end

end
