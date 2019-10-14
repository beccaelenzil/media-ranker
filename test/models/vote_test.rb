require "test_helper"

describe Vote do
  before do
    @user = User.new(username: "Becca")
    @work = Work.new(
      title: "Hello World!",
      creator: "Becca",
      description: "blah blah blah",
      publication_year: 2019,
      category: "book"
    )
  end
  describe "relations" do
    it "can set the work through 'work' " do
      @work.save
      vote = Vote.new()

      vote.work = @work

      expect(vote.work_id).must_equal @work.id
    end

    it "can set the work through 'work_id' " do
      @work.save
      vote = Vote.new()

      vote.work_id = @work.id

      expect(vote.work).must_equal @work
    end

    it "can set the user through 'user' " do
      @user.save
      vote = Vote.new()

      vote.user = @user

      expect(vote.user_id).must_equal @user.id
    end

    it "can set the work through 'work_id' " do
      @user.save
      vote = Vote.new()

      vote.user_id = @user.id

      expect(vote.user).must_equal @user
    end

  end
end
