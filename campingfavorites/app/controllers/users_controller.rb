class UsersController < ApplicationController
  
 get '/signup' do
   erb :'/users/signup'
 end
 
 get '/login' do
   erb :'/users/login'
 end
 
 post '/login' do
   user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
        session[:id] = user.id
        redirect '/users/home'
    else
        redirect '/signup'
    end
 end
 
 get '/logout' do
   session.clear
   redirect '/'
 end
 
 post '/users' do
   @user = User.new(params[:user])
   if @user.save
     session[:id] = @user.id
     redirect '/users/home'
   else
     redirect '/signup'
   end
 end
 
 get '/users/home' do
   if logged_in?
    @user = current_user
    erb :'/users/show'
    else
      redirect '/signup'
    end
 end
 
 get '/users' do
   @users = User.all
   erb :'users/index'
 end
 
end