class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def show
    # @review = @book.reviews.build
    # @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Libro creado con éxito.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Libro actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Libro eliminado con éxito.'
  end

  def search
    @books = Book.where('title LIKE ?', "%#{params[:query]}%")
    render :index
  end

  private

  def set_book
    @book = Book.find(params[:id])
    # raise
  end

  def book_params
    params.require(:book).permit(:title, :author, :price, :genre, :isbn, :synopsis)
  end
end
