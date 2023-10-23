RSpec.shared_examples "test" do |key, value|
    it { expect(response_json).to include(key => value) }
end
