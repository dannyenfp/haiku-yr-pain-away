class MoodsController < ApplicationController 

  #creates a new mood 
  get "/moods/new" do
    redirect_if_not_logged_in
    erb :'/moods/new'
  end


  #once submitted this will redirect to a haiku page to create an associated
  #haiku, not created yet
  post '/moods/new' do 
    @user = current_user
    mood = @user.moods.create(name: params[:name])
    haiku = mood.haikus.create(name: params[:haikus][:name])
    redirect '/haikus'
  end

# edit the mood
  get '/moods/:id/edit' do
    redirect_if_not_logged_in
    @mood = Mood.find_by_id(params[:id])
    erb :'moods/edit'
  end 

  






end