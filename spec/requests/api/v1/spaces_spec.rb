require 'rails_helper'

RSpec.describe Space, type: :request do
  let(:headers) { {'ACCEPT' => 'application/json'} }
  
  describe "GET    /api/v1/spaces/:id" do
    context "when the space exists" do
      let(:space) { create(:space) }
      let(:parsed_body) { JSON.parse(response.body) }
      before do
        get api_v1_space_path(space.id), headers: headers
      end
      subject { response }

      it { is_expected.to be_ok }
      # it { expect(JSON.parse(response.body)).to eq({ 'id' => space.id }) }
      it "checks status" do
        expect(parsed_body["id"]).to eq(space.id)
      end
    end

    context "when the space doesn't exists" do
      before { get api_v1_space_path(0), headers: headers }

      it { expect(response).to be_not_found }
    end
  end

  describe "POST    /api/v1/events/:event_id/spaces" do
    let(:event) { create(:event) }
    let(:params) { { :space => { :position => 1, :available => false } } }
    before { post api_v1_event_spaces_path(event.id), params: params, headers: headers }

    it { expect(response).to be_method_not_allowed }
  end

  describe "PUT    /api/v1/spaces/:id" do
    let(:space) { create(:space) }
    before { put api_v1_space_path(space.id), params: params, headers: headers }

    context "when space is valid" do
      let(:params) { { :space => { :position => 2, :status => 'unavailable' } } }
      let(:parsed_body) { JSON.parse(response.body) }
      before do
      end

      it { expect(response).to be_ok }
      it "checks status" do
        expect(parsed_body["status"]).to eq('unavailable')
      end
      it "checks position" do
        expect(parsed_body["position"]).to eq(2)
      end
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


  describe "GET    /api/v1/events/:event_id/spaces(.:format)" do
    let(:event) { create(:event) }
    
    it do
        get api_v1_event_spaces_path(event.id), headers: headers
    end
  end  
  
end
