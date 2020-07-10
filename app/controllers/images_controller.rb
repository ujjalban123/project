class ImagesController < ApplicationController
  def index
    @image= Image.where(user_id: current_user.all_following.pluck(:id))
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to @image, notice: 'Image uploaded!'
    else
      render :new
    end
  end
def like
    @image = Image.find(params[:id])
    @image.liked_by current_user
    if request.xhr?
     render json: { count: @image.get_likes.size, id: params[:id] }
   else
    redirect_to @image
  end
end

def dislike
    @image = Image.find(params[:id])
    @image.disliked_by current_user
    if request.xhr?
     head json: { count: @image.get_likes.size, id: params[:id] }
   else
    redirect_to @image
  end
end

  private

  def image_params
    params.require(:image).permit(:image, :description)
  end
end
