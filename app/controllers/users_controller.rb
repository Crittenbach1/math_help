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


end
