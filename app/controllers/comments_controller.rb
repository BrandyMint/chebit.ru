class CommentsController < ApplicationController

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.author_id=current_user 
    if @comment.save
      flash[:notice] = "Комментарий успешно создан."
      redirect_to @commentable
    else
      redirect_to @commentable 
    end
  end

  
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end


  def edit
    @comment = Comment.find(params[:id])
  end

  private

  def find_commentable
    params.each do |name,value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to @comment, :notice  => "Successfully updated comment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url, :notice => "Successfully destroyed comment."
  end
end
