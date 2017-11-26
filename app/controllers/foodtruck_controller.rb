class FoodTruckController < ApplicationController

  get '/trucks' do
    @trucks = FoodTruck.all
    erb :"/truck/index"
  end

  get '/trucks/new' do
    @locations = Location.all
    erb :"/truck/new"
  end

  get '/trucks/:slug' do
    @truck = FoodTruck.find_by_slug(params[:slug])
    erb :"/truck/show"
  end

  get '/trucks/:slug/edit' do
    @truck = FoodTruck.find_by_slug(params[:slug])
    @locations = Location.all
    erb :"/truck/edit"
  end

#TO ENHANCE: Try to handle Truck names with ' in it, like Jonathan's for the slug
  post '/trucks' do
    # binding.pry
    truck = FoodTruck.create(name: params[:truck][:name], category: params[:truck][:category])
    if params[:truck][:locations] == nil
      truck_location = Location.find_or_create_by(params[:truck][:location])
      truck.location = truck_location
    else
      truck_location = Location.find(params[:truck][:locations].first.to_i)
      truck.location = truck_location
    end
    truck.save

    redirect to "/trucks/#{truck.slug}"
  end

  delete '/trucks/:slug/delete' do
    truck = FoodTruck.find_by_slug(params[:slug])
    truck.delete
    redirect to '/trucks'
  end

#TO ENHANCE: Try to handle Truck names with ' in it, like Jonathan's for the slug
  patch '/trucks/:slug/edit' do
    truck = FoodTruck.find_by_slug(params[:slug])
    truck.name = params[:truck][:name]
    truck.category = params[:truck][:category]

    if params[:truck][:locations] == nil
      truck_location = Location.find_or_create_by(params[:truck][:location])
      truck.location = truck_location
    else
      truck_location = Location.find(params[:truck][:locations].first.to_i)
      truck.location = truck_location
    end
    truck.save

    redirect to "/trucks/#{truck.slug}"
  end
end
