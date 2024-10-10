# frozen_string_literal: true

# fronze_string_literal: true

require 'rails_helper'

RSpec.describe Base do
  let(:params) { { id: nil } }
  let(:instance) { described_class.new(params) }

  it 'raises a NotImplementedError' do
    expect { instance.execute }.to raise_error(NotImplementedError)
  end
end
