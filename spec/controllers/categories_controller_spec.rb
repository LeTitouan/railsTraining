# frozen_string_literal: true

require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  describe "GET #index" do
    context "when request is valid " do
      let!(:categories) { create_list(:categorie, 3) }

      before { get :index, format: :json }

      it "returns status code ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validate @categorie" do
        expect(assigns(:categories)).to match_array(categories)
      end
    end
  end

  describe "GET #show" do

    context "when request is valid" do
      let(:categorie) { create(:categorie) }
      let(:params) do
        {
          id: categorie.id,
        }
      end

      before { get :show, params: params, format: :json }

      it "returns an specific categorie" do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["id"].to_i).to eq(categorie.id)
      end

      it "validate @categorie" do
        expect(assigns(:categorie)).to match(categorie)
      end
    end
  end
end
