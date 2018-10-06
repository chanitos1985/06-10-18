class BookController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :delete]
    def index
        #Consulta a todos los libros
        @books = Book.all
    end

    def new  #Muestra formulario
        @authors = Author.all
        #Author.find();
        #Author.find_by(name: )
    end

    def create # Crea un libro
        book_param = params.require(:book).permit(:title, :description, :author_id) 
        Book.create(book_param)
        redirect_to action: "index"
    end
    
    def show
        @book = Book.find(params[:id])
        if @book.nil?
            redirect_to action: "index"
        end
    end

    def delete
        @book = Book.find(params[:id])
        unless @book.nil?
            @book.delete
        end
        redirect_to action: "index"
    end

    def edit  # Get
        @book = Book.find(params[:id])
    end

    def edition # Post
        book_param = params.require(:book).permit(:id, :title, :description) 
        @book = Book.find(params[:id])
        Book.edit(book_param)
        redirect_to action: "index"
    end

end
