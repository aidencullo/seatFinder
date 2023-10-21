require 'rails_helper'

RSpec.describe Event, type: :request do
  let(:headers) { {'ACCEPT' => 'application/json'} }
  let(:venue) { create(:venue) }
  let(:company) { create(:company) }
  let(:params) { {
                   :event => {
                     :venue_id => venue.id,
                     :company_id => company.id,
                     :grid_attributes => {
                       :rows => 2,
                       :cols => 2,
                     },
                   }
                 } }
  let(:edit_params) { {
                   :event => {
                     :grid_attributes => {
                       :rows => 3,
                       :cols => 2,
                     },
                   }
                 } }
  let(:space_params) { {
                   :space => {
                     :status => 'unavailable'
                   }
                 } }

  describe "alter grid" do

    before do
      post api_v1_company_events_path(company.id), params: params, headers: headers
    end

    it { expect(JSON.parse(response.body)).to include('rows' => 2) }
    it { expect(JSON.parse(response.body)).to include('cols' => 2) }
    it { expect(response).to be_created }
    it do
      event = JSON.parse(response.body)
      
      put api_v1_event_path(event['id']), params: edit_params,
          headers: headers
      
      expect(JSON.parse(response.body)).to include('rows' => 3)
    end
  end

  describe "toggle space availability" do
    
    before do
      post api_v1_company_events_path(company.id), params: params, headers: headers
      @event = JSON.parse(response.body)
      @status = @event['spaces'][0]['status']
    end

    it do
      expect(@status).to eq('available')
    end

    it do
      put api_v1_space_path(@event['spaces'][0]['id']), params: space_params, headers: headers
      @space = JSON.parse(response.body)
      @status = @space['status']

      expect(@status).to eq('unavailable')
    end
  end

end
