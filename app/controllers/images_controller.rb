class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:like]
  before_action :set_image, only: [:show, :like]
  respond_to :js, :json, :html

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
    
  def like
   if !current_user.liked? @image
      @image.liked_by current_user
   elsif current_user.liked? @image
      @image.unliked_by current_user
   end   
end
end


  private

  def image_params
    params.require(:image).permit(:image, :description)
  end

  def set_image
      @image=Image.find(params[:id])
   end   
end
