class AuthorsController < ApplicationController

  def index
    @authors=Author.all
  end

  def show
    @author = Author.find(params[:id])
    @quotes = Quote.all.where(author_id:@author.id)

  end

  def new
    @author=Author.new
  end

  def edit
    @author=Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)
#nice job checking for successful save. Consider implementing flash here.
    if @author.save
      redirect_to @author
    else
      render 'new'
    end

  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end

  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  end

  private
#I like that you considered more options for the author object. I think if there
#was enough time that'd be a cool feature to add. A more robuse Bio-type page.
    def author_params
      params.require(:author).permit(:name, :full_name, :birthyear, :deathyear)
    end

end
