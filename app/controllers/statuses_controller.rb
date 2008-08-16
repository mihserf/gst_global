class StatusesController < ApplicationController
  def index
    if params[:lang]
      @statuses = Status.find(:all, :order => "number", :conditions => {:lang => params[:lang]})
    else
      @statuses = Status.find(:all, :order => "lang,number")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @statuses }
      format.js  { render :json => @statuses.to_json }
    end
  end

  def show
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    respond_to do |format|
      if @status.update_attributes(params[:status])
        flash[:notice] = 'Член изменён.'
        format.html { redirect_to statuses_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(params[:status])
    respond_to do |format|
      if @status.save
        flash[:notice] = 'Член добавлен.'
        format.html { redirect_to statuses_path }
        format.xml  { render :xml => @status, :status => :created, :location => @status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @status.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    respond_to do |format|
      format.html { redirect_to(statuses_url) }
      format.xml  { head :ok }
    end
  end

end
