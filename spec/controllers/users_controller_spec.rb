require "rails_helper"

RSpec.describe UsersController, type: :controller do

 describe "POST #create" do

    context "validation" do

      it "has unvalid user" do

        invalid_user = User.new(username: "Kruzy222222222#############@@@@@@@@@@@@@@@@@%%%%%%%%%^^^^^^^^^^^^^^^^^^^^",
          email: nil,
          encrypted_password: nil
        )

        expect(invalid_user.validate).to be false

      end

      it "has valid user" do

        valid_user = User.new(username: "Kruzy",
          email: "moi@mail.com",
          encrypted_password: "pass"
        )

        expect(valid_user.validate).to be true

      end

    end

  end

  describe "GET #index" do

    context "valid request" do

       let!(:users) {create_list(:user, 3)}

      before {get :index, format: :json}

      it "returns status code ok" do
        expect(response).to have_http_status(200)
      end
      it "validate @user" do
        expect(assigns(:users)).to match_array(users)
      end

    end

  end

  describe "DELETE #detroy" do

    context "valid request" do

      let(:user_to_destroy) {create(:user)}
      let(:id_user_to_destroy) do
        {
           id: user_to_destroy.id,
        }
      end

      before { delete :destroy, params: id_user_to_destroy, format: :json}

      it "returns status code ok" do
        expect(response).to have_http_status(204)
      end

    end

  end

end
