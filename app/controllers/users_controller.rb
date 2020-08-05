class UsersController < ApplicationController
   def index
     @user=User.all
 end

    def show
    @user = User.find_by(username: params[:username])
    @image= @user.images.order(created_at: :desc)
  end

  def edit
  	 @user=User.find_by(username: params[:username])
 end

  def new
    @user = User.find_by id: params["user_id"]
  end

  def create
    @user = current_user.build(user_params)
    if @user.save
      redirect_to @user, notice: 'Profile updated!'
    else
      render :new
    end
  end

  def search
    @users=User.all.where("username LIKE ? OR first_name LIKE ? OR last_name LIKE ?",
      "%"+params[:search]+"%","%"+params[:search]+"%","%"+params[:search]+"%")
  end  
  

 def follow
  @user = User.find(params[:id])

  if current_user
    if current_user == @user
      flash[:error] = "You cannot follow yourself."
    else
      current_user.follow(@user)
      flash[:notice] = "You are now following @user.full_name"
    end
  else
    flash[:error] = "You must <a href='/users/sign_in'>login</a> to follow @user.full_name"
  end
end

def unfollow
  @user = User.find(params[:id])

  if current_user
    current_user.stop_following(@user)
    flash[:notice] = "You are no longer following @user.full_name"
  else
    flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow @user.full_name"
  end
end

   	
  private

  def user_params
    params.require(:user).permit(:profile_pic,:gender,:bio,:phone,:search)
  end 
end
