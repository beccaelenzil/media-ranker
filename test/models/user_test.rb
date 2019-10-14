require "test_helper"

describe User do
  before do
    @user = User.new(username: "Becca")
  end
  describe "validations" do
    it "can create a user" do
      result = @user.valid?

      expect(result).must_equal true
    end

    it "cannot create a user without a username" do
      @user.username = nil

      result = @user.valid?

      expect(result).must_equal false
    end

    it "cannot create a user with the same username" do
      user2 = User.new(username: "Becca")

      @user.save
      result = user2.valid?

      expect(result).must_equal false
    end

  end
end
