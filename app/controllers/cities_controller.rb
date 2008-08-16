class CitiesController < ApplicationController
  before_filter :admin_required, :except => [:show]
  # GET /cities
  # GET /cities.xml
  def index
    @cities = City.find(:all, :conditions => {:lang =>params[:lang]})
    @cities = City.find(:all, :conditions => {:lang =>@lang.to_s}) if @cities.empty? 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cities }
      format.js  { render  :json => @cities.to_json }
    end
  end

  # GET /cities/1
  # GET /cities/1.xml
  def show
    @city = City.find_by_ident_name_and_lang(params[:id],@lang.to_s)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @city }
    end
  end

  # GET /cities/new
  # GET /cities/new.xml
  def new
    @country  = Country.find_by_id_and_lang(params[:country_id],params[:lang])
    @city = City.new(:lang => @country.lang)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @city }
    end
  end

  # GET /cities/1/edit
  def edit
    @city = City.find(params[:id])
    @country  = @city.country
  end

  # POST /cities
  # POST /cities.xml
  def create
    @city = City.new(params[:city])
    @country  = Country.find(params[:country_id])

    @city.country_id,@city.lang=@country.id,@country.lang
    @city.assign_idents
    managing_photos

    respond_to do |format|
      if @city.save
        flash[:notice] = 'Город добавлен.'
        format.html { redirect_to countries_path }
        format.xml  { render :xml => @city, :status => :created, :location => @city }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cities/1
  # PUT /cities/1.xml
  def update
    @city = City.find(params[:id])
    @city.attributes=params[:city]
    @city_coord = CityCoord.find_or_create_by_city_ident_num(params[:city_coord][:city_ident_num])
    @city_coord.attributes =params[:city_coord]
    @city_coord.save
    managing_photos

    respond_to do |format|
      if @city.save!
        flash[:notice] = 'Город изменён.'
        format.html { redirect_to countries_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.xml
  def destroy
    @city = City.find(params[:id])
    @city.destroy

    respond_to do |format|
      format.html { redirect_to(countries_url) }
      format.xml  { head :ok }
    end
  end

  def managing_photos
    params[:photos] ||= []
    params[:photos].each do |photo|
      photo[:city_ident_num]=@city.ident_num
      @city.city_photos.build(photo) unless photo[:uploaded_data] == ""
    end

    params[:existing_photos] ||= []
    params[:existing_photos].each_value do |photo|
      @city_photo = CityPhoto.find(photo[:id])
      @city_photo.update_attributes(photo) unless photo[:uploaded_data] == ""
      @city_photo.update_attribute(:main,photo[:main])
    end unless params[:existing_photos].empty?
  end


end
