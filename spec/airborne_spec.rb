require 'spec_helper'

describe "airborne postcode information" do

	before(:all) do
		@single_postcode = get 'http://postcodes.io/postcodes/en35qj'
	end

	it "has a status code of 200" do
		expect_json(status: 200)
	end

	it 'should have a key of result' do
		expect_json_keys(:result)
	end

	it 'check the body message' do
		expect(json_body[:result][:postcode]).to be_kind_of String
	end

	it 'should have longitude of a float' do
		expect(json_body[:result][:longitude]).to be_kind_of Float
	end

	it 'should have specific types' do
		expect_json_types('result', latitude: :float)
	end

	it 'should have specific types' do
		# expect_json_types('result', codes: {nuts: :string})
		expect_json_types('result', codes: {:nuts => :string})
	end

end