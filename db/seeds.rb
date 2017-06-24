# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
User.create!(
    :email => "doomhammer@dhammer.com",
    :password => "hammer123"
    )
    
User.create!(
    :email => "dwaite498@gmail.com",
    :password => "hammer123"
    )

user = User.all
12.times do
    Topic.create!(
        :title => Faker::Commerce.unique.department,
        :user => user.sample
        )    
end
topic = Topic.all
102.times do
   Bookmark.create!(
       :url => Faker::Internet.url,
       :topic_id => topic.sample.id
       ) 
end