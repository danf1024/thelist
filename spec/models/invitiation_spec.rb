require 'rails_helper'

RSpec.describe Invitation do
  describe 'set_rsvp_code as a before_validation hook' do
    subject do
      described_class.new(
        addressee: 'Mr. & Mrs. John Smith',
        address_line_1: '555 Apple Lane',
        city: 'New York',
        state: 'New York',
        zip: '10010'
      )
    end

    it 'sets an rsvp code on save' do
      subject.save!
      expect(subject.rsvp_code.present?).to eq true
    end
  end
end
