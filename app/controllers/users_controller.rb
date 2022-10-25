class UsersController < ApplicationController
    def new 
    end

    def create
       @user = User.new(user_params)
       if user.save
           login!(@user) 
           redirect_to user_url 
       else 
            flash.now[:errors] = @users.errors.full_messages
            render :new
       end
    end

    def destroy

    end

    private

    def user_params 
        params.require(:user).permit{:email, :password}
    end
end