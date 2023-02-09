class UsersController < ApplicationController

  def index
    @list_of_users = User.all.order({:username => :asc})
    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    @the_user = User.where({:username => params.fetch("path_user")}).at(0)
    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show.html.erb"})
    end
  end

  def insert
    new_user = User.new
    new_user.username = params.fetch("input_username")
    new_user.private = true
    new_user.likes_count = 0
    new_user.comments_count = 0
    new_user.save
    redirect_to("/users/#{new_user.username}")  #to_s to be more save
  end

  def edit
    the_user = User.where({:id => params.fetch("user_id")}).at(0)
    the_user.username = params.fetch("input_username")
    the_user.save
    redirect_to("/users/#{the_user.username}")  #to_s to be more save
  end

end
