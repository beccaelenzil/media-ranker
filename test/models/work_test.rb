require "test_helper"

describe Work do
  before do
    # make a works database
  end
  describe "organize works by category" do
    it "has 3 categories" do
      works_by_category = Work.organize_by_category

      expect(works_by_category.keys.length).must_equal 3
    end

    it "each key point to an array of works" do
      works_by_category = Work.organize_by_category

      expect(works_by_category["movie"]).must_by_type_of array
      expect(works_by_category["movie"].first).must_by_type_of Work
    end

  end
end
