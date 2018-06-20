class UsersController < ApplicationController
  
 get '/signup' do
   erb :'/users/signup'
 end
 
 get '/login' do
   TODO
 end
 
 post '/users' do
   @user = User.find_or_create_by(username: params[:user][:username])
   if @user
     sessions[:id] = @user.id
     redirect_to '/users/#{@user.id}'
   else
     redirect_to '/users/signup'
   end
 end
 
 get '/users' do
   TODO
 end
 
 get '/users/:id' do
   # check if user is logged in?
   @user = User.find(params[:id])
  erb :'/users/show'    
 end
end