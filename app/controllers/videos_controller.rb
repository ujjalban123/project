class VideosController < ApplicationController
 
  # GET /videos
  # GET /videos.json
  def index
    @video = Video.order(cached_votes_score: :desc)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video=Video.find(params[:id])
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  def like
    @video = Video.find(params[:id])
    @video.liked_by current_user
    if request.xhr?
     render json: { count: @video.get_likes.size, id: params[:id] }
   else
    redirect_to @video
  end
end

def dislike
    @video = Video.find(params[:id])
    @video.disliked_by current_user
    if request.xhr?
     head json: { count: @video.get_likes.size, id: params[:id] }
   else
    redirect_to @video
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
      format.json { head :no_content }
    end
  end

    # Use callbacks to share common setup or constraints between actions.
   private
    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:description,:clip )
    end
end
