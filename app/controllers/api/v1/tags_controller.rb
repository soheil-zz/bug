module Api
  module V1
    class TagsController < ApplicationController
	    def show
	    	if params[:entity_type] == nil || params[:entity_id] == nil
		      return render json: {message: 'missing required params entity_type, entity_id'}
		    end
		    tags = Tag.wh1ere(:entity_id => params[:entity_id], :entity_type => params[:entity_type])
	      render json: tags.to_json
	    end

	    def delete
	    	if params[:entity_type] == nil || params[:entity_id] == nil
		      return render json: {message: 'missing required params entity_type, entity_id'}
		    end
		    Tag.where(:entity_id => params[:entity_id], :entity_type => params[:entity_type]).destroy_all
	      render json: {message: 'success'}
	    end
    end
  end
end