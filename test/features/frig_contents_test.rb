require 'test_helper'

describe 'Frig contents feature test' do
  it 'lists my favorite beers by name' do
    visit root_path
    page.must_have_content 'Edmond Fitzgerald'
    page.must_have_content 'Hoppy IPA'
  end
end
