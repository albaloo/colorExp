class HomeController < ApplicationController
  before_action :authorize#, except: [:show, :index]
  
  #TODO: at the beginning load the level of the user from db 
  #TODO: save progress in the DB at the end of each level
  #TODO: PUT A LOGOUT link in header
  def indexx
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
  
  def course    
    numLevel = params[:num]
    if numLevel.nil?
      numLevel = 1
    end
    prog = Progress.where(:user => current_user).first
    if prog.nil?
      prog = Progress.create!(:level => numLevel)
      prog.user = current_user
      prog.save
    else
      prog.level= numLevel
      prog.save
    end
  
    @level = Level.find_by number: numLevel
    @color = params[:color] 
    puts "here here here"
    puts numLevel
    if numLevel == "5"
      render 'home/survey'
    else
      render 'index'   
    end  
   
  end
  
  def submitSurvey
    #TODO: save answers
    #TODO: generate a random code and save it in progress.
    @code = params[:color] + current_user.id.to_s
    @color = params[:color]
    render 'final'
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
