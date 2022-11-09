# == Schema Information
#
# Table name: actors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  yr          :integer          not null
#  score       :float            not null
#  votes       :integer          not null
#  director_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Table name: castings
#
#  id         :bigint           not null, primary key
#  actor_id   :bigint           not null
#  movie_id   :bigint           not null
#  ord        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null

# IMPORTANT:
# For all of the following problems return an ActiveRecord::Relation unless
# otherwise specified.

def star_wars_movies
  # Find the id, title, and year of each of the Star Wars movies.
  Movie
  .select(:id, :title, :yr)
  .where("title like 'Star Wars%'")
end

def stewart_movies
  # Find the id, title, and score of all the movies the actor Patrick Stewart
  # was in.
  Movie.joins(:actors)
  .select(:id, :title, :score)
  .where("actors.name = 'Patrick Stewart'")

end

def actor_ids_from_grease
  # Return an array (NOT an ActiveRecord::Relation) of the ids of all the actors
  # that were in the movie Grease.
  Actor.joins(:movies)
  .select(:id)
  .where("movies.title = 'Grease'")
  .pluck(:id)

end

def al_pacino_not_number_one
  # Find the id and title of all movies in which Al Pacino appeared but not as a
  # lead actor.

  # Reminder: In the castings table the lead actor for a movie will have an
  # ord == 1.
  Movie.joins(:actors)
  .select(:id, :title)
  .where("actors.name = 'Al Pacino'")
  .where("ord != 1")

end

def smallest_cast
  # Find the id and title of the 3 movies with the smallest casts (i.e., fewest
  # number of actors).
  Movie.joins(:actors)
  .select(:id, :title)
  .group(:id,:title)
  .order("COUNT(actors.id) ASC")
  .limit(3)

end
