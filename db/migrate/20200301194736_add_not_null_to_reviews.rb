class AddNotNullToReviews < ActiveRecord::Migration[6.0]
  def change
    change_column_null :reviews, :comment, false
  end
end
