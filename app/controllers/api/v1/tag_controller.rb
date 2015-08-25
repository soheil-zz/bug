module Api
  module V1
    class TagController < ApplicationController
	    def create
	    	# probably better to let rails handle validations
	    	if params[:etype] == nil || params[:eid] == nil || params[:tags] == nil
		      return render json: {message: 'missing required params'}
		    end
		    Tag.where(:eid => params[:eid]).destroy_all
		    # we could use a different association in ActiveRecord
		    params[:tags].each do |tag|
			    Tag.create(
			    	:etype => params[:type],
			    	:eid => params[:eid],
			    	:value => tag
			    )
			  end
	      # render json: {message: params[:type]}
	    end
    end
  end
end