module Api
  module V1
    class TagController < ApplicationController
	    def create
	    	# probably better to let rails handle validations
	    	if params[:entity_type] == nil || params[:entity_id] == nil || params[:tags] == nil
		      return render json: {message: 'missing required params'}
		    end
		    Tag.where(:entity_id => params[:entity_id]).destroy_all
		    # we could use a different association in ActiveRecord
		    params[:tags].each do |tag|
			    Tag.create(
			    	:entity_type => params[:entity_type],
			    	:entity_id => params[:entity_id],
			    	:value => tag
			    )
			  end
	      render json: {message: 'success'}
	    end
    end
  end
end