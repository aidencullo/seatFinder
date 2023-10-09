require 'rails_helper'

RSpec.describe "Event tests", type: :request do

  describe "GET /event" do

    context "event exists" do
      it "event found" do
        # arrange
        event = create(:event)
        headers = {'ACCEPT' => 'application/json'}
        expected_response = {
          "id" => event.id,
        }
        
        # act
        get api_v1_event_path(event.id), headers: headers

        # assert
        expect(response).to be_successful
        expect(JSON.parse(response.body)).to eq(expected_response)
      end
    end

    context "event doesn't exists" do
      it "event not found" do
        # arrange
        headers = {'ACCEPT' => 'application/json'}
        
        # act
        get api_v1_event_path(1), headers: headers
        
        # assert
        expect(response).to be_not_found
      end
    end


    # const eventId = await request({
    #   method: 'POST',
    #   subPath: 'companies/1/events',
    #   data: EVENT,
    # })
    
    # const ticketId = await request({
    #   method: 'POST',
    #   subPath: `events/${eventId}/tickets`,
    #   data: TICKET,
    # })

    # await request({
    #   method: 'PUT',
    #   subPath: `tickets/${ticketId}`,
    #   data: EDITED_TICKET,
    # })

    # await request({
    #   method: 'GET',
    #   subPath: `events/${eventId}/tickets`,
    # })

    # await request({
    #   method: 'DELETE',
    #   subPath: `tickets/${ticketId}`,
    # })
    
    # await request({
    #   method: 'PUT',
    #   subPath: `events/${eventId}`,
    #   data: EDITED_EVENT,
    # })

    # await request({
    #   method: 'GET',
    #   subPath: 'companies/1/events',
    # })
    
    # await request({
    #   method: 'DELETE',
    #   subPath: `events/${eventId}`,
    # })

    # await request({
    #   method: 'GET',
    #   subPath: 'companies/1/events',
    # })

    
  end

end
