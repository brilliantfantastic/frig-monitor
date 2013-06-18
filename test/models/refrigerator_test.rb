require 'test_helper'

describe Refrigerator do
  it 'can have beers added to it' do
    frig = Refrigerator.create
    frig.beers.must_be_empty

    beer = Beer.new(name: '10,000 Leagues Under the Sea')
    frig.beers << beer
    frig.beers.must_equal [beer]
  end
end
