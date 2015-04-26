# enable :sessions
get '/'do
  erb :index
end
#####.............
# post '/login' do
#   @user = User.find_by(email: params[:email])
#   if @user && @user.authenticate(params[:password])
#     session[:user_id] = @user.id
#     redirect "/users/#{@user.id}"
#   else
#     @user = User.new
#     @user.errors.add(:login, "Username or Password did not match.")
#     erb :login
#   end
# end

# get '/logout' do
#   session.delete(:user_id)
#   redirect '/login'
# end
#####............

post '/user/new' do
  @user = User.new(name: params[:name], email:params[:email],password:params[:password], mobile:params[:mobile], zipcode:params[:zipcode])
  session[:id]= @user.id
  @user.save
  redirect "/user/#{@user.id}"
end

get '/user/:id' do
  @user=User.where(id: params[:id]).first
  @notices=Notification.where(user_id: params[:id])
erb :profile
end

post '/notifications/:id' do
  @user=User.where(id: params[:id]).first
  @notices=Notification.where(user_id: params[:id])
  @note = Notification.new
  @note.user_id = params[:id]
  @note.magnitude = params[:magnitude]
  @note.radius = params[:radius]
  @note.zipcode = params[:zipcode]
  @note.save
  erb :profile
end

get '/notifications/:id' do
  @notice=Notification.where(id:params[:id]).first
  @location=Location.new(@notice.zipcode)
  erb :go_earthquakes
end


get '/rest/v1/earthquakes' do
  @earthquakes = Earthquake.new(params[:lat], params[:lon], params[:mag], params[:radius])
  # p @earthquakes
  @earthquakes.data.to_json
  # erb :go_earthquakes
end



#UPDATE & DELETE


#longitude and latitude
# http://dev.virtualearth.net/REST/v1/Locations?query=94002&maxResults=1&key=AoDr5MEui79foP3WYelO5Aq6tEoJcDKGz-1AYUw7LVvRpraeVbKl39Ws-Hlfyqw

#api earthquake
# https://earthquake.usgs.gov/fdnws/event/1/query?format=geojson&tlatitude=37.513820648193359&longitude=-122.29677581787109&maxradiuskm=100
