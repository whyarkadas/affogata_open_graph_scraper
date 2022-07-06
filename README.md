# Affogata Open Graph Scraper

## Installation

To run project locally.

```
$ bin/setup
```

## API(s)

1. An API for fetching & extracting Open-Graph entities from a URL 
   * GET /api/v1/open_graph_entities
     * Sample response
     ```
     {
       "status": "SUCCESS",
       "message": "Loaded open graph entities",
       "data": [
       {
         "id": 27,
         "url": "https://www.affogata.com",
         "entity_type": "website",
         "title": "Customer intelligence platform | Affogata",
         "description": "Affogata optimizes the digital customer journey by analyzing customer interactions and identifying customer needs in real-time.",
         "images": [
           "https://static.wixstatic.com/media/8c9e86_357fb4c8c9a04b1c854849a5a0f32c02~mv2.png/v1/fill/w_256,h_256,al_c/8c9e86_357fb4c8c9a04b1c854849a5a0f32c02~mv2.png"
           ],
           "created_at": "2022-07-06T09:30:32.328Z",
           "updated_at": "2022-07-06T09:30:32.328Z"
           }
         ]
       }
     }
     ```

2. An API for retrieving the data previously saved
   * POST /api/v1/open_graph_entities
     * Params : { url: "https://www.affogata.com/" }
     * Sample response
     ```
     {
       "status": "SUCCESS",
       "message": "Open graph entity fetched successfully"
     }
     ```

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
