require_relative 'tests'
require_relative 'preparations'

RSpec.shared_examples "get" do |resource_symbol|
  let(:resource) { create(resource_symbol) }

  it_behaves_like "accept format", 'text/html'
  # it_behaves_like "accept format", 'application/json'
  # it_behaves_like "accept format", 'application/xml'

end
