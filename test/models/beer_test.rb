require 'test_helper'

describe 'A new', Beer do
  it 'requires confirmation of name' do
    beer = Beer.new(name: 'x', name_confirmation: '')
    beer.valid?.must_equal false

    beer.name_confirmation = 'y'
    beer.valid?.must_equal false

    beer.name_confirmation = 'x'
    beer.valid?.must_equal true
  end

  it 'is invalid if it has no name' do
    beer = Beer.new
    beer.valid?.must_equal false

    beer.name = 'x'
    beer.name_confirmation = 'x'
    beer.valid?.must_equal true
  end

  it 'is valid if it has a name, confirmation, and no ABV' do
    beer = Beer.new(name: 'x', name_confirmation: 'x')
    beer.valid?.must_equal true
  end

  it 'is invalid if the name has already been taken' do
    Beer.create(name: 'Boston Logger', name_confirmation: 'Boston Logger')
    beer = Beer.new(name: 'Boston Logger', name_confirmation: 'Boston Logger')
    beer.valid?.must_equal false
  end

  describe 'with a name' do
    before do
      @beer = Beer.new(name: 'x', name_confirmation: 'x')
    end

    it 'is invalid if the ABV is not one or two digits followed by a period and up to 2 digits' do
      @beer.abv = 0.456 # 3 after period
      @beer.valid?.must_equal false

      @beer.abv = 100.45 # 3 before period
      @beer.valid?.must_equal false
    end

    it 'is valid if the ABV if it is 2 digits followed by a period and 2 digits' do
      @beer.abv = 10.45
      @beer.valid?.must_equal true

      @beer.abv = 1.1
      @beer.valid?.must_equal true
    end
  end
end
