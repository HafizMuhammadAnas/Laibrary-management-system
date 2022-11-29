# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_book, only: %i[show update edit destroy]
  def index
    @books = Book.all
  end

  def borrow_history; end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: 'Book has been updated successfuly'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
      if @book.save!
        redirect_to books_path, notice: 'Book has been created successfuly'
      else
        render :new, status: :unprocessable_entity
      end

  end

  def show; end

  def edit; end

  def destroy
    @book.destroy
    redirect_to book_path, alert: 'Book has been deleted successfuly'
  end

  def sum; end
end

private

def set_book
  @book = Book.find(params[:id])
end

def book_params
  params.require(:book).permit(:book_title, :description, :user_id, :publish_date, :profile_image, :content)
end
