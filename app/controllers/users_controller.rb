class UsersController < ApplicationController
   
   skip_before_action :require_login, only: [:new, :create]

   
   def new
    @user = User.new
   end

   def create
   
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
   end

   def index

   end

   def show
      
      @user = User.find_by(id: params[:id])
      
   end

   private 
   def user_params
      params.require(:user).permit(:name, :password, :height, :nausea, :tickets, :happiness, :admin)
   end





end
