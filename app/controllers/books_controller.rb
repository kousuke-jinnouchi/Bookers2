class BooksController < ApplicationController
  def create
    @new_book =Book.new(book_params)
    @new_book.user_id = current_user.id
    @new_book.save
    redirect_to books_path
  end

  def index
    @user = current_user
    @books = Book.all 
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id]) 
    @user = @book.user
    @new_book = Book.new
  end

  def edit 
    @book = Book.find(params[:id])
  end

  def update 
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id) 
  end

  def destroy
    book = Book.find(params[:id]) 
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
