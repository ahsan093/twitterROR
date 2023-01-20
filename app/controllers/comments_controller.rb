class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tweet, only: [:new, :create]
    def new
        @tweet = Tweet.find(params[:tweet_id])
        @comment = @tweet.comments.new
    end
    private
    def comment_params
    params.require(:comment).permit(:body)
    end

    def set_tweet
        @tweet = Tweet.find(params[:tweet_id])
    end
    def create
        @tweet = Tweet.find(params[:tweet_id])
        @comment = @tweet.comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
          redirect_to tweet_path(@tweet, comments: @tweet.comments)
        else
          render :new
        end
    end
      
end