class CampsitesController < ApplicationController
  

  get '/campsites' do
    @campsites = Campsite.all
    if !session[:id].nil?
      erb :'/campsites/index'
    else
      redirect :'/'
    end
  end
  
  post '/campsites' do
    # create camp and set created_by to current_user.id
    @campsite = Campsite.new(params[:campsite])
    if @campsite.save
      @campsite.created_by = session[:id]
      current_user.campsites << @campsite
      redirect "/campsites/#{@campsite.id}"
    else
      flash[:message] = "A campsite with that name has already been added!"
      redirect '/campsites/new'
    end
  end

  get '/campsites/new' do
    if logged_in?
      erb :'/campsites/new'
    else
       redirect '/'
    end
  end
  
  get '/campsites/:id' do
    @campsite = Campsite.find(params[:id])
    erb :'/campsites/show'
  end
  get '/campsites/:id/edit' do
  # check if created_by == curent_user.id
  # logged_in?
    
  end
  
  get '/campsites/:id' do
#     add "delete" button
# check if created_by == curent_user.id
  end
end