class UserController < ApplicationController

  get '/users/new' do
    @trucks = FoodTruck.all
    erb :"/user/new"
  end

  get '/users' do
    @users = User.all
    erb :"/user/index"
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @trucks = FoodTruck.all
    erb :"/user/show"
  end

  get '/users/:slug/edit' do
    @user = User.find_by_slug(params[:slug])
    @trucks = FoodTruck.all
    erb :"/user/edit"
  end

  post '/users' do
    # binding.pry
    user = User.find_or_create_by(name: params[:user][:name])
    user.food_trucks.delete_all
    if params[:user][:trucks].any?
      params[:user][:trucks].each do |truck_id|
        truck = FoodTruck.find(truck_id.to_i)
        user.food_trucks << truck
      end
    end

    user.save

    redirect to "/users/#{user.slug}"
  end

  patch '/users/:slug' do
    user = User.find_by_slug(params[:slug])
    user.food_trucks.delete_all
    if params[:user][:trucks].any?
      params[:user][:trucks].each do |truck_id|
        truck = FoodTruck.find(truck_id.to_i)
        user.food_trucks << truck
      end
    end

    user.save

    redirect to "/users/#{user.slug}"

  end

  delete '/users/:user_id/:truck_id' do
    # binding.pry
    user = User.find(params[:user_id].to_i)
    user.food_trucks.delete(params[:truck_id].to_i)
    user.save
    redirect to "/users/#{user.slug}"
  end

  post '/users/:user_id/:truck_id' do
    user = User.find(params[:user_id].to_i)
    truck = FoodTruck.find(params[:truck_id].to_i)
    user.food_trucks << truck
    user.save
    redirect to "/users/#{user.slug}"
  end
end
