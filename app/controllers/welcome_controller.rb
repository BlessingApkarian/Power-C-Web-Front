# A controller is simply a class that is defined to inherit from 
# ApplicationController. It's inside this class that you'll define methods that 
# will become the actions for this controller. These actions will perform CRUD 
# operations on the articles within our system.

# There are public, private and protected methods in Ruby, but only public 
# methods can be actions for controllers.

class WelcomeController < ApplicationController
  def index
    @articles = Article.all
  end
end
