class UserBookController < ApplicationController
    before_action :authenticate_user!
    def index
      @books = current_user.books
    end
    def add 
      book_id = params.require(:book).permit(:id)
      book = Book.find(book_id[:id])
      unless book.nil?
        current_user.books.push(book)
      end
      redirect_to action: "index"
    end
end
