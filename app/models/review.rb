class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :comment, presence: true, allow_blank: false

end
