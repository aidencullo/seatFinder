require 'rails_helper'

RSpec.describe Space, type: :request do
  let(:headers) { {'ACCEPT' => 'application/json'} }

  describe "GET    /api/v1/spaces/:id" do
    context "when the space exists" do
      let(:space) { create(:space) }
      before { get api_v1_space_path(space.id), headers: headers }
      subject { response }

      it { is_expected.to be_ok }
      it { expect(JSON.parse(response.body)).to eq({ 'id' => space.id }) }
    end

    xcontext "when the space doesn't exists" do
      before { get api_v1_space_path(0), headers: headers }

      it { expect(response).to be_not_found }
    end
  end

  # describe "POST    /api/v1/events/:event_id/spaces" do
  #   let(:event) { create(:event) }
  #   before { post api_v1_event_spaces_path(event.id), params: params, headers: headers }

  #   context "when request is valid" do
  #     let(:customer) { create(:customer) }
  #     let(:params) { { :space => { :customer_id => customer.id } } }

  #     it { expect(response).to be_created }
  #   end

  #   context "when request is invalid" do
  #     let(:params) { { :space => { :venue_id => 0 } } }

  #     it { expect(response).to be_unprocessable }
  #   end
  # end

  # describe "PUT    /api/v1/spaces/:id" do
  #   let(:space) { create(:space) }
  #   before { put api_v1_space_path(space.id), params: params, headers: headers }

  #   context "when space is valid" do
  #     let(:customer) { create(:customer) }
  #     let(:params) { { :space => { :customer_id => customer.id } } }

  #     it { expect(response).to be_ok }
  #   end
    
  #   context "when space is invalid" do
  #     let(:params) { { :space => { :customer_id => 0 } } }

  #     it { expect(response).to be_unprocessable }
  #   end
  # end

  # describe "DELETE    /api/v1/spaces/:id" do
  #   context "when space exists" do
  #     let(:space) { create(:space) }

  #     before { delete api_v1_space_path(space.id), headers: headers }

  #     it { expect(response).to be_ok }
  #   end
    
  #   context "when space doesn't exist" do
  #     let(:space) { create(:space) }

  #     before do
  #       delete api_v1_space_path(space.id), headers: headers
  #       delete api_v1_space_path(space.id), headers: headers
  #     end        

  #     it { expect(response).to be_not_found }
  #   end
  # end

  # describe "GET    /api/v1/events/:id" do
  #   let(:customer) { create(:customer) }
  #   let(:event) { create(:event) }
  #   let(:params) { { :space => { :customer_id => customer.id } } }
  #   before do
  #     post api_v1_event_spaces_path(event.id), params: params,
  #          headers: headers
  #     @space_id = JSON.parse(response.body)["id"]
  #   end

  #   context "after space created" do
  #     before do
  #       get api_v1_event_path(event.id), headers: headers
  #     end

  #     it { expect(JSON.parse(response.body)["spaces"]).to include({"id" => @space_id}) }
  #   end

  #   context "after space deleted" do
  #     before do
  #       delete api_v1_space_path(@space_id), headers: headers
  #       get api_v1_event_path(event.id), headers: headers
  #     end

  #     it { expect(JSON.parse(response.body)["spaces"]).not_to include({"id" => @space_id}) }
  #   end
  # end
end
