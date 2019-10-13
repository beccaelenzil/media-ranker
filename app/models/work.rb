class Work < ApplicationRecord
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
end

  
