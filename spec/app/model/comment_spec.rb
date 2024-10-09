# fronze_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'relationship' do
    it { is_expected.to belong_to(:article) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:text) }
  end
end