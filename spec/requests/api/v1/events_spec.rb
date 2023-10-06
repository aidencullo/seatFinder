require 'rails_helper'

RSpec.describe "Event tests", type: :request do

  describe "GET /event" do

    it "existing event" do
      event = create(:event)
      headers = {'ACCEPT' => 'application/json'}
      get event_path(event.id), headers: headers
      expect(response).to have_http_status(200)
      expected_response = {
        "id" => event.id,
      }
      expect(JSON.parse(response.body)).to eq(expected_response)
    end

    it "nonexistent event" do
      headers = {'ACCEPT' => 'application/json'}
      get event_path(1), headers: headers
      expect(response).to have_http_status(404)
    end

  end

end
