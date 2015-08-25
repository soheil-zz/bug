module Api
  module V1
    class StatsController < ApplicationController
	    def index
	      tags = Tag.select('value, COUNT(*) as cnt').group('value')
	      render json: tags.map { |tag| normalize(tag) }.to_json
	    end

	    def show
	    	if params[:entity_type] == nil || params[:entity_id] == nil
		      return render json: {message: 'missing required params entity_type, entity_id'}
		    end
		    tags = Tag.where(:entity_id => params[:entity_id], :entity_type => params[:entity_type]) \
							    .select('value, COUNT(*) as cnt').group('value')
	      render json: tags.map { |tag| normalize(tag) }.to_json
	    end

	    def normalize(tag)
				{
      		tag: tag[:value],
	      	count: tag[:cnt]
	      }
	    end
    end
  end
end

