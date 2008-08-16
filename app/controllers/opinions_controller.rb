class OpinionsController < ApplicationController
  before_filter :admin_required, :except => [:show]

  def new
    @city  = City.find_by_id_and_lang(params[:city_id],params[:lang])
    @opinion = Opinion.new(:lang => @city.lang)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @city }
    end
  end

  def create
    @opinion = Opinion.new(params[:opinion])
    @city = City.find(params[:city_id])
    @opinion.city_id,@opinion.lang=@city.id,@city.lang
    @opinion.assign_idents
    params[:opinion_photo][:opinion_ident_num] = @opinion.ident_num unless params[:opinion_photo].nil?
    @opinion.build_opinion_photo(params[:opinion_photo])
    respond_to do |format|
      if @opinion.save
        flash[:notice] = 'Отзыв добавлен.'
        format.html { redirect_to countries_path }
        format.xml  { render :xml => @opinion, :status => :created, :location => @opinion }
       else
        format.html { render :action => "new" }
        format.xml  { render :xml => @opinion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @opinion = Opinion.find(params[:id])
    @city = City.find(params[:city_id])
  end

  def update
    @opinion = Opinion.find(params[:id])
    params[:opinion_photo][:opinion_ident_num] = @member.ident_num unless params[:opinion_photo].nil?
    @opinion.opinion_photo.update_attributes(params[:opinion_photo]) unless params[:opinion_photo].nil?
    respond_to do |format|
      if @opinion.update_attributes(params[:opinion])
        flash[:notice] = 'Отзыв изменён.'
        format.html { redirect_to countries_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opinion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to(countries_url) }
      format.xml  { head :ok }
    end
  end

end
