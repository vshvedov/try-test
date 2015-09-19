class Api::V1::PostsController < Api::V1::ApiController
  def index
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def create
    post = current_user.posts.new(post_params)

    if post.save
      render json: post
    else
      render json: { 'error': post.errors }
    end
  end

  def update
    if @post.update_attributes(post_params)
      render json: @post
    else
      render json: { 'error': @post.errors }
    end
  end

  def destroy
    if @post.destroy
      render json: { 'status': 'ok' }
    else
      render json: { 'error': @post.errors }
    end
  end

  def comments
    post = Post.find(params[:post_id])
    respond_with(post.comments)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
