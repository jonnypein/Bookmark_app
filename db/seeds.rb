
Follow.destroy_all
Recommendation.destroy_all
Movie.destroy_all
User.destroy_all
require 'open-uri'
require 'nokogiri'

user1 = User.create!(email: "test123@test.com", password: "123456", first_name: "Jonny", last_name: "Pein", bio: 'No pain, no gain')
user2 = User.create!(email: "test1234@test.com", password: "123456", first_name: "Elanor", last_name: "Hebard", bio: 'this is a bio')
user3 = User.create!(email: "test12345@test.com", password: "123456", first_name: "Kelly", last_name: "Jeffery", bio: 'this is an other bio')

def fetch_movie_urls
  top_url = "http://www.imdb.com/chart/top"
  doc = Nokogiri::HTML(open(top_url).read)
  movies = doc.search(".titleColumn a")
  a = movies.take(100).map do |movie|
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
    # storyline: storyline,
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





100.times do
  u = User.create!({
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name ,
    email: Faker::Internet.email,
    # photo: Faker::Provider.Image.imageUrl($width, $height, 'people'),
    password: "123456",
    bio: Faker::TvShows::GameOfThrones.quote,
  })
  5.times {
    Recommendation.create!(user: u, movie: Movie.all.sample)
  }

  5.times{
    Bookmark.create!(user: u, movie: Movie.all.sample)
  }


end


users = User.all

users.each do |user|
  20.times do
    sample = users.sample
    unless sample == user
      user.follow(users.sample)
    end
  end
end









