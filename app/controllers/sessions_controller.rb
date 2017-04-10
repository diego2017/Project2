class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:input])
    if user
      session[:user_id] = user.id
      if user.user_type === "Customer"
        redirect_to search_flight_path
      else
        redirect_to airplanes_admin_path
      end
    else
      render :new
    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
