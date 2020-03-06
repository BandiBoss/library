class Category < ApplicationRecord
  has_many :books
  # change_column :books, :author_ids,  :integer, array: true, default: []
end
