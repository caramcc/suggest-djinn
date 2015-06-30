class UserController < ApplicationController


  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def add_item
    item_name = params[:user][:item_name]
    rating = params[:user][:rating]

    item = Item.find_or_create_by(name: item_name)


    rate = Ranking.new(item_id: item.id, user_id: current_user.id, ranking: rating)
    rate.save

    Item.cascade(item.id, current_user.id, rating.to_i)

    redirect_to '/rate'
  end

  def rate_new
    #TODO make non-naive, also make useful
    top = Ranking.group('item_id').order('count_item_id desc').count('item_id').first(100)
    titles = []
    top.each do |t|
      name = Item.find_by_id(t[0]).name
      unless name.blank?
        titles.push name
      end
    end
    @top_items = titles
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
