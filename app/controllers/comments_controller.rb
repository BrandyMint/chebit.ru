class CommentsController < ApplicationController

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.author_id=current_user 
    if @comment.save
      flash[:notice] = "Комментарий успешно создан."
      redirect_to find_comment_main_parent @commentable
    else
      redirect_to find_comment_main_parent @commentable 
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

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.commentable, :notice => "Комментарий успешно удален."
  end

  private
  
  #Найти основной объект, к которому относятся комментарии(дискуссии и тд.) 
  def find_comment_main_parent(comment)
    loop do
      #Если объект не комментарий
      return comment if !comment.instance_of?(Comment) 
      comment = comment.commentable
    end
  end

  #Найти объект комментирования(дискуссии, комментарии и т.д.)
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

end
