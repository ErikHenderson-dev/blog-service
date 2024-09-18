# fronze_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:category) { create(:category, id: 1) }
  let!(:article) { create(:article, id: 1, category: category) }
  
  describe '#index' do
    let!(:article_2) { create(:article, id: 2, category: category) }
    let(:result) { JSON.parse(response.body) }
    before { get :index }

    it { expect(response.status).to eq(200) }
    it { expect(result.first['category_id']).to be_present }
    it { expect(result.first['title']).to eq(article.title) }
    it { expect(result.first['sub_title']).to eq(article.sub_title) }
    it { expect(result.first['author']).to eq(article.author) }
    it { expect(result.count).to eq(2) }
  end

  describe '#show' do
    before { get :show, params: params }
    
    context "when show success" do
      let(:params) {{ id: article.id }}
      let(:result) { JSON.parse(response.body) }
  
      it { expect(response.status).to eq(200) }
      it { expect(result['category_id']).to be_present }
      it { expect(result['title']).to eq(article.title) }
      it { expect(result['sub_title']).to eq(article.sub_title) }
      it { expect(result['author']).to eq(article.author) }
    end

    context 'when show failure' do
      let(:params) {{ id: 500 }}

      it { expect(response.status).to eq(404) }
      it { expect(response.body).to eq("Record not found") }
    end
  end
  
  describe '#create' do
    before { post :create, params: options }

    context 'when create success' do
      let(:options) { 
        {
          category_id: category.id,
          title: 'Os Simpsons',
          sub_title: 'Principais personagens',
          text: 'Homer, Marge, Lisa, Bart, Maggie',
          author: 'Matt Groening'
        }
      }
      let(:result) { JSON.parse(response.body) }

      it { expect(response.status).to eq(200) }
      it { expect(result['category_id']).to eq(category.id) }
      it { expect(result['title']).to eq(options[:title]) }
      it { expect(result['sub_title']).to eq(options[:sub_title]) }
      it { expect(result['text']).to eq(options[:text]) }
      it { expect(result['author']).to eq(options[:author]) }
    end

    context "when create failure" do
      let(:options) {{ category_id: category.id }}
      let(:result) { JSON.parse(response.body) }

      it { expect(result['success']).to be false }
      it { expect(result['error']).to include("Title can't be blank", "Text can't be blank", "Author can't be blank") }
    end
  end
  
  describe '#update' do
    before { patch :update, params: params }
    
    context 'when update success' do
      let(:params) {{ id: article.id, title: 'title test', sub_title: 'sub title test' }}
      let(:result) { JSON.parse(response.body) }

      it { expect(response.status).to eq(200) }
      it { expect(result['category_id']).to be_present }
      it { expect(result['title']).to eq('title test') }
      it { expect(result['sub_title']).to eq('sub title test') }
      it { expect(result['author']).to eq(article.author) }
    end

    context 'when update failure' do
      let(:params) {{ id: article.id, title: nil }}
      let(:result) { JSON.parse(response.body) }

      it { expect(result['success']).to be false }
      it { expect(result['error']).to include("Title can't be blank") }
    end
  end
  
  describe '#destroy' do
    before { delete :destroy, params: params }
    
    context 'when destroy success' do
      let(:params) {{ id: article.id }}
      
      it { expect(response.status).to eq(204) }
      it { expect(response.body).to be_empty }
    end
    
    context 'when destroy failure' do
      let(:params) {{ id: 500 }}

      it { expect(response.status).to eq(404) }
      it { expect(response.body).to eq("Record not found") }
    end
  end
end