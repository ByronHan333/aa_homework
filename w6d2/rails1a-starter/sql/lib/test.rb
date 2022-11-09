# == Schema Information
#
# Table name: cats
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  breed       :string
#
# Table name: toys
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  price       :integer
#
# Table name: cat_toys
#
#  id          :integer      not null, primary key
#  cat_id      :integer      not null, foriegn key
#  toy_id      :integer      not null, foreign key

require_relative '../data/pg_helper.rb'

def freyja
  # Find the names of all the cats that are the same color as the cat named
  # `Freyja`. Do not include `Freyja` in the results. Sort by cat name
  # alphabetically.

  execute(<<-SQL)
  select name
  from cats
  where color in (select color from cats where name = 'Freyja')
  and name != 'Freyja'
  order by 1

  SQL
end

def find_unknown
  # Find all the toys names that belong to the cat who's breed is `Unknown`.
  # Only return the toys that have more than one word in the name.
  # Order from the most expensive to least.

  execute(<<-SQL)
  select t.name
  from cats c join cat_toys ct on c.id = ct.cat_id
  join toys t on ct.toy_id = t.id
  where t.name like '% %'
  and c.breed = 'Unknown'
  order by t.price desc

  SQL
end

def five_cheap_toys
  # Find the name and prices for the five cheapest toys.
  # Order by toy price from most expensive to least.

  execute(<<-SQL)
  select name, price
  from (select name, price from toys order by price asc limit 5) a
  order by price desc

  SQL
end

def rich_crypto_cats
  # `Bitcoin Cash` became a really popular toy sold at different prices.
  # Find the lowest price of the toy `Bitcoin Cash`.
  # List the names of the cats who acquired the toy at its lowest price.
  # Order by the cat name alphabetically.

  execute(<<-SQL)
  select distinct c.name
  from cats c join cat_toys ct on c.id = ct.cat_id
  join toys t on ct.toy_id = t.id
  where t.name = 'Bitcoin Cash'
  and t.price in (select price from toys where name = 'Bitcoin Cash' order by price asc limit 1)
  order by 1
  SQL
end

# t.id in (select id from toys where name = 'Bitcoin Cash' order by price asc limit 1)


def toy_that_jet_owns
  # Find the most expensive toy that is owned by the cat named `Jet`.
  # Find the cats that own toys of the same name.
  # List the name of the cat and the name of the toy.
  # Exclude Jet from the results.
  # Order by cat name alphabetically.

  execute(<<-SQL)
  select c.name, t.name
  from cats c join cat_toys ct on c.id = ct.cat_id
  join toys t on ct.toy_id = t.id
  where t.name in
  (select t.name
  from cats c join cat_toys ct on c.id = ct.cat_id
  join toys t on ct.toy_id = t.id
  where c.name = 'Jet'
  order by t.price desc
  limit 1)
  and c.name != 'Jet'
  order by 1

  SQL
end
