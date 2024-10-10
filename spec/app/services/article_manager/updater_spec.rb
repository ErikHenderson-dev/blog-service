# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticleManager::Updater do
  let!(:category) { create(:category, id: 1) }
  let!(:article) { create(:article, category:) }
  let(:options) do
    {
      id: article.id
    }
  end

  let(:instance) { described_class }
  let(:result) { instance.call(params) }

  context 'when update successfuly' do
    let(:category_id) { create(:category, id: 2).id }
    let(:params) do
      options.merge(
        category_id:,
        title: 'teste',
        sub_title: 'Principais personagens'
      )
    end

    it { expect(result).to be_present }
    it { expect(result).to be_a(Article) }
    it { expect(result.title).not_to eq(article.title) }
    it { expect(result.title).not_to eq(article.sub_title) }
    it { expect(result.author).to eq(article.author) }
  end

  context 'when update failure' do
    context 'when category_id is nil' do
      let(:params) do
        options.merge({
                        category_id: nil
                      })
      end

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Category can't be blank") }
    end

    context 'when category_id not exist' do
      let(:params) do
        options.merge({
                        category_id: 2
                      })
      end

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include('Category must exist') }
    end

    context 'when title is nil' do
      let(:params) do
        options.merge({
                        title: nil
                      })
      end

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Title can't be blank") }
    end

    context 'with standard error' do
      let(:params) { options }
      let(:category_id) { create(:category).id }

      before do
        allow_any_instance_of(described_class).to receive(:update_article).and_raise(StandardError, 'Unexpected error')
      end

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include('Unexpected error') }
    end
  end

  context 'when artcile is null' do
    let(:article) { Article.new }
    let(:params) { options }

    it { expect(result[:success]).to be false }
    it { expect(result[:error]).to include("Couldn't find Article without an ID") }
  end
end
