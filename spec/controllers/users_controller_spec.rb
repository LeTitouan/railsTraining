# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    context "when request is valid " do
      let!(:users) { create_list(:user, 3) }

      before { get :index, format: :json }

      it "returns status code ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validate @user" do
        expect(assigns(:users)).to match_array(users)
      end
    end
  end

  describe "GET #show" do

    context "when request is valid" do
      let(:user) { create(:user) }
      let(:params) do
        {
          id: user.id,
        }
      end

      before { get :show, params: params, format: :json }

      it "returns an specific user" do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["id"].to_i).to eq(user.id)
      end

      it "validate @user" do
        expect(assigns(:user)).to match(user)
      end
    end
  end

  describe "POST #update" do
    let!(:user) { create(:user) }

    context "when the request is valid" do
      let(:new_attributes) do
        {
          id: user.id,
          user: {
            username: "Kruzy Dwayne Johnson",
          },
        }
      end

      before { put :update, params: new_attributes }

      it "returns status code ok" do
        expect(response).to have_http_status(:found)
      end

      it "validate @user" do
        expect(assigns(:user)).to match(user)
      end

      it "changes the user with the new values" do
        user.reload
        expect(user.username).to eq(new_attributes[:user][:username])
      end
    end

    context "when the request is invalid" do
      let(:nil_attributes) do
        {
          id: user.id,
          user: {
            username: nil,
          },
        }
      end

      before { post :update, params: nil_attributes }

      it "returns status code unprocessable_entity" do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET #edit" do

    context "when request is valid" do
      let(:user) { create(:user) }
      let(:params) do
        {
          id: user.id,
        }
      end

      before { get :edit, params: params, format: :json }

      it "returns an specific user" do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["id"].to_i).to eq(user.id)
      end

      it "validate @user" do
        expect(assigns(:user)).to match(user)
      end
    end
  end
end
