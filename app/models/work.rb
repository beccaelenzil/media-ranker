class Work < ApplicationRecord
  # relations
  has_many :votes
  #has_many :ranking_users, through: :votes, source: :user

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

    work_category_hash_alpha = {}
    work_category_hash.each do |key, value|
      work_category_hash_alpha[key] = alpha(value)
    end

    return work_category_hash_alpha
  end

  def self.top_ten(category)
    work_category_hash = organize_work_by_category

    if work_category_hash[category]
      alphabetized_works = work_category_hash[category]
      n = alphabetized_works.length
    else
      work_category_hash[category] = []
      alphabetized_works = []
      n = 0
    end

    sorted_by_vote_count_works = alphabetized_works.sort_by do |work|
      work.vote_count
    end

    if n > 10
      return sorted_by_vote_count_works.reverse[0,10]
    else
      return sorted_by_vote_count_works.reverse
    end
  end

  def self.choose_featured_work
    return Work.order(vote_count: :desc).first
  end

  def upvote
    self.vote_count += 1
  end

  private
  def self.alpha(works)
    alpha_works = works.sort_by do |work|
      work.title
    end

    return alpha_works.reverse
  end

end

  
