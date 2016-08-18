class HaikusController  < ApplicationController 
  

  get "/haikus" do
    redirect_if_not_logged_in 
    @user = current_user
    @haikus = @user.haikus
    @moods = @user.moods
    erb :'haikus/show'
  end

# New Haiku 
  get "/haikus/new/:id" do
    redirect_if_not_logged_in 
    @mood = Mood.find_by_id(params[:id])
    erb :'/haikus/new'
  end

  post '/haikus/new/:id' do
    @mood = Mood.find_by_id(params[:id])
    Haiku.create(name: params[:name], mood_id: params[:id])
    redirect '/haikus'
  end

#Edit Haikus

get '/haikus/:id/edit' do
    @haiku = Haiku.find_by_id(params[:id])
    erb :'/haikus/edit'
  end

  patch '/haikus/:id' do
    @haiku = Haiku.find_by_id(params[:id])
    @haiku.name = params[:name]
    @haiku.save
    redirect '/haikus'
  end

# Delete haiku 
  get '/haikus/:id/delete' do 
    @haiku = Haiku.find_by_id(params[:id])
    erb :'/haikus/delete'
  end

  delete '/haikus/:id' do 
    @haiku = Haiku.find_by_id(params[:id])
    @haiku.destroy
    redirect '/haikus'
  end

end
