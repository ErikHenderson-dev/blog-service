# fronze_string_literal: true

require 'rails_helper'

RSpec.describe CategoryManager::Creator do
  let(:instance) { described_class }
  let(:result) { instance.call(params) }

  context 'when create successfuly' do
    let(:params) {{ name: 'Anime' }}

    it { expect(result).to be_present }
    it { expect(result).to be_a(Category) }
    it { expect(result.name).to eq(params[:name]) }
  end

  context 'when create failure' do
    let(:params) {{ name: category_name }}
    
    context 'when category_name is nil' do
      let(:category_name) { nil }

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Name can't be blank") }
    end

    context 'with standard error' do
      let(:category_name) { nil }
      before do
        allow_any_instance_of(described_class).to receive(:create_category).and_raise(StandardError, 'Unexpected error')
      end

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Unexpected error") }
    end
  end
end