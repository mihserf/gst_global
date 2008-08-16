class SuccessStoriesController < ApplicationController
  before_filter :get_member, :except => [:index, :destroy]

  def index
    @success_stories = SuccessStory.find(:all, :order => "lang")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @success_stories }
    end
  end

  def show
  end

  def edit
    @success_story = @member.success_story
  end

  def update
    @success_story = @member.success_story
    params[:success_story][:lang]=@member.lang
    @success_story.attributes = params[:success_story]
    params[:success_story_photo][:success_story_ident_num] = @success_story.ident_num unless params[:success_story_photo].nil?
    @success_story.build_success_story_photo(params[:success_story_photo])
    respond_to do |format|
      if @success_story.save!
        flash[:notice] = 'История изменена.'
        format.html { redirect_to members_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @success_story = SuccessStory.new
    @member = Member.find(params[:member_id])
  end

  def create
    params[:success_story][:lang]=@member.lang
    params[:success_story][:ident_name]=@member.ident_name+'_success_story'
    params[:success_story][:ident_num]=@member.ident_num
    @success_story = SuccessStory.new(params[:success_story])
    params[:success_story_photo][:success_story_ident_num] = @success_story.ident_num unless params[:success_story_photo].nil?
    @success_story.build_success_story_photo(params[:success_story_photo])
    @member.success_story = @success_story
    respond_to do |format|
      if @member.save
        flash[:notice] = 'История добавлена.'
        format.html { redirect_to members_path }
        format.xml  { render :xml => @success_story, :status => :created, :location => @success_story }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @success_story.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @success_story = SuccessStory.find(params[:id])
    @success_story.destroy
    respond_to do |format|
      format.html { redirect_to(success_stories_url) }
      format.xml  { head :ok }
    end
  end

  private

  def get_member
    @member = Member.find(params[:member_id])
  end

end
