class Api::V1::BooksController < ApplicationController
  def index
    books = Book.all
    render json: books, status: 200
  end

  def show
    book = Book.find_by(id: params[:id])
    if book
      render json: article, status: 200
    else
      render json: {
        error: 'Book not found'
      }
    end
  end

  def create
    book = Book.new(
      Student_name: book_params[:Student_name],
      Book_title: book_params[:Book_title],
      Book_id: book_params[:Book_id],
      Student_class: book_params[:Student_class],
      Date: book_params[:Date],
      Time: book_params[:Time],
      Librarian_name: book_params[:Librarian_name],
      Librarian_phone_number: book_params[:Librarian_phone_number]
    )
    if book.save
      render json: book, status: 200
    else
      render json: {
        error: 'Error Creating..'
      }
    end
  end

  def update
    book = Book.find_by(id: params[:id])
    if book
      book.update(
        Student_name: params[:Student_name],
        Book_title: params[:Book_title],
        Book_id: params[:Book_id],
        Student_class: params[:Student_class],
        Date: params[:Date],
        Time: params[:Time],
        Librarian_name: params[:Librarian_name],
        Librarian_phone_number: params[:Librarian_phone_number]
      )

      render json: 'Book Record Updated Successfully'
    else
      render json: {
        error: 'Book Not Found'
      }
    end
  end

  def destroy
    book = Book.find_by(id: params[:id])

    if book
      book.destroy
      render json: 'Book has been deleted successfully'
    end
  end

  private
  def book_params
    params.require(:book).permit([
      :Student_name,
      :Book_title,
      :Book_id,
      :Student_class,
      :Date,
      :Time,
      :Librarian_name,
      :Librarian_phone_number
    ])
  end
end
