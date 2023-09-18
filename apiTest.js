const VERBOSE = process.argv[2] === '-vv'
const DOMAIN = 'http://localhost'
const PORT = '3000'
const BASE = '/api/v1'
const URL = `${DOMAIN}:${PORT}${BASE}`
const token = '8b36056f81e2df855c7a61fd6cc7bee5038380cb5ec39b77b2d389fe77556202'
const OPTIONS = {
  headers:  {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'token': token,
  },
}

const request = async (url, method = 'GET', data = undefined, customOptions
                       = OPTIONS) => {
                         console.log(`${method} ${url}`)

                         const options = { ...customOptions }
                         options.method = method
                         options.body = JSON.stringify(data)
                         
                         const response = await fetch(url, options)

                         console.log(`${response.status}`)

                         const returnObj = await parseResponse(response)

                         if (VERBOSE) {
                           console.log(returnObj || '[empty body]')
                         }

                         return returnObj;
                       }

const makePath = (...sub) => {
  return URL + '/' + sub.join('/')
}

const parseResponse = async (response) => {
  const contentType = response.headers.get("content-type")
  if (contentType?.indexOf("application/json") !== -1) {
    return await parseJson(response)
  }
  throw new Error('non-JSON response format')
}

const parseJson = async (response) => {
  if (response.status !== 204 && response.status !== 404) {
    return response.json()
  }
}

const fullApiTest = async () => {
  const eventId = await createEvent()
  console.log()
  console.log()
  await getTickets()
  console.log()
  console.log()
  const ticketId = await buyTicket(eventId)
  console.log()
  console.log()
  await getTicket(ticketId)
  console.log()
  console.log()
  await getTickets()
  console.log()
  console.log()
  await editTicket(eventId, ticketId)
  console.log()
  console.log()
  await getTickets()
  console.log()
  console.log()
  await getEvent(eventId)
  console.log()
  console.log()
  await deleteTicket(ticketId)
  console.log()
  console.log()
  await deleteTicket(ticketId)
  console.log()
  console.log()
  await getEvents()
  console.log()
  console.log()
  await editEvent(eventId)
  console.log()
  console.log()
  await getEvents()
  console.log()
  console.log()
  await deleteEvent(eventId)
  console.log()
  console.log()
  await deleteEvent(eventId)
  console.log()
  console.log()
  await getEvents()
}

const simpleApiTest = async () => {
  await deleteTicket(0)
}

const createEvent = async () => {
  const createEventPath = makePath('events')
  const createEventResponse = await request(createEventPath, 'POST', {
    company_id : 1,
    venue_id: 1,
    grid_attributes: {
      rows:1,
      cols:1
    }
  });
  return createEventResponse.id
}

const buyTicket = async (id) => {
  const buyTicketPath = makePath('tickets')
  const buyTicketResponse = await request(buyTicketPath, 'POST', {
    customer_id : 1,
    event_id: id,
    name: 'aiden',
    seat: 0,
  });
  return buyTicketResponse.id
}

const editTicket = async (eventId, ticketId = 1, newTicket = {
  customer_id : 1,
  event_id: eventId,
  name: 'aiden edited',
  seat: 0,
}) => {
  const editTicketPath = makePath('tickets', ticketId)
  const editTicketResponse = await request(editTicketPath, 'PUT', newTicket);
  return editTicketResponse.id
}

const editEvent = async (eventId, newEvent = {
  company_id : 1,
  venue_id: 2,
}) => {
  const editEventPath = makePath('events', eventId)
  const editEventResponse = await request(editEventPath, 'PUT', newEvent);
  return editEventResponse.id
}

const getEvent = async (id) => {
  const getEventPath = makePath('events', id)
  const getEventResponse = await request(getEventPath);
}

const getTicket = async (id) => {
  const getTicketPath = makePath('tickets', id)
  const getTicketResponse = await request(getTicketPath);
}

const deleteEvent = async (id) => {
  const deleteEventPath = makePath('events', id)
  const deleteEventResponse = await request(deleteEventPath, 'DELETE');
}

const getEvents = async () => {
  const getEventPath = makePath('events')
  const getEventResponse = await request(getEventPath);
}

const getTickets = async () => {
  const getTicketPath = makePath('tickets')
  const getTicketResponse = await request(getTicketPath);
}

const deleteTicket = async (id) => {
  const deleteTicketPath = makePath('tickets', id)
  const deleteTicketResponse = await request(deleteTicketPath, 'DELETE');
}

// simpleApiTest()
fullApiTest()
