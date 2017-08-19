require 'acceptance_helper'

resource "Users" do
  header "Accept", "application/json"
  header "Content-Type", "application/json"

  let(:user) {
    User.create(
      email: "email@example.com",
      password: '12345678',
      password_confirmation: '12345678',
      confirmed_at: Time.now
    )
  }

  get "/api/v1/users" do
    parameter :page, "Current page of users"

    let(:page) {1}

    example_request "Getting a list of users" do
      expect(response_body).to eq(User.all.to_json)
      expect(status).to eq(200)
    end
  end

  get "/api/v1/users/:id" do
    let(:id) {user.id}

    example_request "Getting a specific user" do
      expect(response_body).to eq(user.to_json)
      expect(status).to eq(200)
    end
  end
end
