# Search with the Quickness

This search strategy is similar to pg_search's implementation,
but it leverages PostgreSQL's full text search functions and
indeces more effectively. The biggest performance gain comes
from storing the search document as a `ts_vector` instead of
type `text`. The strategy results in 200+ times faster searches
compared to pg_search's basic use described in the pg_search
branch of this repo.

#### Take a look at:

- db/migrate/20131213203739_create_searches.rb
- db/migrate/20131213221545_add_gin_index_to_search_term_tsv.rb

## TODO:

- Use SQL triggers instead of ActiveRecord::Base callbacks to build search documents.
- Abstract and package into gem

