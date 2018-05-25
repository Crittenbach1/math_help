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
       erb :'users/signup'
     end

     post '/users/new' do
       @user = User.create(email: params[:email], password: params[:password])
       session[:user_id] = @user.id
       redirect '/users/profile'
     end

     get '/users/profile' do
       if Helper.is_logged_in?(session) == false
         redirect '/login'
       else
         @user = Helper.current_user(session)
       end
       erb :'users/profile'
     end

end
