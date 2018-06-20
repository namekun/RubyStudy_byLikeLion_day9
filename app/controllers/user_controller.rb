class UserController < ApplicationController
    
    def index
        @users = User.all
        @login_user = User.find(session[:user_id]) if session[:user_id]
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def new
    
    end
    
    def create
        user = User.new
        user.user_id = params[:user_id]
        user.password = params[:password]
        user.ip_address = request.ip
        user.save
        redirect_to "/user/#{user.id}"        
    end
    
    def update
        @user = User.find(params[:id])
    end
    
    def edit
        user = User.find(params[:user_id])
        user.password = params[:password]
        user.save
        redirect_to "/user/#{user.id}"
    end

    def sign_in
        # 로그인 되어있는지 확인하고, 
        # 로그인 되어있으면 원래 페이지로 돌아가기
    end
    
    def login
        # 유저가 입력한 ID, PW를 기반으로
        # 실제로 로그인이 이루어지는 곳
        id = params[:user_id]
        pw = params[:password]
        user = User.find_by_user_id(id)
        if !user.nil? and user.password.eql?(pw)
            # 해당 user_id 로 가입한 유저가 있고, 패스워드도 일치하는 경우
            session[:user_id] = user.id
            flash[:success] = "로그인에 성공했습니다!"
        else
            #가입한 user_id 가 없거나, 패스워드가 틀린경우
            flash[:error] = "가입된 유저가 아니거나, 비밀번호가 틀립니다."
            redirect_to "/sign_in"
        end
        
        
    #   user = User.find_by_user_id(params[:user_id])
    #   if !user.nil? and user.password.eql?(params[:password]) 
    #         # user가 있고, 비밀번호도 맞는 경우
    #         flash[:success] = "로그인에 성공했습니다"
    #         session[:user_id] = user.id #session은 정보를 계속 유지할 수 있는 방안.
    #         redirect_to '/users'
    #   else
    #         # user가 비어있거나, 비밀번호가 틀린경우
    #         flash[:error] = "등록된 유저가 아니거나, 비밀번호가 틀립니다."
    #         redirect_to '/sign_in'
    #   end
    end
    
    
    def logout
       session.delete(:user_id) 
       flash[:success] = "로그아웃에 성공했습니다!"
       redirect_to '/users'
    end
end
