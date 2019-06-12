Rails.application.routes.draw do
  #Home
  match("/", { :controller => "home", :action => "landing", :via => "get" })
  
  
  # Routes for the Borrowingcard resource:

  # CREATE
  match("/new_borrowingcard_form", { :controller => "borrowingcards", :action => "blank_form", :via => "get" })
  match("/insert_borrowingcard_record", { :controller => "borrowingcards", :action => "save_new_info", :via => "post" })

  # READ
  match("/borrowingcards", { :controller => "borrowingcards", :action => "list", :via => "get" })
  match("/borrowingcards/:id_to_display", { :controller => "borrowingcards", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_borrowingcard_form/:id_to_prefill", { :controller => "borrowingcards", :action => "prefilled_form", :via => "get" })
  match("/update_borrowingcard_record/:id_to_modify", { :controller => "borrowingcards", :action => "save_edits", :via => "post" })
  match("return_book/:id_to_return", { :controller => "borrowingcards", :action => "return_book", :via => "post" })



  # DELETE
  match("/delete_borrowingcard/:id_to_remove", { :controller => "borrowingcards", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Book resource:

  # CREATE
  match("/new_book_form", { :controller => "books", :action => "blank_form", :via => "get" })
  match("/insert_book_record", { :controller => "books", :action => "save_new_info", :via => "post" })

  # READ
  match("/books", { :controller => "books", :action => "list", :via => "get" })
  match("/books/:id_to_display", { :controller => "books", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_book_form/:id_to_prefill", { :controller => "books", :action => "prefilled_form", :via => "get" })
  match("/update_book_record/:id_to_modify", { :controller => "books", :action => "save_edits", :via => "post" })

  #BORROW AND RETURN
  match("/borrow_book/:id_to_borrow", { :controller => "books", :action => "borrow_book", :via => "get" })
  
  # DELETE
  match("/delete_book/:id_to_remove", { :controller => "books", :action => "remove_row", :via => "get" })

  
 
  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
