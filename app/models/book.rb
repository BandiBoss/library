class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :author
  has_many :reviews, dependent: :destroy

  has_attached_file :book_img, styles: { boook_index: "250x350>", book_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/

  validates :title, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :category_id, presence: true, allow_blank: false

end
