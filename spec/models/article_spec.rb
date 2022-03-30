# fronze_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:id) }
    it { is_expected.to validate_presence_of(:category_id) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:sub_title) }
    it { is_expected.to validate_presence_of(:publication_date) }
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_presence_of(:author) }

    it { is_expected.to validate_numericality_of(:id).only_integer }
    it { is_expected.to validate_numericality_of(:category_id).only_integer }
  end
end
