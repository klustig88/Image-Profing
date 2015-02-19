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

erb :spins

end



get '/upload'  do

   erb :upload

end


post '/upload/dimension' do

        @array = 0
        @spin = Spin.all
        @spin.each do |spins| 




end

 
  erb :upload


end


post '/upload/images' do

  


  Dir.foreach('./public/img') do |item|
  next if item == '.' or item == '..' or item == 'Thumbs.db'  or item == '.DS_Store'

  @spin = Spin.new(name: item  )
  @spin.save 

  end



  @all = Spin.all
  @all.each do |item| 
      @array = 0
  Dir.foreach('./public/img/' + item.name) do |number|
          next if number == '.' or number == '..' or number == 'Thumbs.db' or number == '.DS_Store'


          @array += 1

    end

    puts @array

     if @array == 72 
           
          @column = "12" 
          @row = "3"
          
      end
      

    item.column = @column
    item.row = @row 

    item.save
  
  end
  
   


  
      


      # if 
      #      @array.size == 72 
      #     @column = "24" && @row = "3" 
      #  elsif 
      #     @array.size == 48 
      #      @column = "24" && @row = "2" 
      #  else
      #     @array.size == 24 
      #      @column = "24" && @row = "1" 
      #  end 
   




  

 
  erb :upload


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
    flash[:error] = "Username or Password are incorrect, please try again."
  end
end




