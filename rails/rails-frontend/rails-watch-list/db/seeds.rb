require 'open-uri'
require 'json'

puts "Cleaning our db..."

# delete join table first
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts "Grabbing new movies..."

url = URI.open("http://tmdb.lewagon.com/movie/top_rated").read

# parse it
# movies = JSON.parse(url)['results']


movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['backdrop_path']}",
    rating: movie['vote_average']
  )
end

puts "Created #{Movie.count} movie(s)"


# Want random movies?

# url = "http://tmdb.lewagon.com/movie/top_rated"
# 10.times do |i|
#   puts "Importing movies from page #{i + 1}"
#   movies = JSON.parse(open("#{url}?page=#{i + 1}").read)['results']
#   movies.each do |movie|
#     puts "Creating #{movie['title']}"
#     base_poster_url = "https://image.tmdb.org/t/p/original"
#     Movie.create(
#       title: movie['title'],
#       overview: movie['overview'],
#       poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
#       rating: movie['vote_average']
#     )
#   end
# end
# puts "Movies created"
