class SessionsController < ApplicationController
  def new
  end
     #TODO: in session we have to check whether progress exist and load the level
    #prog = Progress.create!(:level => numLevel)
    #prog.user = current_user
    #TODO: load color and level
  def create
    user = User.find_by_email(params[:username]+"@gmail.com")
    if user && user.authenticate(params[:username]) #user.authenticate(params[:password])
      session[:user_id] = user.id
      #redirect_to root_url, notice: 'Logged in!'
      num = 1
      #prog = Progress.where(user: user)
      #if prog.empty?
      #  num = 1
      #else
      #  num = prog.first.level
      #end
      #puts "num num num"
      #puts num
      redirect_to :controller => "home", :action => "course", :color =>user.color, :num => num, notice: 'Logged in!'
    else
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
