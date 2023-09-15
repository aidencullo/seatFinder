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


## Tickets

```plaintext
/tickets
```

| method                   | endpoint      | body     | Description           |
|--------------------------|---------------|----------|-----------------------|
| GET                      | /tickets/:id  | No       | Retrieve ticket :id   |
| POST                     | /tickets/     | Yes      | Create ticket         |


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
