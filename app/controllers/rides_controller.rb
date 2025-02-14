class RidesController < ApplicationController

    
    def create
      
        ride = Ride.new(ride_params)
       
        if ride
          message = ride.take_ride
          flash[:notice] = message
           redirect_to user_path current_user
        end
    end

  private 
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
 end

end



