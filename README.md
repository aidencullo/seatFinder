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
| POST                     | /events/     | Yes      | Create event          |
| DELETE                   | /events/:id  | No       | Delete event          |

## Tickets

```plaintext
/tickets
```

| method                   | endpoint      | body     | Description           |
|--------------------------|---------------|----------|-----------------------|
| GET                      | /tickets/:id  | No       | Retrieve ticket :id   |
| POST                     | /tickets/     | Yes      | Create ticket         |
| DELETE                   | /tickets/:id  | No       | Delete ticket         |


# Responses

## Events

### Create an event

```plaintext
GET /events/:id
```

returns event object :id

```javascript
{ 
  event,
  tickets,
}
```

### Retrieve an event

```plaintext
POST /events
```
returns new object

```javascript
{ 
  event,
  tickets,
}
```
### Delete an event

```plaintext
DELETE /events/:id
```
returns nothing

```javascript

```

## Ticket

### Retrieve a ticket

```plaintext
GET /tickets/:id
```

returns ticket object :id

```javascript
{ 
  ticket,
}
```

### Create a ticket

```plaintext
POST /tickets
```
returns new ticket object

```javascript
{ 
  ticket,
}
```

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
