require 'open-uri'
require 'nokogiri'
require 'faker'

Follow.destroy_all
Recommendation.destroy_all
Movie.destroy_all
# puts 'destroying users'
User.destroy_all
user1 = User.new(email: "jonny@gmail.com", password: "123456", first_name: "Jonny", last_name: "Pein", bio: 'No pain, no gain')
image1 = URI.open('https://res.cloudinary.com/dtjblav7i/image/upload/v1575563106/27459904_10155879377556061_256707768702226381_n_ufowq2.jpg')
user1.photo.attach(io: image1, filename: 'some-image.jpg', content_type: 'image/jpg')
user1.save!

user2 = User.create!(email: "elly@gmail.com", password: "123456", first_name: "Elonore", last_name: "Hebard", bio: 'Parisan, living in London.')
image2 = URI.open('https://res.cloudinary.com/dtjblav7i/image/upload/v1575564123/1265303_10152411080822203_953762005_o_onzhxl.jpg')
user2.photo.attach(io: image2, filename: 'elonore.jpg', content_type: 'image/jpg')
user2.save!

user3 = User.create!(email: "kelly@gmail.com", password: "123456", first_name: "Kelly", last_name: "Jeffery", bio: 'Devon girl, killing it with code')
image3 = URI.open('https://res.cloudinary.com/dtjblav7i/image/upload/v1575564291/kelly_c6mbcg.png')
user3.photo.attach(io: image3, filename: 'kelly.jpg', content_type: 'image/png')
user3.save!

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
10.times do |i|
  u = User.create!({
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name ,
    email: Faker::Internet.email,
    password: "123456",
    bio: Faker::Quote.matz,
  })
  file = URI.open(urls[i])
  u.photo.attach(io: file, filename: "#{u.first_name}.jpg", content_type: 'image/jpg')
  # Here we write article.photo.attach(...) because we wrote has_one_attached :photo in app/models article.rb
  u.save

  5.times {
    Recommendation.create!(user: u, movie: Movie.all.sample)
  }

  5.times{
    Bookmark.create!(user: u, movie: Movie.all.sample)
  }
end
# users = User.all
# puts 'creating followers'
# users.each do |user|

#   20.times do
#     sample = users.sample
#     unless sample == user
#       user.follow(users.sample)
#     end
#   end
# end

# images = ["https://unsplash.com/photos/O0DoKImZQfU", "photo2.jpeg","photo3.jpeg","photo4.jpeg","photo5.jpeg","photo6.jpeg","photo7.jpeg","photo8.jpeg","photo9.jpeg","photo10.jpeg"]
# 50.times do
#   image = URI.open(images.sample)
# end
