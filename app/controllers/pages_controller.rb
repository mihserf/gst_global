class PagesController < ApplicationController
  before_filter :admin_required, :only => [:index,:new,:create,:edit,:update]

  def index
    @pages=Page.find(:all, :order => :ident_name)
    #render(:layout=>"admin")
  end

  def new
    @page=Page.new
  end

  def create
    @page=Page.new(params[:page])
    if  @page.save!
      flash[:notice]="Страница создана. Добавте изменения в файл /config/routes.rb"
    end
  end

  def edit
    @page=Page.find(params[:id])
    #render(:layout=>"admin")
  end


  def update
    @page=Page.find(params[:id])
    if  @page.update_attributes(params[:page])
      flash[:notice]="страница обновлена"
      redirect_to pages_path
    end
  end

  def home
    @page=Page.find_by_ident_name("home")
  end

  def about_us
    @page=Page.find_by_ident_name("about")
  end

  def contacts
    @page=Page.find_by_ident_name("contacts")
  end

  def faq
    @page=Page.find_by_ident_name("faq")
  end

  def charity
    @page=Page.find_by_ident_name("charity")
  end

  def founder
    @page=Page.find_by_ident_name("founder")
  end

  def team
    @page=Page.find_by_ident_name("team")
  end

  def mission
    @page=Page.find_by_ident_name("mission")
  end

  def principles
    @page=Page.find_by_ident_name("principles")
  end
end
