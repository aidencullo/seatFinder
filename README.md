# Seatfinder
## version 1.0.0
Manage your venue from the command line.

# Requests

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
| PUT                      | /tickets/:id  | Yes      | Edit ticket           |
| DELETE                   | /tickets/:id  | No       | Delete ticket         |

## Examples

### get an event
```plaintext
GET /events/1
```

```plaintext
curl http://localhost:3000/api/v1/events/1 \
    -H "token: 8b36056f81e2df855c7a61fd6cc7bee5038380cb5ec39b77b2d389fe77556202" \
    -H "accept: application/json"
```

### delete a ticket
```plaintext
DELETE /ticket/1
```

```plaintext

curl http://localhost:3000/api/v1/tickets/1 \
    -X DELETE \
    -H "accept: application/json" \
    -H "token: 8b36056f81e2df855c7a61fd6cc7bee5038380cb5ec39b77b2d389fe77556202" \

```

### create an event
```plaintext
POST /events
```

```plaintext
curl \
    -X POST \
    -H "Content-Type: application/json" \
    -H "accept: application/json" \
    -H "token: 8b36056f81e2df855c7a61fd6cc7bee5038380cb5ec39b77b2d389fe77556202" \
    -d '{"company_id":"1", "venue_id":"1", "grid_attributes": {"rows":"2",
"cols": "2"}}' \
    http://localhost:3000/api/v1/events
```

# Responses

## Events

### Retrieve an event

```plaintext
GET /events/:id
```

returns [event](#datatypes) :id

### Create an event

```plaintext
POST /events
```
returns [event](#datatypes) created

### Delete an event

```plaintext
DELETE /events/:id
```
returns nothing

# Datatypes

## Event

```javascript
{
    id,
    venue_id,
    company_id,
    created_at,
    updated_at,
    tickets,
}
```

## Ticket
```javascript
{
    id,
    customer_id,
    event_id,
    created_at,
    updated_at,
    seat,
    name,
}
```
