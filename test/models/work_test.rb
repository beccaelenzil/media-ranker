require "test_helper"

describe Work do
  before do
    @work = Work.new(
      title: "Hello World!",
      creator: "Becca",
      description: "blah blah blah",
      publication_year: 2019,
      category: "book"
    )
  end

  describe "validations" do
    it "can create a valid book" do
      result = @work.valid?

      expect(result).must_equal true
    end
    
    it "cannot create a book without a title" do
      @work.title = nil

      result = @work.valid?

      expect(result).must_equal false
    end

    it "cannot create a book with the same title as another book" do
      @work2 = Work.new(
        title: "Hello World!",
        creator: "Sarah",
        description: "blahdy blah",
        publication_year: 2019,
        category: "book"
      )

      @work.save
      result = @work2.valid?

      expect(result).must_equal false
    end

    it "can create a movie with the same title as a book" do
      @work2 = Work.new(
        title: "Hello World!",
        creator: "Sarah",
        description: "blahdy blah",
        publication_year: 2019,
        category: "movie"
      )

      @work.save
      result = @work2.valid?

      expect(result).must_equal true
    end

    it "cannot create a work without a category" do
      @work.category = nil
      result = @work.valid?

      expect(result).must_equal false
    end

    it "cannot create a work with an invalid catogery" do
      @work.category = "youtube video"
      result = @work.valid?

      expect(result).must_equal false
    end
  end

  describe "organize works by category" do
    it "has 3 categories: book, movie, and album" do
      @work.save

      @work2 = Work.create(
        title: "Hello World! Hello World!",
        creator: "Sarah",
        description: "blahdy blah",
        publication_year: 2019,
        category: "movie"
      )
      @work3 = Work.create(
        title: "Jumpy Jump",
        creator: "Sarah",
        description: "blahdy blah",
        publication_year: 2019,
        category: "album"
      )
      works_by_category = Work.organize_work_by_category

      expect(works_by_category.keys.length).must_equal 3
      expect(works_by_category.keys).must_include "book"
      expect(works_by_category.keys).must_include "album"
      expect(works_by_category.keys).must_include "movie"
    end

    it "each key points to an array of works" do
      # arrange
      @work2 = Work.create(
        title: "Hello World! Hello World!",
        creator: "Sarah",
        description: "blahdy blah",
        publication_year: 2019,
        category: "book"
      )

      # act
      works_by_category = Work.organize_work_by_category

      # assert
      expect(works_by_category["book"]).must_be_instance_of Array
      expect(works_by_category["book"].first).must_be_instance_of Work
    end
  end

end
