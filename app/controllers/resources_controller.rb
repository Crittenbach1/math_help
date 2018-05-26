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

end
