class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  post '/Topics/new' do
    @topic = Topic.create(title: params[:title], user_id: Helper.current_user(session).id)
    redirect "/users/profile"
  end

  get '/topics/:id' do
    @topic = Topic.find(params[:id])

    erb :'topics/show_topic'
  end

  get '/topics/edit/:id' do
   @topic = Topic.find(params[:id].to_i)
   if @topic.user_id != Helper.current_user(session).id
     erb :error
   else
     erb :"topics/edit_topic"
   end
  end





end
