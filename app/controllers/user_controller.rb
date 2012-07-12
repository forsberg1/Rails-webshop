class UserController < ApplicationController
  before_filter :authenticate_user!
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
         redirect_to action: 'checkout', controller: 'cart'
      else
       
      end
   end
end
