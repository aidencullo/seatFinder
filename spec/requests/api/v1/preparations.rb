RSpec.shared_examples "prepare valid request" do
  before do
    path = api_v1_event_path(resource.id)
    get path, headers: headers
  end
end

RSpec.shared_examples "prepare invalid request" do
  before do
    path = api_v1_event_path(0)
    get path, headers: headers
  end
end
