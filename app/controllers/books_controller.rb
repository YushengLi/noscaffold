class BooksController < ApplicationController
  before_action :find_book, only[:show, :edit, :upadte, :destroy]

  def index
    @books = Book.all
  end

  def show
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

  def edit
  end

  def update
    if @book.update(clean_params)
      redirect_to books_path, notice: '成功更新書本'
    else
      render :new
    end
  end


  def destroy
    @book.destroy
    # flash[:notice] = '已刪除'
    redirect_to books_path, notice: '已成功刪除。'
  end

  private
  def clean_params
    clean_params = params.require(:book).permit(:title, :content)
  end

  def find_book
    @book = Book.find_by(id: params[:id])
  end
end
