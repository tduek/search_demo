# Search with the Quickness

This search strategy is similar to pg_search's implementation,
but it also leverages PostgreSQL's full text search functions
and indeces. This results in 200+ times faster searches compared
to pg_search's basic use described in the pg_search branch.

