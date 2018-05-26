class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

     get '/users/new' do
       if Helper.is_logged_in?(session) == true
        redirect '/users/profile'
       else
        erb :'users/signup'
       end
     end

     post '/users/new' do
       @user = User.create(email: params[:email], password: params[:password])

       if @user.save && params[:email] != "" && params[:password] != ""
         session[:user_id] = @user.id
         redirect '/users/profile'
       else
         redirect '/users/new'
       end
     end

     get '/users/profile' do
       if Helper.is_logged_in?(session) == false
         redirect '/login'
       else
         @user = Helper.current_user(session)
         @topics = []
         Topic.all.each do |topic|
           if topic.user_id == @user.id
             @topics << topic
           end
        end
       erb :'users/profile'
     end
  end
end
