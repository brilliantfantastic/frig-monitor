require 'test_helper'

describe Refrigerator do
  it 'can have beers added to it' do
    frig = Refrigerator.create
    frig.beers.must_be_empty

    beer = Beer.new(name: '10,000 Leagues Under the Sea')
    frig.beers << beer
    frig.beers.must_equal [beer]
  end

  it 'can have the user_id assigned' do
    user = FactoryGirl.create :user
    frig = Refrigerator.new(user_id: user.id)
    frig.valid?.must_equal true
  end

  it 'is invalid without a user' do
    frig = Refrigerator.new
    frig.valid?.must_equal false
    frig.errors.full_messages.must_include "User can't be blank"
  end
end
