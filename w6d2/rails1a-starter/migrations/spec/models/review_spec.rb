require 'rails_helper'

RSpec.describe Review, type: :model do
  it "table exists" do 
    expect { Review.new }.not_to raise_error(ActiveRecord::StatementInvalid)
  end

  describe "'body' column" do
    it "exists with a type of 'text'" do
      expect(Review.column_names).to include('body')
      expect(Review.column_for_attribute('body').type).to eq(:text)
    end

    it "has a 'not null' constraint" do
      expect(Review.column_for_attribute('body').null).to be(false)
    end
  end

  describe "'user_id' column" do
    it "exists with a type of 'bigint'" do
      expect(Review.column_names).to include('user_id')
      expect(Review.column_for_attribute('user_id').sql_type).to eq("bigint")
    end

    it "has a 'not null' constraint" do
      expect(Review.column_for_attribute('user_id').null).to be(false)
    end

    it "is indexed" do
      expect(ActiveRecord::Base.connection.index_exists?(:reviews, :user_id)).to be(true)
    end

    it "has a foreign key constraint" do
      schema = File.read('db/schema.rb')
      expect(/add_foreign_key \"reviews\", \"users\"/ =~ schema).not_to be(nil)
    end
  end

  describe "'restaurant_id' column" do
    it "exists with a type of 'bigint'" do
      expect(Review.column_names).to include('restaurant_id')
      expect(Review.column_for_attribute('restaurant_id').sql_type).to eq("bigint")
    end

    it "has a 'not null' constraint" do
      expect(Review.column_for_attribute('restaurant_id').null).to be(false)
    end

    it "is indexed" do
      expect(ActiveRecord::Base.connection.index_exists?(:reviews, :restaurant_id)).to be(true)
    end

    it "has a foreign key constraint" do
      schema = File.read('db/schema.rb')
      expect(/add_foreign_key \"reviews\", \"restaurants\"/ =~ schema).not_to be(nil)
    end
  end

  describe "'rating' column" do
    it "exists with a type of 'integer'" do
      expect(Review.column_names).to include('rating')
      expect(Review.column_for_attribute('rating').type).to eq(:integer)
    end

    it "has a 'not null' constraint" do
      expect(Review.column_for_attribute('rating').null).to be(false)
    end
  end

  it 'table has no additional columns (other than timestamps)' do
    expect(Review.column_names).to contain_exactly('id','body','rating','user_id','restaurant_id','created_at','updated_at')
  end
end
