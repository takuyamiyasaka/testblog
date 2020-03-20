require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get blog_url(blogs(:one))
    assert_response :success
  end

  test "should get new" do
    get new_blog_url
    assert_response :success
  end

  test "ブログを作ったらbulogのモデル数が1増える" do
  	get new_blog_url
  	assert_response :success
  	assert_difference 'Blog.count', 1 do
  		post blogs_path, params: { blog: {
  			user_id: 1,
  			title: "好きな果物",
  			body: "果物はスイカが好き",
  		}}
  	end
  	follow_redirect!
  	assert_response :success
  end

  test "タイトルが入っていなくてブログ作成に失敗する" do
  	get new_blog_url
  	assert_response :success
  	assert_no_difference "Blog.count" do
  		post blogs_path, params: {blog: {
  			user_id: 1,
  			title: "",
  			body: "果物はスイカが好き",
  		}}
  	end
  	assert_select "div", "Title can't be blank"
  end

end
