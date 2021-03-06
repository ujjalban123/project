class VideosController < ApplicationController
 
  before_action :authenticate_user!, only: [:like]
  before_action :set_video, only: [:show, :like]
  respond_to :js, :json, :html

  def index
    @video = Video.order(cached_votes_score: :desc)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  
  def like
   if !current_user.liked? @video
      @video.liked_by current_user
   elsif current_user.liked? @video
      @video.unliked_by current_user
   end   
end



  def create
    @video = current_user.videos.build(video_params)

      if @video.save
        redirect_to @video, notice: 'Video uploaded!'
      else
        render :new
      end
    end  

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_video }
    end
  end

    # Use callbacks to share common setup or constraints between actions.
   private
    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:description,:clip )
    end

    def set_video
      @video=Video.find(params[:id])
    end
end
