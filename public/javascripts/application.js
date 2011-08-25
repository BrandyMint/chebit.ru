// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// // Яваскрипт для подсветки точек перед комментариями
// sender_comment = '';
// function showdiv(sender,classname){
//   sender.getElementsByClassName(classname)[0].style.display = "inline";
//   sender_comment = sender;
// }

// //Скрывает div
// function hidediv(sender,classname){
//   if(sender != ''){
//     sender.getElementsByClassName(classname)[0].style.display = "none";
//   }
// }

$(function() {
    
    $('.j-rating-link').live('ajax:success', function(evt, data, status, xhr){
              $(this).parent().replaceWith(data);
            });

    $('.rating-icon').hover(
        function () {
          $(this).attr('src','/images/good_s.gif');
        }, 
        function () {
          $(this).attr('src','/images/good.gif');
        }
      );
      // .live("ajax:beforeSend", function(evt, xhr, settings){
      //         $(this).replaceWith('<img src="/images/spinner.gif" width=16 height=16>');
      //       });
    $('.j-comment-answer').
      click(function(event){
              t = $(this);
              commentable = t.data('commentable');
              form = $("#new_comment_form_" + commentable)
              form.toggle();
              if (form.is(':visible')) {
                t.text(t.data('visible-text') || 'скрыть');
              } else {
                t.text(t.data('hidden-text') || 'ответить');
              }
              return false;
        });
  });

// $(document).ready(function(){
//                     //JS для реализации комментариев в проекте
//                     $('.j-comment-answer').click(function(event){
//                                                    showdiv(this.parentNode,'add-comment')
//                                                    event.preventDefault();
//                                                  });
//                   });
