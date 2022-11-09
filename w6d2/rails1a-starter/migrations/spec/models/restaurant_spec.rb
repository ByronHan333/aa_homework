require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe "'location' column" do
    it "has been renamed to 'address'" do
      expect(Restaurant.column_names).to include('address')
      expect(Restaurant.column_names).not_to include('location')
    end
  end

  describe "'owner_id' column" do
    it "has had an index added" do
      expect(ActiveRecord::Base.connection.index_exists?(:restaurants, :owner_id)).to be(true)
    end

    it "has had a foreign key constraint added" do
      schema = File.read('db/schema.rb')
      expect(/add_foreign_key \"restaurants\", \"users\", column: \"owner_id\"/ =~ schema).not_to be(nil)
    end
  end
end
