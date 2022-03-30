# fronze_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:id) }
    it { is_expected.to validate_presence_of(:category) }

    it { is_expected.to validate_numericality_of(:id).only_integer }
  end
end
