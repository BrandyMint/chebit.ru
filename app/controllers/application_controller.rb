class ApplicationController < ActionController::Base
  protect_from_forgery

public
      #Находим общее количество комментариев(рексрсивно в коллекции)
  def common_count_comments(commentable)
   if commentable.comments.any?
     $count_comments += commentable.comments.count  
     for comment in commentable.comments
       common_count_comments(comment)
     end  
   end
  end

   #Находим уровень вложенности комментариев
  def level_enclosure_comments(comment)
   i=0#Считает вложения
   while comment.commentable.instance_of?(Comment)
     comment = comment.commentable    
     i+=1
   end
   return i
  end

end
