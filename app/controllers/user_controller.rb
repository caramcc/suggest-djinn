class UserController < ApplicationController


  def create
    user = User.new(user_params)


    if user.save
      session[:user_id] = user.id
      redirect_to '/users#info'
    else
      redirect_to '/signup'
    end
  end

  def add_item
    item_name = params[:item_name]
    rating = params[:rating]

    item = Item.find_by_name(item_name)

    if item.nil?
      item = Item.new(name: item_name)
      item.save
    end



  end

  def suggest
    user = User.find_by_id(params[:id])
    number = params[:number]
    number ||= 25
    render text: user.suggest(number)
  end


  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
