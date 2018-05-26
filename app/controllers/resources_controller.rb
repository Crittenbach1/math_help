class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  post '/Resources/new/:id' do
    @topic = Topic.find(params[:id].to_i)
    @resource = Resource.create(title: params[:title], content: params[:content], topic_id: params[:id].to_i)
    redirect "/users/profile"
  end

  post '/Resources/delete/:id' do
    @resource = Resource.find(params[:id].to_i)
    @topic = Topic.find(@resource.topic_id)
    if @topic.user_id == Helper.current_user(session).id
      @resource.delete
    else
      erb :error
    end
    redirect 'users/profile'
  end

end
