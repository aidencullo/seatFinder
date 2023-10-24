# Seatfinder
## version 1.0.0
Manage your venue from the command line.

# Requests

### Generallly in accordance with REST and [RoR routing conventions](https://guides.rubyonrails.org/routing.html)

## Events

| method | path                                               | controller            |
|--------|----------------------------------------------------|-----------------------|
| GET    | /api/v1/companies/:company_id/events(.:format)     | api/v1/events#index   |
| POST   | /api/v1/companies/:company_id/events(.:format)     | api/v1/events#create  |
| GET    | /api/v1/events/:id(.:format)                       | api/v1/events#show    |
| PATCH  | /api/v1/events/:id(.:format)                       | api/v1/events#update  |
| PUT    | /api/v1/events/:id(.:format)                       | api/v1/events#update  |
| DELETE | /api/v1/events/:id(.:format)                       | api/v1/events#destroy |

## Tickets

| method | path                                       | controller             |
|--------|--------------------------------------------|------------------------|
| GET    | /api/v1/events/:event_id/tickets(.:format) | api/v1/tickets#index   |
| POST   | /api/v1/events/:event_id/tickets(.:format) | api/v1/tickets#create  |
| GET    | /api/v1/tickets/:id(.:format)              | api/v1/tickets#show    |
| PATCH  | /api/v1/tickets/:id(.:format)              | api/v1/tickets#update  |
| PUT    | /api/v1/tickets/:id(.:format)              | api/v1/tickets#update  |
| DELETE | /api/v1/tickets/:id(.:format)              | api/v1/tickets#destroy |

## Spaces

| method | path                                      | controller            |
|--------|-------------------------------------------|-----------------------|
| GET    | /api/v1/events/:event_id/spaces(.:format) | api/v1/spaces#index   |
| POST   | /api/v1/events/:event_id/spaces(.:format) | api/v1/spaces#create  |
| GET    | /api/v1/spaces/:id(.:format)              | api/v1/spaces#show    |
| PATCH  | /api/v1/spaces/:id(.:format)              | api/v1/spaces#update  |
| PUT    | /api/v1/spaces/:id(.:format)              | api/v1/spaces#update  |
| DELETE | /api/v1/spaces/:id(.:format)              | api/v1/spaces#destroy |

<!-- ## Examples -->

<!-- ### get an event -->
<!-- ```plaintext -->
<!-- GET /events/1 -->
<!-- ``` -->

<!-- ```plaintext -->
<!-- curl http://localhost:3000/api/v1/events/1 \ -->
<!--     -H "token: 8b36056f81e2df855c7a61fd6cc7bee5038380cb5ec39b77b2d389fe77556202" \ -->
<!--     -H "accept: application/json" -->
<!-- ``` -->

<!-- ### delete a ticket -->
<!-- ```plaintext -->
<!-- DELETE /ticket/1 -->
<!-- ``` -->

<!-- ```plaintext -->

<!-- curl http://localhost:3000/api/v1/tickets/1 \ -->
<!--     -X DELETE \ -->
<!--     -H "accept: application/json" \ -->
<!--     -H "token: 8b36056f81e2df855c7a61fd6cc7bee5038380cb5ec39b77b2d389fe77556202" \ -->

<!-- ``` -->

<!-- ### create an event -->
<!-- ```plaintext -->
<!-- POST /events -->
<!-- ``` -->

<!-- ```plaintext -->
<!-- curl \ -->
<!--     -X POST \ -->
<!--     -H "Content-Type: application/json" \ -->
<!--     -H "accept: application/json" \ -->
<!--     -H "token: 8b36056f81e2df855c7a61fd6cc7bee5038380cb5ec39b77b2d389fe77556202" \ -->
<!--     -d '{"company_id":"1", "venue_id":"1", "grid_attributes": {"rows":"2", -->
<!-- "cols": "2"}}' \ -->
<!--     http://localhost:3000/api/v1/events -->
<!-- ``` -->

<!-- # Responses -->

<!-- ## Events -->

<!-- ### Retrieve an event -->

<!-- ```plaintext -->
<!-- GET /events/:id -->
<!-- ``` -->

<!-- returns [event](#datatypes) :id -->

<!-- ### Create an event -->

<!-- ```plaintext -->
<!-- POST /events -->
<!-- ``` -->
<!-- returns [event](#datatypes) created -->

<!-- ### Delete an event -->

<!-- ```plaintext -->
<!-- DELETE /events/:id -->
<!-- ``` -->
<!-- returns nothing -->

<!-- # Datatypes -->

<!-- ## Event -->

<!-- ```javascript -->
<!-- { -->
<!--     id, -->
<!--     venue_id, -->
<!--     company_id, -->
<!--     created_at, -->
<!--     updated_at, -->
<!--     tickets, -->
<!-- } -->
<!-- ``` -->

<!-- ## Ticket -->
<!-- ```javascript -->
<!-- { -->
<!--     id, -->
<!--     customer_id, -->
<!--     event_id, -->
<!--     created_at, -->
<!--     updated_at, -->
<!--     seat, -->
<!--     name, -->
<!-- } -->
<!-- ``` -->
