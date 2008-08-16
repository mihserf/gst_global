class AdminController < ApplicationController
  before_filter :admin_required, :only => :index
  
  def login
    if request.post?
      login = params[:login]
      password = params[:password]
      if login == "admin" && password == "gstseminars"
        session[:admin]=true
        redirect_to :action => "index"
      else
        redirect_to :back
      end
    end
  end
  
  def logout
    session[:admin]=false
    redirect_to "/"
  end

  def index
  end

end
