module Api
  module V1
    class TagController < ApplicationController
	    def create
	    	if params[:type] == nil || params[:eid] == nil || params[:tags] == nil
		      return render json: {message: 'missing required params'}
		    end
	      render json: {message: params[:type]}
	    end
    end
  end
end