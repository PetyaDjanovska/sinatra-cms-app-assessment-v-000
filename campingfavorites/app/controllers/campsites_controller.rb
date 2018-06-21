class CampsitesController < ApplicationController
  

  get '/campsites' do
    @campsites = Campsite.all
    if logged_in?
      erb :'/campsites/index'
    else
      redirect :'/'
    end
  end
  
  post '/campsites' do
    # create camp and set created_by to current_user.id
    @campsite = Campsite.new(params[:campsite])
    @campsite.created_by = current_user.id
    current_user.campsites << @campsite
    if @campsite.save
       binding.pry
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
    @campsite = Campsite.find(params[:id])
    binding.pry
    if logged_in? && @campsite.created_by == current_user.id
      erb :'/campsites/edit'
    else
      flash[:message] = "Not allowed to edit, sorry!"
      redirect '/'
    end
  end
  
  patch '/campsites/:id' do
    @campsite = Campsite.find(params[:id])
    if logged_in? && @campsite.created_by == current_user.id
      @campsite.update
    else
      
    end
  end
  
end