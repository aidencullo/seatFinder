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
  
  if (response.status === 200) {
    returnObj.body = await response.json()
  }
  console.log(`response:`)
  console.log(returnObj)
  return returnObj;
}

const makePath = (...sub) => {
  return URL + '/' + sub.join('/')
}

const testApi = async () => {
  // create event
  const createEventPath = makePath('events')
  const requestData = await request(createEventPath, 'POST', {
    company_id : 1,
    venue_id: 1,
    grid_attributes: {
      rows:1,
      cols:1
    }
  });

  const id = requestData.body.id
  
  // buy ticket
  const buyTicketPath = makePath('events', '1', 'tickets')
  await request(buyTicketPath, 'POST', {
    customer_id : 1,
    event_id: id,
    name: 'aiden',
    seat: 0,
  });

  // get event

  const getEventPath = makePath('events', id)
  await request(getEventPath);

  
  // destroy event

  const deleteEventPath = makePath('events', id)
  await request(deleteEventPath, 'DELETE');
}

testApi()
