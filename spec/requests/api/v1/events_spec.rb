require 'rails_helper'

RSpec.describe Event, type: :request do
  let(:headers) { {'ACCEPT' => 'application/json'} }

  describe "GET    /api/v1/events/:id" do
    context "when the event exists" do
      let(:event) { create(:event) }
      before { get api_v1_event_path(event.id), headers: headers }

      it { expect(response).to be_ok }
      it { expect(JSON.parse(response.body)).to include('id' => event.id) }
    end

    context "when the event doesn't exists" do
      before { get api_v1_event_path(0), headers: headers }

      it { expect(response).to be_not_found }
    end
  end

  describe "POST    /api/v1/companies/:company_id/events" do
    let(:company) { create(:company) }
    before { post api_v1_company_events_path(company.id), params: params, headers: headers }

    context "when request is valid" do
      let(:venue) { create(:venue) }
      let(:params) { { :event => { :venue_id => venue.id } } }

      it { expect(response).to be_created }
    end

    context "when request is invalid" do
      let(:params) { { :event => { :venue_id => 0 } } }

      it { expect(response).to be_unprocessable }
    end
  end

  describe "PUT    /api/v1/events/:id" do
    let(:event) { create(:event) }
    before { put api_v1_event_path(event.id), params: params, headers: headers }

    context "when event is valid" do
      let(:venue) { create(:venue) }
      let(:params) { { :event => { :venue_id => venue.id } } }

      it { expect(response).to be_ok }
    end
    
    context "when event is invalid" do
      let(:params) { { :event => { :venue_id => 0 } } }

      it { expect(response).to be_unprocessable }
    end
  end

  describe "DELETE    /api/v1/events/:id" do
    context "when event exists" do
      let(:event) { create(:event) }

      before { delete api_v1_event_path(event.id), headers: headers }

      it { expect(response).to be_ok }
    end
    
    context "when event doesn't exist" do
      let(:event) { create(:event) }

      before do
        delete api_v1_event_path(event.id), headers: headers
        delete api_v1_event_path(event.id), headers: headers
      end        

      it { expect(response).to be_not_found }
    end
  end

  describe "DELETE    /api/v1/events/:id" do
    it do
    end
  end
end
