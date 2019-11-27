require "test_helper"

describe UsersController do
  describe "current" do
    it "flashes error and redirects when no user logged in" do
      get current_user_path

      expect(flash[:error]).must_equal "You must be logged in to see this page"
      must_redirect_to root_path
    end

    it "responds with success for logged in user" do
      post login_path, params: {user: {username: "becca"}}
      expect(flash[:success]).wont_be_nil
      expect(User.find_by(id: session[:user_id]).username).must_equal "becca"

      get current_user_path
      
      must_respond_with :success
    end
  end

end
