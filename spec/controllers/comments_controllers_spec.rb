# fronze_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:body) { JSON.parse(response.body) }

  context '#index' do
    before { get :index }

    it 'return success status' do
      expect(response).to have_http_status(200)
    end

    it { expect(body.first).not_to be_empty }
  end
end
