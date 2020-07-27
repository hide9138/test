class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def create
    @new_book = Book.new
    @books = Book.all
    @user = current_user
    if @new_book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@new_book.id)
    else
      render "index"
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def correct_user
    user = Book.find(params[:id]).user
    if current_user.id != user.id
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
