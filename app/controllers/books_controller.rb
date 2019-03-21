class BooksController < ApplicationController
  before_action :logged_in_user, except: %i(index show find search)
  before_action :load_book, :build_like, except: %i(index find search searchlike)
  before_action :admin_user, except: %i(index show find search searchlike)
  before_action :book_by_category, only: %i(show find search)
  before_action :load_by_like, only: %i(searchlike)

  def index
    @books = Book.newest
    @book_news = Book.newest.paginate page: params[:page],
      per_page: Settings.controllers.book.index_page
  end

  def show
    return unless @book.reviews
    @book.rate_points = @book.reviews.average(:rate)
  end

  def find; end

  def searchlike
    @searchlike = Book.by_book_like(@by_like)
  end

  def search
    @books = Book.by_author_title_book(params[:search])
  end

  private

  def build_like
    @like = @book.likes.new
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t "controller.no_data_book"
    redirect_to books_path
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def book_by_category
    @books = Book.by_category(params[:category]).limit Settings.models.limit
  end

  def load_by_like
    @by_like = current_user.likes.pluck(:book_id)
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "please_login"
    redirect_to login_path
  end
end
