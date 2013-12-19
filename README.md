# pg_search

This is a simple demo of how to use the pg_search gem. It's not the most
efficient, but it's VERY simple and easy to use.

There are two kinds of searches pg_search gives us:
* **Search scopes**: search a specific model. Useful for 'advanced search'
   features where a user can specify what each field should contain.
* **Multi-search**: search against many columns in many models.

## Getting Started

`gem 'pg_search'` and `bundle install`

That's all.

## Search Scopes

These searches can only search a specific model.

In your model:
````ruby
class Post < ActiveRecord::Base
  attr_accessible :title, :body

  pg_search_scope :search_by_title, against: :title
end
````

This gives us: `Post.search_by_title("Dog")`


More interestingly, you can search against multiple columns of the same model:
````ruby
class Post < ActiveRecord::Base
  attr_accessible :title, :body

  pg_search_scope :search_by_both, against: [:title, :body]
end
````

## Multi-search

Multi-search is more interesting. It's good for when you want to implement a
search against multiple models.

#### Set up
It takes a little more setup to do multisearch. It's still easy, though.

* `rails generate pg_search:migration:multisearch`
    * This is going to create a new migration.
    * Run it: `bundle exec rake db:migrate`


Then you can do this:

````ruby
class User < ActiveRecord::Base
  attr_accessible :name

  include PgSearch
  multisearchable against: :name
end


class Post < ActiveRecord::Base
  attr_accessible :title, :body

  include PgSearch
  multisearchable against: [:title, :body]
end


PgSearch.multisearch("tommy")  # => ActiveRecord::Relation object
````
Tada!

#### Wait, what just happened?
The way pg_search implements this is by creating a new
table that holds polymorphic relationships to everything
you want to search against.
Review polymorphic associations [here](http://guides.rubyonrails.org/v3.2.14/association_basics.html#polymorphic-associations).

So, every time you create a new `multisearchable` record,
it will also get inserted into the polymorphic table. It
also updates existing ones when you change them. Then, it
just searches the polymorphic table and grabs the associated
model for each result. Easy!

## Make it better

This is the most basic way to use pg_search. It has more
advanced features as well. Their README does a pretty
good job of explaining more in-depth, go to [pg_search's github](https://github.com/Casecommons/pg_search)

Also, this basic search implementation is too slow for any
decent-size app/database. Check out the 'table_strategy'
branch for a more custom solution that uses postgres' full
text search functions and indeces.
