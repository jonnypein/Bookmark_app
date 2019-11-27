  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
Movie.destroy_all
Recommendation.destroy_all
User.destroy_all
require 'open-uri'
require 'nokogiri'

user1 = User.create!(email: "test123@test.com", password: "123456", first_name: "Jonny", last_name: "Pein", bio: 'No pain, no gain')
user2 = User.create!(email: "test1234@test.com", password: "123456", first_name: "Elanor", last_name: "Hebard", bio: 'this is a bio')
user3 = User.create!(email: "test12345@test.com", password: "123456", first_name: "Kelly", last_name: "Jeffery", bio: 'this is an other bio')

# movie = "comedy
# url = "https://www.netflix.com/browse=#{comedy}"


# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)



# html_doc.search('title').each do |element|

#   puts element.text.strip
#   puts element.attribute('href').value
# end

movie1 = Movie.create!(title: 'Pulp Fiction', description:"The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.
", picture_url:"https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg", genre:"Crime", year:"1994", imdb_url:"https://www.imdb.com/title/tt0110912/", netflix_url: false, amazon_url: "https://www.amazon.co.uk/Pulp-Fiction-John-Travolta/dp/B00FGK9F7I")
movie2 = Movie.create!(title: 'Fight Club', description:"An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.
", picture_url:"https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SY1000_CR0,0,666,1000_AL_.jpg", genre:"Drama", year:"1999", imdb_url:"https://www.imdb.com/title/tt0137523/?ref_=nv_sr_srsg_1", netflix_url: false, amazon_url: "https://www.amazon.co.uk/Fight-Club-Meat-Loaf/dp/B00H36664S")
movie3 = Movie.create!(title: 'Interstellar', description:"A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.
", picture_url:"https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SY1000_SX675_AL_.jpg", genre:"Drama", year:"2014", imdb_url:"https://www.imdb.com/title/tt0816692/?ref_=nv_sr_srsg_1", netflix_url: false, amazon_url: "https://www.amazon.co.uk/Interstellar-Matthew-Mcconaughey/dp/B00U85QGGO")
movie4 = Movie.create!(title: 'Gladiator', description:"A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.
", picture_url:"https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,675,1000_AL_.jpg", genre:"Drama", year:"2000", imdb_url:"https://www.imdb.com/title/tt0172495/?ref_=nv_sr_srsg_0", netflix_url: false, amazon_url: "https://www.amazon.co.uk/Gladiator-Oliver-Reed/dp/B00IK9CKXS")
movie5 = Movie.create!(title: 'Memento', description:"A man with short-term memory loss attempts to track down his wife's murderer.
", picture_url:"https://m.media-amazon.com/images/M/MV5BZTcyNjk1MjgtOWI3Mi00YzQwLWI5MTktMzY4ZmI2NDAyNzYzXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,681,1000_AL_.jpg", genre:"Thriller", year:"2000", imdb_url:"https://www.imdb.com/title/tt0209144/?ref_=nv_sr_srsg_9", netflix_url: false, amazon_url: "https://www.amazon.co.uk/gp/video/detail/B00QQHBCVC")
movie6 = Movie.create!(title: 'Joker', description:"In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.
", picture_url:"https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg", genre:"Crime", year:"2019", imdb_url:"https://www.imdb.com/title/tt7286456/?ref_=nv_sr_srsg_0", netflix_url: false, amazon_url: false)

recommendation1 = Recommendation.create!(user_id: user1.id, movie_id: movie1.id)
recommendation2 = Recommendation.create!(user_id: user1.id, movie_id: movie2.id)
recommendation3 = Recommendation.create!(user_id: user1.id, movie_id: movie4.id)
recommendation4 = Recommendation.create!(user_id: user2.id, movie_id: movie4.id)
recommendation5 = Recommendation.create!(user_id: user2.id, movie_id: movie5.id)
recommendation6 = Recommendation.create!(user_id: user2.id, movie_id: movie6.id)
recommendation7 = Recommendation.create!(user_id: user3.id, movie_id: movie1.id)
recommendation8 = Recommendation.create!(user_id: user3.id, movie_id: movie2.id)
recommendation9 = Recommendation.create!(user_id: user3.id, movie_id: movie6.id)


