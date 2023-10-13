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

    context "when the space doesn't exists" do
      before { get api_v1_space_path(0), headers: headers }

      it { expect(response).to be_not_found }
    end
  end

  describe "POST    /api/v1/events/:event_id/spaces" do
    let(:event) { create(:event) }
    before { post api_v1_event_spaces_path(event.id), params: params, headers: headers }

    context "when request is valid" do
      let(:params) { { :space => { :position => 1 } } }

      it { expect(response).to be_created }
    end

    context "when request is invalid" do
      let(:params) { { :space => { :other => 0 } } }

      it { expect(response).to be_unprocessable }
    end
  end

  describe "PUT    /api/v1/spaces/:id" do
    let(:space) { create(:space) }
    before { put api_v1_space_path(space.id), params: params, headers: headers }

    context "when space is valid" do
      let(:params) { { :space => { :position => 1 } } }

      it { expect(response).to be_ok }
    end
    
    context "when space is invalid" do
      let(:params) { { :space => { :position => -1 } } }

      it { expect(response).to be_unprocessable }
    end
  end

  describe "DELETE    /api/v1/spaces/:id" do
    context "when space exists" do
      let(:space) { create(:space) }
      before { delete api_v1_space_path(space.id), headers: headers }

      it { expect(response).to be_method_not_allowed }
    end
  end
end
