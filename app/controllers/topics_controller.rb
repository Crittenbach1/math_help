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

end
