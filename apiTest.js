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

const TICKET = {
  name: 'aiden',
  seat: 1,
  customer_id: 1,
}

const EDITED_TICKET = {
  name: 'aiden edited',
}

const EVENT = {
  venue_id: 1,
  company_id: 1,
  grid_attributes : {
    rows: 2,
    cols: 2,
  },
}

const EDITED_EVENT = {
  venue_id: 2,
}

const requestRaw = async (url, method = 'GET', data = undefined) => {
  console.log(`${method} ${url}`)

  const options = { ...OPTIONS }
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

// paths

const makePath = (...sub) => {
  return URL + '/' + sub.join('/')
}

// parse

const parseResponse = async (response) => {
  const contentType = response.headers.get("content-type")
  if (contentType?.indexOf("application/json") !== -1) {
    return await parseJson(response)
  }
  throw new Error('non-JSON response format')
}

const parseJson = async (response) => {
  return response.json()
}

const basicTest = async () => {

  const eventId = await request({
    method: 'POST',
    subPath: 'companies/1/events',
    data: EVENT,
  })
  
  const ticketId = await request({
    method: 'POST',
    subPath: `events/${eventId}/tickets`,
    data: TICKET,
  })

  await request({
    method: 'PUT',
    subPath: `tickets/${ticketId}`,
    data: EDITED_TICKET,
  })

  await request({
    method: 'GET',
    subPath: `events/${eventId}/tickets`,
  })

  await request({
    method: 'DELETE',
    subPath: `tickets/${ticketId}`,
  })
  
  await request({
    method: 'PUT',
    subPath: `events/${eventId}`,
    data: EDITED_EVENT,
  })

  await request({
    method: 'GET',
    subPath: 'companies/1/events',
  })
  
  await request({
    method: 'DELETE',
    subPath: `events/${eventId}`,
  })

  await request({
    method: 'GET',
    subPath: 'companies/1/events',
  })

}

const request = async ({ method, subPath, data }) => {
  const response = await requestRaw(makePath(subPath), method, data);
  return response.id
}

basicTest()
