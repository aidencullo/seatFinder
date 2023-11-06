RSpec.shared_examples "test" do |key, value|
  it { expect(response_json).to include(key => value) }
end

RSpec.shared_examples "ok test" do
  it { expect(response).to be_ok }
end

RSpec.shared_examples "not found test" do
  it { expect(response).to be_not_found }
end

RSpec.shared_examples "check resource test" do
  it { expect(JSON.parse(response.body)).to include('id' => resource.id) }
end

RSpec.shared_examples "response format" do |format|
  it do
    expect(response.content_type).to eq("#{format}; charset=utf-8")
  end
end

RSpec.shared_examples "print body" do
  it do
    p response.body
  end
end

RSpec.shared_examples "accept format" do |format|
  describe "accept #{format}" do
    let(:headers) { {'ACCEPT' => format} }

    context "when the event exists" do
      include_examples "prepare valid request"

      it_behaves_like "ok test"
      it_behaves_like "print body"
      it_behaves_like "response format", format
    end

    context "when the resource doesn't exists" do
      include_examples "prepare invalid request"

      it_behaves_like "not found test"
    end
  end
end
