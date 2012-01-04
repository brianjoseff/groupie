class PostImagesController < ApplicationController
  def index
    @imageable = find_imageable
    @images = @imageable.comments
  end

  def create
    @imageable = find_imageable
    @image = @imageable.post_images.build(params[:post_image])
    if @image.save
      flash[:notice] = "Successfully created image."
      redirect_to current_user
    else
      render :action => 'new'
    end
  end

  private

  def find_imageable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end