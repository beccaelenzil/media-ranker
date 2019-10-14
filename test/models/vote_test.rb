require "test_helper"

describe Vote do
  before do
    @user = User.create(username: "Becca")
    @work = Work.create(
      title: "Hello World!",
      creator: "Becca",
      description: "blah blah blah",
      publication_year: 2019,
      category: "book"
    )

    @work2 = Work.create(
      title: "Hello World! How are you?",
      creator: "Becca",
      description: "blah blah blah",
      publication_year: 2019,
      category: "movie"
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

    describe "validations" do
      it "a user cannot vote on a work twice" do
        vote = Vote.new(user_id: @user.id, work_id: @work.id)
        vote.save!
        vote2 = Vote.new(user_id: @user.id, work_id: @work.id)
        
        result = vote2.valid?

        expect(result).must_equal false
      end

      it "a user can vote on 2 different works" do

        vote = Vote.new(user_id: @user.id, work_id: @work.id)
        vote.save!
        vote2 = Vote.new(user_id: @user.id, work_id: @work2.id)

        result = vote2.valid?

        expect(result).must_equal true
      end

    end

  end
end
