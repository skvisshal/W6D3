class CollectionAssignmentsController < ApplicationController
     def create
        collection_assignment = CollectionAssignment.new(collection_assignment_params)
        if collection_assignment.save
            render json: collection_assignment
        else
            render json: collection_assignment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        collection_assignment = CollectionAssignment.find(params[:id])
        collection_assignment.destroy
        render json: collection_assignment
    end

    private
    def collection_assignment_params
        params.permit(:collection_id, :artwork_id)
    end
end