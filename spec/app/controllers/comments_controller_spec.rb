# fronze_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:category) { create(:category, id: 1) }
  let(:article) { create(:article, category: category) }
  let!(:comment) { create(:comment, article: article) }
  
  describe '#index' do
    let(:result) { JSON.parse(response.body) }
    before { get :index }

    it { expect(response.status).to eq(200) }
    it { expect(result.first).to be_present }
    it { expect(result.first['text']).to eq(comment.text) }
    it { expect(result.first['article_id']).to eq(article.id) }
  end

  describe '#show' do
    before { get :show, params: params }
    
    context "when show success" do
      let(:params) {{ id: comment.id }}
      let(:result) { JSON.parse(response.body) }
  
      it { expect(response.status).to eq(200) }
      it { expect(result).to be_present }
      it { expect(result['text']).to eq(comment.text) }
    end

    context 'when show failure' do
      let(:params) {{ id: 100 }}

      it { expect(response.status).to eq(404) }
      it { expect(response.body).to eq("Record not found") }
    end
  end
  
  describe '#create' do
    before { post :create, params: options }

    context 'when create success' do
      let(:options) { 
        {
          text: 'new commentary',
          article_id: article.id
        }
      }
      let(:result) { JSON.parse(response.body) }

      it { expect(response.status).to eq(200) }
      it { expect(result['text']).to eq(options[:text]) }
      it { expect(result['article_id']).to eq(options[:article_id]) }
    end

    context "when create failure" do
      let(:options) {{ name: nil }}
      let(:result) { JSON.parse(response.body) }

      it { expect(result['success']).to be false }
      it { expect(result['error']).to include("Text can't be blank") }
    end
  end
  
  describe '#update' do
    before { patch :update, params: params }
    
    context 'when update success' do
      let(:params) {{ id: comment.id, text: 'updated comment' }}
      let(:result) { JSON.parse(response.body) }

      it { expect(response.status).to eq(200) }
      it { expect(result).to be_present }
      it { expect(result['text']).to eq(params[:text]) }
    end

    context 'when update failure' do
      let(:params) {{ id: comment.id, text: nil }}
      let(:result) { JSON.parse(response.body) }

      it { expect(result['success']).to be false }
      it { expect(result['error']).to include("Text can't be blank") }
    end
  end
  
  describe '#destroy' do
    before { delete :destroy, params: params }
    
    context 'when destroy success' do
      let(:params) {{ id: comment.id }}
      
      it { expect(response.status).to eq(204) }
      it { expect(response.body).to be_empty }
    end
    
    context 'when destroy failure' do
      let(:params) {{ id: 100 }}

      it { expect(response.status).to eq(404) }
      it { expect(response.body).to eq("Record not found") }
    end
  end
end