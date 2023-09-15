## Seatfinder
### version 1.0.0
Manage your venue from the command line.

### Requests

## Events

```plaintext
/events
```

| method                   | endpoint     | body     | Description           |
|--------------------------|--------------|----------|-----------------------|
| GET                      | /events/:id  | No       | Retrieve event :id    |
| GET                      | /events/     | No       | Retrieve all events   |
| POST                     | /events/     | Yes      | Create event          |
| PUT                      | /events/:id  | Yes      | Edit event            |
| DELETE                   | /events/:id  | No       | Delete event          |

## Tickets

```plaintext
/tickets
```

| method                   | endpoint      | body     | Description           |
|--------------------------|---------------|----------|-----------------------|
| GET                      | /tickets/:id  | No       | Retrieve ticket :id   |
| GET                      | /tickets/     | No       | Retrieve all tickets  |
| POST                     | /tickets/     | Yes      | Create ticket         |
| PUT                      | /tickets/:id  | Yes      | Edit ticket            |
| DELETE                   | /tickets/:id  | No       | Delete ticket         |


# Responses

## Events

### Create an event

```plaintext
GET /events/:id
```

returns [event](datatypes) :id

### Retrieve an event

```plaintext
POST /events
```
returns [event](datatypes)

### Delete an event

```plaintext
DELETE /events/:id
```
returns nothing

# Datatypes

## Event

```javascript
{
  id: 1,
  venue_id: 1,
  company_id: 1,
  created_at: '2023-09-15T18:31:18.596Z',
  updated_at: '2023-09-15T18:31:18.596Z',
  tickets,
}
```

## Ticket
```javascript
{
      id: 1,
      customer_id: 1,
      event_id: 1,
      created_at: '2023-09-15T18:31:18.693Z',
      updated_at: '2023-09-15T18:31:18.693Z',
      seat: 1,
      name: 'aiden',
}
```
