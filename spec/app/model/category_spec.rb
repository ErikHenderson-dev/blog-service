# fronze_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'relationship' do
    it { is_expected.to have_many(:article) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end