class MusicBlogsController < ApplicationController

  def index
    @music_blogs = MusicBlog.all
  end

  def new #get form to show up
    @music_blog = MusicBlog.new
  end

  # show = where we show specific info about 1 instance of class - so need to lookup correct instance using :id given in URL
  # grab id from url to find the RIGHT entry in DB, THEN save it to an instance var to use in #show view!
  def show
    @music_blog = MusicBlog.find(params[:id])
  end

  def edit
    @music_blog = MusicBlog.find(params[:id])
    redirect_to music_blogs_path
  end

  def create #THIS WONT WORK W/O DEFINING STRONG PARAMS!!!!
    @music_blog = MusicBlog.create music_blog_params
    redirect_to music_blog_path(@music_blog) #redirect to #show
  end

  def update
    @music_blog = MusicBlog.find(params[:id]) #look up specific post to edit
    if @music_blog.update music_blog_params #update post using form data
      flash[:notice] = "Your post was successfully updated"
      redirect_to edit_music_blog_path
    else
      redirect_to music_blog_path(@music_blog) #redirect back to #show
    end
  end

  def destroy

  end

  private

#strong params: return params from form on #new
  def music_blog_params
    # ?do I need .permit(*args) ?
    params.require(:music_blog).permit(:title, :content, :rating)
  end

end
