  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all
User.destroy_all
require 'open-uri'
require 'nokogiri'

user1 = User.create(email: "test123@test.com", password: "123456")
user2 = User.create(email: "test1234@test.com", password: "123456")
user3 = User.create(email: "test12345@test.com", password: "123456")


movie1 = Movie.create(title: 'Pulp Fiction', picture_url: 'https://www.imdb.com/title/tt0110912/mediaviewer/rm1959546112', description: 'Starring John Travolta, Samuel L. Jackson, Bruce Willis, Tim Roth, Ving Rhames, and Uma Thurman, it tells several stories of criminal Los Angeles. The title refers to the pulp magazines and hardboiled crime novels popular during the mid-20th century, known for their graphic violence and punchy dialogue.', genre: 'crime', year: "1994")
movie2 = Movie.create(title: 'Fight Club', picture_url: 'https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SY1000_CR0,0,666,1000_AL_.jpg', description: 'Discontented with his capitalistic lifestyle, a white-collared insomniac forms an underground fight club with Tyler, a careless soap salesman. The project soon spirals down into something sinister', genre: 'thriller', year: "1999")
movie3 = Movie.create(title: 'Interstellar', picture_url: 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SY1000_SX675_AL_.jpg', description: "In Earth's future, a global crop blight and second Dust Bowl are slowly rendering the planet uninhabitable.", genre: "drama", year: '2014')
movie4 = Movie.create(title: 'Gladiator', picture_url: 'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,675,1000_AL_.jpg', description: "Commodus takes over power and demotes Maximus, one of the preferred generals of his father, Emperor Marcus Aurelius. As a result, Maximus is relegated to fighting till death as a gladiator.", genre: "drama/action", year: "2014")
movie5 = Movie.create(title: 'Momento', picture_url: 'https://m.media-amazon.com/images/M/MV5BZTcyNjk1MjgtOWI3Mi00YzQwLWI5MTktMzY4ZmI2NDAyNzYzXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,681,1000_AL_.jpg', description: 'Leonard Shelby, an insurance investigator, suffers from anterograde amnesia and uses notes and tattoos to hunt for the man he thinks killed his wife, which is the last thing he remembers.', genre: 'crime', year:'2000')
movie6 = Movie.create(title: 'Joker', picture_url: 'https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg',  description: "Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City.", genre: 'drama', year: "2019")

# movie = "comedys"
# url = "https://www.netflix.com/browse=#{comedy}"


# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)



# html_doc.search('title').each do |element|

#   puts element.text.strip
#   puts element.attribute('href').value
# end

