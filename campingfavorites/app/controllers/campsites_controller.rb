class CampsitesController < ApplicationController
  

  get '/campsites' do
    @campsites = Campsite.all
    if logged_in?
      erb :'/campsites/index'
    else
      redirect '/'
    end
  end
  
  post '/campsites' do
    # create camp and set created_by to current_user.id
    @campsite = Campsite.new(params[:campsite])
    @campsite.created_by = current_user.id
    if @campsite.save
      current_user.campsites << @campsite
      redirect "/campsites"
    else
      flash[:message] = "A campsite with that name has already been added!"
      erb :'/campsites/new'
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
    if logged_in? && @campsite.created_by == current_user.id
      erb :'/campsites/edit'
    else
      flash[:message] = "Not allowed to edit, sorry!"
      redirect '/users/home'
    end
  end
  
  post '/campsites/:id' do
    @campsite = Campsite.find(params[:id])
    if logged_in? && @campsite.created_by == current_user.id
      params[:campsite].each do |k,v|
        if !v.empty?
          @campsite.update_attributes(k => v)
        end
      end
      @campsite.save
      redirect '/users/home'
    else
      redirect '/users/home'
    end
  end
  
  post '/campsites/:id/delete' do
      @campsite = Campsite.find(params[:id])
    if logged_in? && @campsite.created_by == current_user.id
      @campsite.destroy
      redirect '/campsites'
    else
      flash[:message] = "Not allowed to delete, sorry!"
      redirect '/users/home'
    end
  end
  
end