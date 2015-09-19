class Api::V1::CommentsController < Api::V1::ApiController
  def index
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def create
    if comment_params
      comment = current_user.comments.new(comment_params)

      if comment.save
        render json: comment
      else
        render json: { 'error': comment.errors }
      end
    else
      render json: { 'error': 'post not found', 'post_id': params[:post_id] }
    end
  end

  def update
    if @comment.update_attributes(comment_params)
      render json: @comment
    else
      render json: { 'error': @comment.errors }
    end
  end

  def destroy
    if @comment.destroy
      render json: { 'status': 'ok' }
    else
      render json: { 'error': @comment.errors }
    end
  end

  private

  def comment_params
    if Post.where(id: params[:post_id]).exists?
      params.require(:comment).permit(:content).merge(post_id: params[:post_id])
    else
      false
    end
  end
end
