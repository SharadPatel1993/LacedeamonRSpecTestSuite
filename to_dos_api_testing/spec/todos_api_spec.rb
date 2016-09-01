require 'spec_helper'
require "to_dos_api_tests"

describe "Todos API testing: " do

	context "Given API is tested positively (Valid title, ID and date are used)" do
		it "should successfully create a todo" do
			pos_create

			#Expected Results
			expect(@r.code).to eq 201

			pos_delete
		end
		it "should successfully read a todo" do
			pos_create
			pos_read

			#Expected Results
			expect(@r.code).to eq 200
			#expect(@r["title"]).to eq "Positive Create Test!"

			pos_delete
		end
		it "should successfully update a todo" do
			pos_create
			pos_update

			#Expected Results
			expect(@r.code).to eq 200
			#expect(@r["title"]).to eq "Positive Update Test!"

			pos_delete
		end
		it "should successfully delete a todo" do
			pos_create
			pos_delete

			#Expected Results
			expect(@r.code).to eq 204

			pos_delete
		end
	end

	context "Negatively testing API" do
		it "should not create a todo with an empty title" do
			neg_create

			#Expected Results
			expect(@r.code).to eq 500
		end
		it "should not read a todo when given an incorrect ID" do
			neg_read

			#Expected Results
			expect(@r.code).to eq 404
		end
		it "should not update a todo when given an incorrect ID" do
			pos_create
			neg_update

			#Expected Results
			expect(@r.code).to eq 422

			pos_delete
		end
		it "should not delete anything when given no ID" do
			neg_delete

			#Expected Results
			expect(@r.code).to eq 405
		end
	end

end