require 'rails_helper'

RSpec.describe TextAdminJob do
  subject { described_class }
  let(:location) { Location.new }

  describe "#perform" do
    it "sends a text message" do
      messenger = double(send: true)
      allow(TextMessenger).to receive(:new) { messenger }

      subject.perform_now(location)

      expect(TextMessenger).to have_received(:new)
      expect(messenger).to have_received(:send)
    end
  end
end