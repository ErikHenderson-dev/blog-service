# fronze_string_literal: true

require 'rails_helper'

RSpec.describe CategoryManager::Updater do
  let!(:category) { create(:category, id: 1) }
  let(:options) {{ id: category.id }}

  let(:instance) { described_class }
  let(:result) { instance.call(params) }

  context 'when update successfuly' do
    let(:params) { 
      options.merge(
        name: 'name test'
      )
    }

    it { expect(result).to be_present }
    it { expect(result).to be_a(Category) }
    it { expect(result.name).not_to eq(category.name) }
  end

  context 'when update failure' do
    context 'when name is nil' do
      let(:params) { 
        options.merge({
          name: nil
        }) 
      }

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Name can't be blank") }
    end

    context 'when category not exist' do
      let(:params) {{ id: 50 }}

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Couldn't find Category") }
    end

    context 'when category is null' do
      let(:params) {{ id: nil }}
  
      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Couldn't find Category without an ID") }
    end

    context 'with standard error' do
      let(:params) { options }

      before do
        allow_any_instance_of(described_class).to receive(:update_category).and_raise(StandardError, 'Unexpected error')
      end

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Unexpected error") }
    end
  end
end