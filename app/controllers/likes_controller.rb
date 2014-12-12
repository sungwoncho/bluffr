class LikesController < ApplicationController

  # POST /likes

  def create
    @like = current_user.likes.new(bluff_id: params[:id])
    @bluff = Bluff.find(params[:id])

    respond_to do |format|
      if @like.save & @bluff.update_cached_likes
        format.html { redirect_to :back, notice: "You liked the bluff!" }
      else
        format.html { redirect_to :back, notice: "An error occurred." }
      end
    end
  end

  # DELETE /likes/1
  def destroy
    @like = current_user.likes.find_by(bluff_id: params[:id]).destroy
    
    @bluff = Bluff.find(params[:id])
    @bluff.update_cached_likes

    respond_to do |format|
      format.html { redirect_to :back, notice: "You unliked the bluff!" }
    end
  end
end
