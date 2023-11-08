# require 'rails_helper'
# require_relative 'shared'

# $count = 0
# RSpec.describe Event, type: :request do

  
#   let(:headers) { {'ACCEPT' => 'application/json'} }
#   let(:venue) { create(:venue) }
#   let(:company) { create(:company) }
#   let(:params) { {
#                    :event => {
#                      :venue_id => venue.id,
#                      :company_id => company.id,
#                      :grid_attributes => {
#                        :rows => 2,
#                        :cols => 2,
#                      },
#                    }
#                  } }
#   let(:edit_params) { {
#                         :event => {
#                           :grid_attributes => {
#                             :rows => 3,
#                             :cols => 2,
#                           },
#                         }
#                       } }
#   let(:space_params) { {
#                          :space => {
#                            :status => 'unavailable'
#                          }
#                        } }
#   let(:response_json) { JSON.parse(response.body) }

#   describe "create grid" do

#     before do
#       post api_v1_company_events_path(company.id), params: params, headers: headers
#     end

#     it { expect(response).to be_created }
#     it { expect(response_json).to include('rows' => 2) }
#     it { expect(response_json).to include('cols' => 2) }
#     it { expect(response_json['spaces'].size).to eq(4) }
#   end

#   describe "alter grid" do

#     before do
#       event = create(:event)
#       put api_v1_event_path(event), params: edit_params,
#           headers: headers
#     end
    
#     it_behaves_like "test", 'rows', 3
#     it_behaves_like "test", 'cols', 2
#   end

#   describe "toggle space availability" do
    
#     before do
#       post api_v1_company_events_path(company.id), params: params, headers: headers
#       @event = JSON.parse(response.body)
#       @status = @event['spaces'][0]['status']
#     end
    
#     it do @event['spaces'].each do |space|
#             expect(space['status']).to eq('available')
#           end
#     end
#     it do
#       put api_v1_space_path(@event['spaces'][0]['id']), params: space_params, headers: headers
#       @space = JSON.parse(response.body)
#       @status = @space['status']

#       expect(@status).to eq('unavailable')
#     end
#   end

# end
