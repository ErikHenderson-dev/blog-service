# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'relationship' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:comment) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:category_id) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_presence_of(:author) }

    it { is_expected.to validate_numericality_of(:category_id).only_integer }
  end
end
