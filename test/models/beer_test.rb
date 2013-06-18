require 'test_helper'

describe 'A new', Beer do
  it 'requires confirmation of name'
  it 'is invalid if it has no name'
  it 'is valid if it has a name, confirmation, and no ABV'
  it 'is invalid if the name has already been taken'

  describe 'with a name' do
    it 'is invalid if the ABV is not one or two digits followed by a period and up to 2 digits'
    it 'is valid if the ABV if it is 2 digits followed by a period and 2 digits'
  end
end
