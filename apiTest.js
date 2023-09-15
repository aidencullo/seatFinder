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

// raw http request
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

//helpers
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
  const ticketId = await buyTicket(eventId)
  await getEvent(eventId)
  await deleteTicket(ticketId)
  await deleteTicket(ticketId)
  await getEvents()
  await deleteEvent(eventId)
  await deleteEvent(eventId)
  await getEvents()
}

const simpleApiTest = async () => {
  await getEvent(1)
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

const getEvent = async (id) => {
  const getEventPath = makePath('events', id)
  const getEventResponse = await request(getEventPath);
}

const deleteEvent = async (id) => {
  const deleteEventPath = makePath('events', id)
  const deleteEventResponse = await request(deleteEventPath, 'DELETE');
}

const getEvents = async () => {
  const getEventPath = makePath('events')
  const getEventResponse = await request(getEventPath);
}

const deleteTicket = async (id) => {
  const deleteTicketPath = makePath('tickets', id)
  const deleteTicketResponse = await request(deleteTicketPath, 'DELETE');
}

const customReqest = async (method) => {
  if (!['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'HEAD', 'OPTIONS',
        'CONNECT', 'TRACE'].includes(method)) {
    throw new Error('method not recognized')
  }
  try {
    const path = makePath()
    const response = await request(path, method);
    return 0
  } catch(e) {
    console.error(e)
    return -1
  }
}

// Test suites
const getSuccessApiTest = async () => {
  console.log('success requests')
  const id = await createEvent()
  await getEvent(id)
  await getEvent(id)
  await getEvent(id)
  await getEvent(id)
  await getEvent(id)
}

const getFailureApiTest = async () => {
  console.log('failure tests')
  await getEvent(-1)
  await getEvent(100)
  await getEvent('hi')
}

const getApiTest = async () => {
  await getSuccessApiTest()
  await getFailureApiTest()
}

const postSuccessApiTest = async () => {
  console.log('success requests')
  await createEvent()
  await createEvent()
  await createEvent()
  await createEvent()
}

const postApiTest = async () => {
  await postSuccessApiTest()
}

const deleteSuccessApiTest = async () => {
  console.log('success requests')
  const id = await createEvent()
  const id2 = await createEvent()
  await deleteEvent(id)
  await deleteEvent(id2)
}

const deleteFailureApiTest = async () => {
  console.log('failure tests')
  await deleteEvent(1)
  await deleteEvent(1)
  await deleteEvent(1)
  await deleteEvent(2)
  await deleteEvent(0)
  await deleteEvent(1)
  await deleteEvent(1)
}

const deleteApiTest = async () => {
  await deleteSuccessApiTest()
  await deleteFailureApiTest()
}

// call tests
// simpleApiTest()
fullApiTest()
