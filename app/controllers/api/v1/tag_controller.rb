module Api
  module V1
    class TagController < ApplicationController
	    def create
	    	if params[:type] == nil || params[:eid] == nil || params[:tags] == nil
		      return render json: {message: 'missing required params'}
		    end
		    Tag.where(:eid => params[:eid]).destroy_all
	      render json: {message: params[:type]}
	    end
    end
  end
end