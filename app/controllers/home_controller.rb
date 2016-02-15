class HomeController < ApplicationController
  before_action :authorize#, except: [:show, :index]
  
  #TODO: at the beginning load the level of the user from db 
  #TODO: save progress in the DB at the end of each level
  def index
    num = params[:num]
    if num.nil?
      num = 1
    end
    @level = Level.find_by number: num 
    @color = params[:color]
  end
  
  def show
    num = params[:num]
    if num.nil?
      num = 1
    end
    @level = Level.find_by number: num 
    @color = params[:color]
  end
  
  def nextLevel
    numLevel = params[:level]
    @level = Level.find_by number: numLevel
    puts 'level: ' 
    puts @level.number
    render '/home/index/' + params[:color] + '/' + numLevel
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
