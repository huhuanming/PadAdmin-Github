require 'rails_helper'

RSpec.describe "Companies", :type => :request do
  describe "GET /companies" do
    it "works! (now write some real specs)" do
      get companies_path
      expect(response.status).to be(200)
    end
  end
  describe "POST /companies" do
  	 it "works! (now write some real specs)" do
      get companies_path
      expect(response.status).to be(400)
  	end
  end
  describe "GET /companies" do
  	it "works! (now write some real specs)" do
  		get new_company_path
  		expect(response.status).to be(400)
  		end
  end
  describe "GET /Companies" do
  	it "works! (mow write some real specs)" do
  		get edit_company_path
  	    expect(response.status).to be(200)
  	end
  end
  describe "GET /Companies" do
  	it "works! (more write some real specs)" do 
  		get company_path 
  		expect(response.status).to be(400)
  	end
  end
   describe "PATCH /Companies" do
  	it "works! (more write some real specs)" do 
  		get company_path 
  		expect(response.status).to be(400)
  	end
  end
  describe "PUT /Companies" do
  	it "works! (more write some real specs)" do 
  		get company_path 
  		expect(response.status).to be(400)
  	end
  end
   describe "DELETE /Companies" do
  	it "works! (more write some real specs)" do 
  		get company_path 
  		expect(response.status).to be(400)
  	end
  end
end
