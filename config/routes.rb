Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_user", { :controller => "users", :action => "show"})
  get("/insert_user_record", { :controller => "users", :action => "insert"})
  get("/update_user/:user_id", { :controller => "users", :action => "edit"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_photo", { :controller => "photos", :action => "show"})
  get("/delete_photo/:path_photo", { :controller => "photos", :action => "delete"})
  get("/insert_photo_record", { :controller => "photos", :action => "insert"})
  get("/update_photo/:path_photo", { :controller => "photos", :action => "edit"})
  get("/insert_comment_record", { :controller => "photos", :action => "comment"})

end
