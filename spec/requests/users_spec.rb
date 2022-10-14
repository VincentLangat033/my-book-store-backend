require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /me" do
    it "to fail without user logged in" do
      get me_path
      expect(response).to have_http_status(401)
    end
  end
end
