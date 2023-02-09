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

end
