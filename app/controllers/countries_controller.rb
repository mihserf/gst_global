class CountriesController < ApplicationController
  before_filter :admin_required, :except => [:show]
  # GET /countries
  # GET /countries.xml
  def index
    @countries = Country.find(:all, :order => :ident_name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @countries }
    end
  end

  # GET /countries/1
  # GET /countries/1.xml
  def show
    @country = Country.find_by_ident_name_and_lang(params[:id],@lang.to_s) || Country.find(params[:id])
    #@countries = Country.find_all_by_lang(@country.lang)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @country }
    end
  end

  # GET /countries/new
  # GET /countries/new.xml
  def new
    @country = Country.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @country }
    end
  end

  # GET /countries/1/edit
  def edit
    @country = Country.find(params[:id])
  end

  # POST /countries
  # POST /countries.xml
  def create
    @country = Country.new(params[:country])
    @country.assign_idents
    params[:map][:country_ident_num] = @country.ident_num unless params[:map].nil?
    @country.build_map(params[:map]) unless params[:map].nil?

    respond_to do |format|
      if @country.save
        flash[:notice] = 'Country was successfully created.'
        format.html { redirect_to countries_path }
        format.xml  { render :xml => @country, :status => :created, :location => @country }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /countries/1
  # PUT /countries/1.xml
  def update
    @country = Country.find(params[:id])
    @country.attributes = params[:country]
    params[:map][:country_ident_num] = @country.ident_num unless params[:map].nil?
    @country.build_map(params[:map]) unless params[:map].nil?

    respond_to do |format|
      if @country.save!
        flash[:notice] = 'Country was successfully updated.'
        format.html { redirect_to(@country) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.xml
  def destroy
    @country = Country.find(params[:id])
    @country.destroy

    respond_to do |format|
      format.html { redirect_to(countries_url) }
      format.xml  { head :ok }
    end
  end
end
