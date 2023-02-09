class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all.order({:created_at => :desc})
    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    @the_photo = Photo.where({:id => params.fetch("path_photo")}).at(0)

    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/show.html.erb"})
    end
  end

  def delete
    the_photo = Photo.where({:id => params.fetch("path_photo")}).at(0)
    the_photo.destroy
    redirect_to("/photos")
  end
  
  def insert
    new_photo = Photo.new
    new_photo.image = params.fetch("input_image")
    new_photo.caption = params.fetch("input_caption")
    new_photo.owner_id = params.fetch("input_owner_id")
    new_photo.save
    redirect_to("/photos/#{new_photo.id}")  #to_s to be more save
  end

  def edit
    the_photo = Photo.where({:id => params.fetch("path_photo")}).at(0)
    the_photo.image = params.fetch("input_image")
    the_photo.caption = params.fetch("input_caption")
    the_photo.save
    redirect_to("/photos/#{the_photo.id}")  #to_s to be more save
  end

end
