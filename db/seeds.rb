# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
    [
        'Test',
        'McTester',
        'Test@test.com',
        'test',
        'Pacific Time (US & Canada)'
    ],
    [
        'Joshua',
        'Drumm',
        'josh@mail.com',
        'josh',
        'Eastern Time (US & Canada)'
    ]
]

user_list.each do |first_name, last_name, email, password_digest, time_zone|
    User.create(first_name: first_name, last_name: last_name, email: email, password_digest: password_digest, time_zone: time_zone)
end

post_list = [
    [
        'Upcoming PS4 games',
        'Which PS4 games are you all looking forward to playing?',
        1
    ],
    [
        'Fortnite frame rates',
        'Is anyone else experiencing crazy drops in frame rate? Did a new update come out or something?',
        2
    ],
    [
        'Favorite game of 2019',
        'What has been your favorite game of this year so far?',
        1
    ]
]

post_list.each do |title, content, user_id|
    Post.creat(title: title, content: content, user_id: user_id)
end

comment_list = [
    [
        'I really think the new call of duty is going to be awesome',
        1,
        2
    ],
    [
        'I can\'t wait to get my hands on Borderlands 3',
        1,
        1
    ],
    [
        'Yeah, it\'s been bouncing around for me too. I think the 1.05 patch just got released.',
        2,
        1
    ]
]


