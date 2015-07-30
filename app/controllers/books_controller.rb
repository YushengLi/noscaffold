class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(clean_params)
    if @book.save
      flash[:notice] = '成功新增書本'
      redirect_to books_path
    else
      render :new
    end
  end

  private
  def clean_params
    clean_params = params.require(:book).permit(:title, :content)
  end
end
