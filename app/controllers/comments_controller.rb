# -*- coding: utf-8 -*-
class CommentsController < ApplicationController

  # belongs_to :discourse,:comment, :polymorphic => true

  #Проверка аудентификации через devise
  before_filter :authenticate_user!, :only=>[:create, :destroy]

  #Создание комментария
  def create
    commentable.comments.create!(:author=>current_user, :content=>params[:comment][:content])
    redirect_to request.referer
  end

  def destroy
    current_user.comments.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def commentable
    if params[:conference_id]
      Conference.find(params[:conference_id])
    elsif params[:discourse_id]
      Discourse.find(params[:discourse_id])
    else
      raise 'не указан commentable'
    end
  end

# =begin Пока не реализовано обновление комментариев
# def update
#     @comment = Comment.find(params[:id])
#     if @comment.update_attributes(params[:comment])
#       redirect_to @comment, :notice  => "Successfully updated comment."
#     else
#       render :action => 'edit'
#     end
#   end
# =end

#   private

#   #Найти основной объект, к которому относятся комментарии(дискуссии и тд.)
#   def find_comment_main_parent(comment)
#     loop do
#       #Если объект не комментарий
#       return comment if ! comment.instance_of?(Comment)
#       comment = comment.commentable
#     end
#   end

#   #Найти объект комментирования(дискуссии, комментарии и т.д.)
#   def find_commentable
#     params.each do |name,value|
#       if name =~ /(.+)_id$/
#         return $1.classify.constantize.find(value)
#       end
#     end
#     nil
#   end

end
