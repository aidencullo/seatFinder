const VERBOSE = process.argv[2] === '-vv'
const DOMAIN = 'http://localhost'
const PORT = '3000'
const BASE = '/api/v1'
const URL = `${DOMAIN}:${PORT}${BASE}`

const request = async (url, method = 'GET', data = undefined) => {
  console.log(`sending ${method} request to ${url}`)

  const options = {
    headers:  {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    method: method,
  }
  
  if (data) {
    options.body = JSON.stringify(data)
  }
  
  const response = await fetch(url, options)
  const returnObj = {
      status: response.status,
  }

  if (response.status !== 204) {
    returnObj.body = await response.json()
  }

  if (VERBOSE) {
    console.log(`response:`)
    console.log(returnObj)
  }
  return returnObj;
}

const makePath = (...sub) => {
  return URL + '/' + sub.join('/')
}

const fullApiTest = async () => {
  // create event
  const createEventPath = makePath('events')
  const createEventResponse = await request(createEventPath, 'POST', {
    company_id : 1,
    venue_id: 1,
    grid_attributes: {
      rows:1,
      cols:1
    }
  });
  const id = createEventResponse.body.event.id
  testResponse(200, createEventResponse.status)
  
  // buy ticket
  const buyTicketPath = makePath('tickets')
  const buyTicketResponse = await request(buyTicketPath, 'POST', {
    customer_id : 1,
    event_id: id,
    name: 'aiden',
    seat: 0,
  });
  testResponse(201, buyTicketResponse.status)

  // get event
  const getEventPath = makePath('events', id)
  const getEventResponse = await request(getEventPath);
  testResponse(200, getEventResponse.status)

  
  // destroy event
  const deleteEventPath = makePath('events', id)
  const deleteEventResponse = await request(deleteEventPath, 'DELETE');
  testResponse(204, deleteEventResponse.status)

  // get events
  const getEventsPath = makePath('events')
  const getEventsResponse = await request(getEventsPath);
  testResponse(200, getEventsResponse.status)
}

const simpleApiTest = async () => {
  // get event
  const getEventPath = makePath('events', 1)
  const obj = await request(getEventPath);
  obj.body.tickets.map((el) => console.log(el)  )
}

const testResponse = (status, responseStatus) => {
  if (status === responseStatus) {
    console.log("SUCCESS")
  } else {
    console.log("FAILURE")
  }
}

fullApiTest()
