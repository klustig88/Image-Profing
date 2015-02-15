# User Routing

get '/' do
  erb :welcome

    
  # user = User.new(name: 'david', password_digest: '', password_confirmation: 'nomatch')
  # user.save    
end

post '/login' do
  @user = User.find_by_name(params[:user][:name])
  if @user.try(:authenticate, params[:user][:password])
    erb :user
  else
    flash[:error] = "Username or Password are incorrect, please try again."
  end
end

get '/spins' do
# @a = ["135464",
# "140882",
# "test000003"]





erb :spins



 # @images = Dir["/Macintosh HD/Users/DeltaTauChi/Desktop/proofing_code/public"]

end



get '/upload'  do

   erb :upload

end


post '/upload' do

   # @project = Upload.new(params[:create_project])
   # @project.save
 
  erb :success


end




  



# Admin Routing

get '/admin' do

	erb :admin_login

end

post '/admin/login' do
  @admin = Admin.find_by_name(params[:admin][:name])
  if @admin.try(:authenticate, params[:admin][:password])
    erb :admin
  else
    flash[:error] = "Username or Password are incorrect, please try again.
"
  end
end




