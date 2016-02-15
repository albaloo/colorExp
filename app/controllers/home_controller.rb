class HomeController < ApplicationController
  before_action :authorize#, except: [:show, :index]
  
  def index
    @level = Level.find_by number: 1
  end
  
  def show
    @level = Level.find_by number: 1
  end
  
  def nextLevel
    numLevel = params[:level]
    @level = Level.find_by number: numLevel
    puts 'level: ' 
    puts @level.number
    render '/home/show'
  end
  
  def submitCode
    submittedCode = params[:subcode]
    render :json => { }
  end
  
  def authorize
    if current_user.nil?
      redirect_to login_url, alert: "Not authorized! Please log in."
    else
      if @post && @post.user != current_user
        redirect_to root_path, alert: "Not authorized! Only #{@post.user} has access to this post."
      end
    end
  end
end
