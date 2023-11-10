# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Visitors", type: :request do
  describe "List of Visitors" do
    it "Returns a successful result" do
      expect {
        get "/visitors"
      }.to perform_under(30).ms
      expect(response).to be_successful
    end
  end
end

