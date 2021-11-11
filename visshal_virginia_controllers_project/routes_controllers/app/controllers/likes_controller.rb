class LikesController < ApplicationController

    def index
        if params[:artwork_id]
            render json: Like.where(likeable_id: params[:artwork_id], likeable_type: 'Artwork')
        elsif params[:comment_id]
            render json: Like.where(likeable_id: params[:comment_id], likeable_type: 'Comment')
        elsif params[:user_id]
            render json: Like.where(user_id: params[:user_id])
        else
            render json: Like.all
        end
    end

    def create
        like = Like.new(like_params)
        if like.save
            render json: like
        else
            render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        like = Like.find(params[:id])
        like.destroy
        render json: like
    end

    private
    def like_params 
        params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
    end
end