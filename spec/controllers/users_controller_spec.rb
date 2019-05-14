require "rails_helper"

RSpec.describe UsersController, type: :controller do

    describe "GET #index" do
      context "when request is valid " do
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

 describe "POST #create" do
    context "when it does validation" do

      it "has invalid user" do
        invalid_user = User.new(username: "Kruzy222222222#############@@@@@@@@@@@@@@@@@%%%%%%%%%^^^^^^^^^^^^^^^^^^^^",
          email: nil,
          password: nil,
          password_confirmation: nil
        )
        expect(invalid_user.validate).to be_falsy
      end

      it "has valid user" do
        valid_user = User.new(username: "Kruzy",
          email: "moi@mail.com",
          password: "pass",
          password_confirmation: "pass"
        )
        expect(valid_user.validate).to be_truthy
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

      before {put :update, params: new_attributes}

      it "returns status code ok" do
        expect(response).to have_http_status(204)
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

      before { post :update, params: nil_attributes}

      it "returns status code unprocessable_entity" do
        expect(response).to have_http_status(204)
      end
    end
  end
end
