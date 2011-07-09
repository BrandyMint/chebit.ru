class CommentsController < ApplicationController

  #Создание комментария
  def create
    @commentable = find_commentable
    params[:comment].merge! :author => current_user
    @comment = @commentable.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Комментарий успешно создан."
      redirect_to find_comment_main_parent @commentable
    else
      redirect_to find_comment_main_parent @commentable 
    end
  end

=begin 
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end
=end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    if ! can? :destroy, @comment
      flash[:notice] = "Комментарий не может быть удален."
      redirect_to find_comment_main_parent @comment      
      return
    end
    @comment.destroy
    redirect_to find_comment_main_parent(@comment.commentable), :notice => "Комментарий успешно удален."
  end

=begin Пока не реализовано обновление комментариев 
def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to @comment, :notice  => "Successfully updated comment."
    else
      render :action => 'edit'
    end
  end
=end

  private
  
  #Найти основной объект, к которому относятся комментарии(дискуссии и тд.) 
  def find_comment_main_parent(comment)
    loop do
      #Если объект не комментарий
      return comment if ! comment.instance_of?(Comment) 
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

  



end
