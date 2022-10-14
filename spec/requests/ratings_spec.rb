require 'rails_helper'

RSpec.describe "Ratings", type: :request do
  describe "GET /ratings" do
    it "if not logged in, should generate a not logged in/authorized 401 response" do
      get ratings_path
      expect(response).to have_http_status(401)
    end
  end
end
