class RemoveColumnsFromVotes < ActiveRecord::Migration[5.2]
  def change
    remove_column(:votes, :category)
    remove_column(:votes, :title)
    remove_column(:votes, :creator)
    remove_column(:votes, :publication_year)
    remove_column(:votes, :description)
  end
end

