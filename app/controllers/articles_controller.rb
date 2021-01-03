 class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  # We use Article.find to find the article we're interested in, passing in 
  # params[:id] to get the :id parameter from the request. We also use an instance 
  # variable (prefixed with @) to hold a reference to the article object. We do
  # this because Rails will pass all instance variables to the view.
  def show
    @article = Article.find params[:id]
    path = "#{Rails.root}/storage/1j/wc/1jwcp2wpkwgdsmlnki80m6mjdq1y" #this is your job
    @text = File.open(path).read # get the contents in a variable
    
    # @article = Article.find(params[:id])
    # @filename = params[:file].original_filename
  end
  
  def new
  end
  
  # save our new article to the database
  def create
    
    # The render method here is taking a very simple hash with a key of :plain 
    # and value of params[:article].inspect. The params method is the object which 
    # represents the parameters (or fields) coming in from the form. The params 
    # method returns an ActionController::Parameters object, which allows you to 
    # access the keys of the hash using either strings or symbols. 
    # render plain: params[:article].inspect
  
    # after migrating we changed the contents of the create method to what follows:
    # params[:article] contains the attributes we're interested in
    # @article = Article.new(params[:article])
    
    # to increase security, we change the line above to the following:
    @article = Article.new(params.require(:article).permit(:title, :text, :file)) 
    
    # responsible for saving the model in the database
    @article.save
    # redirect the user to the show action
    redirect_to @article
    
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end
  
  # def read
  #   @article = Article.find params[:id]
  #   path = method_to_get_your_path_from_article #this is your job
  #   @text = File.open(path).read # get the contents in a variable
  # end
  
  # made private to make sure it can't be called outside its intended context
  private
    def article_params
      params.require(:article).permit(:title, :text, :file)
    end
end
