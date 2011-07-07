// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// Яваскрипт для подсветки точек перед комментариями
sender_comment = '';
function showdiv(sender){
  sender.getElementsByClassName('folding-dot-holder')[0].style.display = "inline";
  sender_comment = sender;
}
//Скрывает div
function hidediv(sender){
if(sender != ''){
  sender.getElementsByClassName('folding-dot-holder')[0].style.display = "none";
 }
}
