class ReviewsController < ApplicationController
  before_action :find_book
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.book_id = @book.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to book_path(@book), success: "All ok"
    else
      render :new, error: "smth wrong"
    end
  end
  #
  # add_flash_types :success, :danger, :info, :warning
  # example       render 'new' =>, error: "smth wrong" <=
  # action: create, update, destroy
  # хром открой
  def edit
  end

  def update
    # binding.pry
    if @review.update(review_params)
      redirect_to book_path(@book)
    else
      render :edit

      if @review.update(review_params)
        redirect_to book_path(@book), success: "Review succesful updated"
      else
        render :new, error: "You cant update this review"
      end
    end
  end

  def destroy
    @review.destroy
    redirect_to book_path(@book)

    if @review.destroy
      redirect_to book_path(@book), success: "Review succesful deleted"
    else
      render :new, error: "You cant delete this review"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

end