# fronze_string_literal: true

require 'rails_helper'

RSpec.describe CommentManager::Updater do
  let(:category) { create(:category, id: 1) }
  let(:article) { create(:article, category: category) }
  let(:comment) { create(:comment, article: article) }
  let(:options) {{ id: comment.id }}

  let(:instance) { described_class }
  let(:result) { instance.call(params) }

  context 'when update successfuly' do
    let(:params) { 
      options.merge(
        text: 'comment updated'
      )
    }

    it { expect(result).to be_present }
    it { expect(result).to be_a(Comment) }
    it { expect(result.text).not_to eq(comment.text) }
  end

  context 'when update failure' do
    context 'when text is nil' do
      let(:params) { 
        options.merge({
          text: nil
        }) 
      }

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Text can't be blank") }
    end

    context 'with standard error' do
      let(:params) { options }

      before do
        allow_any_instance_of(described_class).to receive(:update_comment).and_raise(StandardError, 'Unexpected error')
      end

      it { expect(result[:success]).to be false }
      it { expect(result[:error]).to include("Unexpected error") }
    end
  end

  context 'when artcile is null' do
    let(:comment) { OpenStruct.new(id: nil) }
    let(:params) { options }

    it { expect(result[:success]).to be false }
    it { expect(result[:error]).to include("Couldn't find Comment without an ID") }
  end
end