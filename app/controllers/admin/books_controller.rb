class Admin::BooksController < ApplicationController
  layout "admin"
  before_action :load_book, except: %i(index new create)

  def index
    @books = Book.newest.by_category(params[:category_id]).paginate page:
      params[:page], per_page: Settings.per_page
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to admin_books_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      flash[:success] = t ".update"
      redirect_to admin_books_path
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = t "deleted"
      redirect_to admin_books_path
    else
      flash[:danger] = t "un_delete"
      redirect_to admin_root_path
    end
  end

  private

  def book_params
    params.require(:book).permit :title,
      :publish_date, :content, :description, :author, :publisher,
      :rate_points, :number_pages, :category_id, :book_img
  end

  def load_book
    @book = Book.find_by_id params[:id]
    return if @book
    flash[:danger] = t "messenger"
    redirect_to admin_book_path
  end
end
