require 'rails_helper'

RSpec.describe Ticket, type: :request do
  let(:headers) { {'ACCEPT' => 'application/json'} }

  describe "GET    /api/v1/tickets/:id" do
    context "when the ticket exists" do
      let(:ticket) { create(:ticket) }
      before { get api_v1_ticket_path(ticket.id), headers: headers }

      it { expect(response).to be_ok }
      it { expect(JSON.parse(response.body)).to eq({ 'id' => ticket.id }) }
    end

    context "when the ticket doesn't exists" do
      before { get api_v1_ticket_path(0), headers: headers }

      it { expect(response).to be_not_found }
    end
  end

  describe "POST    /api/v1/events/:event_id/tickets" do
    let(:event) { create(:event) }
    before { post api_v1_event_tickets_path(event.id), params: params, headers: headers }

    context "when request is valid" do
      let(:customer) { create(:customer) }
      let(:params) { { :ticket => { :customer_id => customer.id } } }

      it { expect(response).to be_created }
    end

    context "when request is invalid" do
      let(:params) { { :ticket => { :venue_id => 0 } } }

      it { expect(response).to be_unprocessable }
    end
  end

  describe "PUT    /api/v1/tickets/:id" do
    let(:ticket) { create(:ticket) }
    before { put api_v1_ticket_path(ticket.id), params: params, headers: headers }

    context "when ticket is valid" do
      let(:customer) { create(:customer) }
      let(:params) { { :ticket => { :customer_id => customer.id } } }

      it { expect(response).to be_ok }
    end
    
    context "when ticket is invalid" do
      let(:params) { { :ticket => { :customer_id => 0 } } }
      # let(:params) { { :ticket => { :customer_id => 0 } } }

      it { expect(response).to be_unprocessable }
    end
  end

  describe "DELETE    /api/v1/tickets/:id" do
    context "when ticket exists" do
      let(:ticket) { create(:ticket) }

      before { delete api_v1_ticket_path(ticket.id), headers: headers }

      it { expect(response).to be_ok }
    end
    
    context "when ticket doesn't exist" do
      let(:ticket) { create(:ticket) }

      before do
        delete api_v1_ticket_path(ticket.id), headers: headers
        delete api_v1_ticket_path(ticket.id), headers: headers
      end        

      it { expect(response).to be_not_found }
    end
  end

  describe "GET    /api/v1/events/:id" do
    let(:customer) { create(:customer) }
    let(:event) { create(:event) }
    let(:params) { { :ticket => { :customer_id => customer.id } } }
    before do
      post api_v1_event_tickets_path(event.id), params: params,
           headers: headers
      @ticket_id = JSON.parse(response.body)["id"]
    end

    context "after ticket created" do
      before do
        get api_v1_event_path(event.id), headers: headers
      end

      it { expect(JSON.parse(response.body)["tickets"]).to include({"id" => @ticket_id}) }
    end

    context "after ticket deleted" do
      before do
        delete api_v1_ticket_path(@ticket_id), headers: headers
        get api_v1_event_path(event.id), headers: headers
      end

      it { expect(JSON.parse(response.body)["tickets"]).not_to include({"id" => @ticket_id}) }
    end
  end

  describe "GET    /api/v1/events/:event_id/tickets(.:format)" do
    let(:event) { create(:event) }
    
    it do
        get api_v1_event_tickets_path(event.id), headers: headers
    end
  end  
end
