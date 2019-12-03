require 'open-uri'
require 'nokogiri'
require 'faker'

Follow.destroy_all
Recommendation.destroy_all
Movie.destroy_all
puts 'destroying users'
User.destroy_all
user1 = User.create!(email: "test123@test.com", password: "123456", first_name: "Jonny", last_name: "Pein", bio: 'No pain, no gain')
user2 = User.create!(email: "test1234@test.com", password: "123456", first_name: "Elanor", last_name: "Hebard", bio: 'this is a bio')
user3 = User.create!(email: "test12345@test.com", password: "123456", first_name: "Kelly", last_name: "Jeffery", bio: 'this is an other bio')

def fetch_movie_urls
  top_url = "http://www.imdb.com/chart/top"
  doc = Nokogiri::HTML(open(top_url).read)
  movies = doc.search(".titleColumn a")
  a = movies.take(120).map do |movie|
    puts "Getting #{movie.attributes["href"].value}"
    uri = URI.parse(movie.attributes["href"].value)
    uri.scheme = "http"
    uri.host = "www.imdb.com"
    uri.query = nil
    uri.to_s
  end
end

def scrape_movie(url)

  doc = Nokogiri::HTML(open(url, "Accept-Language" => "en").read)
  m = doc.search("h1").text.match /(?<title>.*)[[:space:]]\((?<year>\d{4})\)/
  title = m[:title]
  year = m[:year].to_i
  # storyline = [:storyline]
  picture_url = doc.search(".poster a img").first["src"]
  storyline = doc.search(".summary_text").text.strip
  director = doc.search("h4:contains('Director:') + a").text
  genre = doc.search("h4:contains('Genres:') + a").text.strip
  cast = doc.search(".primary_photo + td a").take(3).map do |element|
    element.text.strip
  end

  result = {
    picture_url: picture_url,
    title: title,
    # cast: cast,
    # director: director,
    storyline: storyline,
    year: year,
    genre: genre
  }
end

movies = fetch_movie_urls
scraped_movies = movies.map { |m| scrape_movie(m) }
scraped_movies.each do |m|
  puts "creating #{m[:title]}"
  Movie.create!(m)
end


urls = [
  'https://images.unsplash.com/photo-1495374519711-e22c8b4596a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  "https://images.unsplash.com/photo-1495211895963-08d8812dcbf0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80",
  'https://images.unsplash.com/photo-1466592261899-a095b126a484?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
  'https://images.unsplash.com/photo-1478070531059-3db579c041d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
  'https://images.unsplash.com/photo-1487087850479-4792f4bdb5de?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2853&q=80',
  'https://images.unsplash.com/photo-1475021200099-fd2cbb889dd1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
  'https://images.unsplash.com/photo-1503235930437-8c6293ba41f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
  'https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
  'https://images.unsplash.com/photo-1470441623172-c47235e287ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2852&q=80',
  'https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
]
puts 'creating users'
count = 0
10.times do |i|
  u = User.create!({
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name ,
    email: Faker::Internet.email,
    default_image: urls[count],
    password: "123456",
    bio: Faker::Quote.matz,
  })
  5.times {
    Recommendation.create!(user: u, movie: Movie.all.sample)
  }

  5.times{
    Bookmark.create!(user: u, movie: Movie.all.sample)
  }
  count += 1
end

users = User.all
puts 'creating followers'
users.each do |user|

  20.times do
    sample = users.sample
    unless sample == user
      user.follow(users.sample)
    end
  end
end

# images = ["https://unsplash.com/photos/O0DoKImZQfU", "photo2.jpeg","photo3.jpeg","photo4.jpeg","photo5.jpeg","photo6.jpeg","photo7.jpeg","photo8.jpeg","photo9.jpeg","photo10.jpeg"]
# 50.times do
#   image = URI.open(images.sample)
# end







