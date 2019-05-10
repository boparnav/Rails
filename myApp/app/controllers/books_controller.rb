class BooksController < ApplicationController


  def index
    @list_of_books= Book.all
  end
  def show
     id = params[:id]
     @result_book= Book.find(id)

  end


  def new
      @book = Book.new
  end

 def create

     @book= Book.new(
            params.require(:book).permit(:title, :author, :description)
    )
     result = @book.save()
   if result
     redirect_to :controller => 'books', :action => 'index'

   else

     redirect_to_back
     #puts result

     #puts "Not saved !"
   end

 end

end
