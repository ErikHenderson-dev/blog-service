# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let!(:category) { create(:category, id: 1) }

  describe '#index' do
    let(:result) { JSON.parse(response.body) }
    before { get :index }

    it { expect(response.status).to eq(200) }
    it { expect(result.first).to be_present }
    it { expect(result.first['name']).to eq(category.name) }
  end

  describe '#show' do
    before { get :show, params: }

    context 'when show success' do
      let(:params) { { id: category.id } }
      let(:result) { JSON.parse(response.body) }

      it { expect(response.status).to eq(200) }
      it { expect(result).to be_present }
      it { expect(result['name']).to eq(category.name) }
    end

    context 'when show failure' do
      let(:params) { { id: 500 } }

      it { expect(response.status).to eq(404) }
      it { expect(response.body).to eq('Record not found') }
    end
  end

  describe '#create' do
    before { post :create, params: options }

    context 'when create success' do
      let(:options) do
        {
          name: 'Animes'
        }
      end
      let(:result) { JSON.parse(response.body) }

      it { expect(response.status).to eq(200) }
      it { expect(result['name']).to eq(options[:name]) }
    end

    context 'when create failure' do
      let(:options) { { name: nil } }
      let(:result) { JSON.parse(response.body) }

      it { expect(result['success']).to be false }
      it { expect(result['error']).to include("Name can't be blank") }
    end
  end

  describe '#update' do
    before { patch :update, params: }

    context 'when update success' do
      let(:params) { { id: category.id, name: 'name test' } }
      let(:result) { JSON.parse(response.body) }

      it { expect(response.status).to eq(200) }
      it { expect(result).to be_present }
      it { expect(result['name']).to eq('name test') }
    end

    context 'when update failure' do
      let(:params) { { id: category.id, name: nil } }
      let(:result) { JSON.parse(response.body) }

      it { expect(result['success']).to be false }
      it { expect(result['error']).to include("Name can't be blank") }
    end
  end

  describe '#destroy' do
    before { delete :destroy, params: }

    context 'when destroy success' do
      let(:params) { { id: category.id } }

      it { expect(response.status).to eq(204) }
      it { expect(response.body).to be_empty }
    end

    context 'when destroy failure' do
      let(:params) { { id: 500 } }

      it { expect(response.status).to eq(404) }
      it { expect(response.body).to eq('Record not found') }
    end
  end
end
