# fronze_string_literal: true

require 'rails_helper'

RSpec.describe CommentManager::Creator do
  let(:category) { create(:category, id: 1) }
  let!(:article) { create(:article, category: category) }
  let(:instance) { described_class }
  let(:result) { instance.call(params) }

  context 'when create successfuly' do
    let(:params) {{ article_id: article.id, text: 'new commentary' }}

    it { expect(result).to be_present }
    it { expect(result).to be_a(Comment) }
    it { expect(result.text).to eq(params[:text]) }
    it { expect(result.article_id).to eq(article.id) }
  end

  context 'when create failure' do
    let(:params) {{ article_id: article.id, text: nil }}
    
    it { expect(result[:success]).to be false }
    it { expect(result[:error]).to include("Text can't be blank") }

    context 'with standard error' do
      before do
        allow_any_instance_of(described_class).to receive(:create_comment).and_raise(StandardError, 'Unexpected error')
      end

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Unexpected error") }
    end
  end
end