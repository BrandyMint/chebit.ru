# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :discourse do |f|
  f.subject "MyString"
  f.text "MyText"
  f.author_id 1
  f.assigner_id 1
end
