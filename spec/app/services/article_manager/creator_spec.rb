# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticleManager::Creator do
  let(:instance) { described_class }
  let(:result) { instance.call(params) }

  context 'when create successfuly' do
    let(:category_id) { create(:category).id }
    let(:params) do
      {
        category_id:,
        title: 'Os Simpsons',
        sub_title: 'Principais personagens',
        text: 'Homer, Marge, Lisa, Bart, Maggie',
        author: 'Matt Groening'
      }
    end

    it { expect(result).to be_present }
    it { expect(result).to be_a(Article) }
    it { expect(result.category_id).to eq(category_id) }
    it { expect(result.title).to eq(params[:title]) }
    it { expect(result.text).to eq(params[:text]) }
    it { expect(result.text).to include('Bart') }
  end

  context 'when create failure' do
    let(:params) do
      {
        category_id:,
        title: nil
      }
    end

    context 'when category_id is nil' do
      let(:category_id) { nil }

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include('Category must exist', "Category can't be blank") }
    end

    context 'when title, text or author is nil' do
      let(:category_id) { create(:category).id }

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Title can't be blank", "Text can't be blank", "Author can't be blank") }
    end

    context 'with standard error' do
      let(:category_id) { create(:category).id }

      before do
        allow_any_instance_of(described_class).to receive(:create_article).and_raise(StandardError, 'Unexpected error')
      end

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include('Unexpected error') }
    end
  end
end
