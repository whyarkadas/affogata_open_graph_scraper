# Affogata Open Graph Scraper

## Installation

To run project locally.

```
$ bin/setup
```

## API(s)

1. An API for fetching & extracting Open-Graph entities from a URL 

2. An API for retrieving the data previously saved

## Test

Rspec unit test written for Get and Post end points of open graph entities to run them

```
$ export RAILS_ENV=test
$ rspec
```

## Should be done if have enough time

- [ ] Implement more powerful Api with using Grape gem or GraphQL
- [ ] Use serializer to to response back more flexible data formats.
- [ ] Authenticate api call with token based authentication like using devise gem.
- [ ] Use JSON schema validator.
- [ ] API documentation using Swagger or Postman Doc.
- [ ] Expand code test coverage
