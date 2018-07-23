class Api::V1::CitiesController < ActionController::Base

  def index
    @cities = CS.cities(params["query"], :us)
    if @cities.present?
      respond_to do |format|
        format.json do
          render :json => @cities.to_json
        end
      end
    else
      
    end
  end

end
