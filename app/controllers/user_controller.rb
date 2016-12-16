class UserController < ApplicationController

      before_filter :authorize, :except => [:new, :create]

    def show
    render("index")
    end

    def create
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/user/'+user.id.to_s
      else
        redirect_to '/signup'
      end
    end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
