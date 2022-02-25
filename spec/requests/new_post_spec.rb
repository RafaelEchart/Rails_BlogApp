require 'rails_helper'

RSpec.describe "NewPosts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/new_post/index"
      expect(response).to have_http_status(:success)
    end
  end

end
