# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "PUT #update" do
    let!(:post) { create(:post) }

    context "when the request is valid" do
      let(:new_attributes) do
        {
          id: post.id,
          post: {
            content: "New content",
          },
        }
      end

      before { put :update, params: new_attributes}

      it "returns status code ok" do
        expect(response).to have_http_status(:found)
      end

      it "validate @post" do
        expect(assigns(:post)).to match(post)
      end

      it "changes the post with the new values" do
        post.reload
        expect(post.content).to eq(new_attributes[:post][:content])
      end
    end

    context "when the request is invalid" do
      let(:nil_attributes) do
        {
          id: post.id,
          post: {
            content: nil,
          },
        }
      end

      before { put :update, params: nil_attributes }

      it "returns status code unprocessable_entity" do
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe "GET #edit" do

    context "when request is valid" do
      let(:post) { create(:post) }
      let(:params) do
        {
          id: post.id,
        }
      end

      before { get :edit, params: params, format: :json }

      it "returns an specific post" do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["id"].to_i).to eq(post.id)
      end

      it "validate @post" do
        expect(assigns(:post)).to match(post)
      end
    end
  end
end
