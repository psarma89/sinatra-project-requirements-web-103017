class LocationController < ApplicationController

  get '/locations' do
    @locations = Location.all
    erb :"/location/index"
  end

  get '/locations/:slug' do
    @location = Location.find_by_slug(params[:slug])
    erb :"/location/show"
  end
end
