require 'test_helper'

feature 'Creating A Refrigerator Feature Test' do
  before do
    @user = FactoryGirl.create :user, password: 'password'
    signin @user, 'password'
    visit new_frige_path
  end

  scenario 'creating a refrigerator with valid data' do
    fill_in 'Brand', with: 'Kennemore'
    click_on 'Create Refrigerator'

    frig = Refrigerator.last
    frig.brand.must_equal 'Kennemore'
    frig.user_id.must_equal @user.id
  end

  scenario 'submitting an empty form' do
    fill_in 'Brand', with: ''
    click_on 'Create Refrigerator'

    Refrigerator.count.must_equal 0
    current_path.must_equal '/friges'
    page.must_have_content "Brand can't be blank"
  end

  describe 'while staying on the same page' do
    self.use_transactional_fixtures = false

    before do
      visit kitchen_path
    end

    after(:each) do
      User.destroy_all
      Refrigerator.destroy_all
    end

    scenario 'creating a frig with valid data', js: true do
      click_link 'Add refrigerator'
      within '#new_refrigerator' do
        fill_in 'refrigerator_brand', with: 'Samsung'
        page.find('#refrigerator_brand').native.send_keys :return
      end
      sleep 1
      new_frig = Refrigerator.last
      current_path.must_equal kitchen_path
      page.must_have_content new_frig.brand
    end
  end
end
