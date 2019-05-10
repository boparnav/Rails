class PostsController < ApplicationController
  def index
      @list_of_posts= Post.all
    end
    def show
      id = params[:id]
      @result_post= Post.find(id)

    end


    def new
      @post = Post.new
    end

    def create

      @post= Post.new(
          params.require(:post).permit(:name, :author, :description)
      )
      result = @post.save()
      if result
        redirect_to :controller => 'posts', :action => 'index'

      else

        redirect_to_back
        #puts result

        #puts "Not saved !"
      end

    end

  end





