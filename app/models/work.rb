class Work < ApplicationRecord
  # relations
  has_many :votes

  # validations

  CATEGORIES = ["book", "album", "movie"]

  validates :category, presence: true,
  inclusion: {in: CATEGORIES}

  validates :title, presence: true, uniqueness: {scope: :category}

  def self.organize_work_by_category
    works = Work.all
    work_category_hash = {}

    works.each do |work|
      if work_category_hash[work.category].nil?
        work_category_hash[work.category] = []
        work_category_hash[work.category] << work
      else
        work_category_hash[work.category] << work
      end
    end
    return work_category_hash
  end

  def self.top_ten(category)
    work_category_hash = organize_work_by_category
    if work_category_hash[category]
      n = work_category_hash[category].length
    else
      work_category_hash[category] = []
      n = 0
    end

    if n > 10
      return work_category_hash[category].sample(10)
    else
      return work_category_hash[category]
    end
  end

  def self.choose_featured_work
    return Work.all.sample
  end

end

  
