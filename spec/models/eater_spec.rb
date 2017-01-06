require 'rails_helper'

describe Eater do
  let (:attributes) do
    { name: "Rufus" }
  end

  it 'is valid with a name' do
    expect(Eater.new(attributes)).to be_valid
  end

  it 'is invalid without a name' do
    eater = Eater.new(name: nil)
    eater.valid?
    expect(eater.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    Eater.create(name: 'Rufus')
    eater = Eater.new(name: 'rufus')
    eater.valid?
    expect(eater.errors[:name]).to include ("has already been taken")
  end
end
