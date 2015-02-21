class StoriesController < ApplicationController
  def index
    if current_user.role = "Mentor" && current_user.stories.empty?
      redirect_to stories_new_path
    end
    if  current_user.role = "Mentee"
      @stories = Story.all
    else
      redirect_to edit_user_registration_path
    end 
    
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    respond_to do |format|
      if @story.save
        format.html  { redirect_to(@story,
                    :notice => 'Your story has been successfully saved. ') }
        format.json  { render :json => @post,
                    :status => :created, :location => @post }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @post.errors,
                    :status => :unprocessable_entity }
      end
    end

  end
  
  def show
    
  end
  
  def edit 
    
  end

  def edit

  end

  private

  def story_params
    params.require(:story).permit(:user_id, :post)
  end

end
