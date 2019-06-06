class HomeController < ApplicationController
  def landing
    
    render("home_templates/index.html.erb")
  end

end
