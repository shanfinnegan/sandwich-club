require 'rails_helper'

describe Sandwich do
  let(:attributes) do
    {
      ingredients: "bacon, lettuce, tomato", date: "2011-08-20 00:00:00", location: "home", price: "null", tasting_notes:"delicious."
    }
  end

  it "returns the date as a string" do

    expect(Sandwich.new(attributes).show_date).to eq "Saturday, August 20, 2011"
  end


end
