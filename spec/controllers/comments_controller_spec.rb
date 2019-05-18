# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "GET #index" do
    context "when request is valid " do
      let!(:comments) { create_list(:comment, 3) }

      before { get :index, format: :json }

      it "returns status code ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validate @comment" do
        expect(assigns(:comments)).to match_array(comments)
      end
    end
  end

  describe "GET #show" do

    context "when request is valid" do
      let(:comment) { create(:comment) }
      let(:params) do
        {
          id: comment.id,
        }
      end

      before { get :show, params: params, format: :json }

      it "returns an specific comment" do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["id"].to_i).to eq(comment.id)
      end

      it "validate @comment" do
        expect(assigns(:comment)).to match(comment)
      end
    end
  end
end
