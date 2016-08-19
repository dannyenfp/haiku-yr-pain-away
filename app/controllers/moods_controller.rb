class MoodsController < ApplicationController 

  #creates a new mood 
  get "/moods/new" do
    redirect_if_not_logged_in
    erb :'/moods/new'
  end


  #once submitted this will redirect to a haiku page to create an associated
  #haiku, not created yet
  post '/moods/new' do 
    mood = current_user.moods.find_or_create_by(name: params[:name])
    haiku = mood.haikus.create(name: params[:haikus][:name])
    redirect '/haikus'
  end

# edit the mood
  get '/moods/:id/edit' do
    redirect_if_not_logged_in
    @mood = Mood.find_by_id(params[:id])
    erb :'moods/edit'
  end 

   patch '/moods/:id' do 
    @mood = Mood.find_by_id(params[:id])
    @mood.name = params[:name]
    @mood.save
    redirect '/haikus'
  end

  get '/moods/:id/delete' do
    @mood = Mood.find_by_id(params[:id])
    erb :'moods/delete'
  end

  delete '/moods/:id' do 
    @mood = Mood.find_by_id(params[:id])
    @mood.destroy
    redirect '/haikus'
  end








end
