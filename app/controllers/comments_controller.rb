class CommentsController < InheritedResources::Base
  
  belongs_to :discourse,:comment, :polymorphic => true

  #Проверка аудентификации через devise
  before_filter :authenticate_user!, :only=>[:create, :destroy]

  #Создание комментария
  def create
    params[:comment].merge! :author => current_user
    create!{find_comment_main_parent(@comment)}
  end

=begin 
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

=end
  def destroy
    destroy!
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
