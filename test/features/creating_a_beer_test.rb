require "test_helper"

feature "Creating A Beer Feature Test" do
  before :each do
    Beer.delete_all
    @user = FactoryGirl.create :user, password: 'password'
    @frig = FactoryGirl.create :frig, user: @user
    signin @user, 'password'
  end

  describe "with valid data" do
    before do
      visit new_frige_beer_path(@frig)
      within('#new_beer') do
        fill_in 'Beer Name', with: 'Dogfather Imperial Stout'
        fill_in 'Alcohol by Volume', with: 8.45
        click_on 'Create Beer'
      end
    end

    scenario "adds a beer to the database" do
      Beer.count.must_equal 1
    end

    scenario "redirects to the beer's show view" do
      current_path.must_equal frige_beer_path(@frig, Beer.last)
    end

    scenario "show view must contain the beer's name and abv" do
      beer = Beer.last
      page.must_have_content beer.name
      page.must_have_content beer.abv
    end
  end

  describe "with invalid data" do
    before do
      Beer.create(name: 'Dogfather Imperial Stout', abv: 8.45)
      visit new_frige_beer_path(@frig)
    end

    scenario "displays errors when submitting empty form" do
      within('#new_beer') do
        click_on 'Create Beer'
      end

      page.must_have_content "Name can't be blank"
      current_path.must_equal "/friges/#{@frig.id}/beers"
    end

    scenario "displays error when beer name is already taken" do
      within('#new_beer') do
        fill_in 'Beer Name', with: 'Dogfather Imperial Stout'
        fill_in 'Alcohol by Volume', with: 8.45
        click_on 'Create Beer'
      end

      page.must_have_content 'Name has already been taken'
      current_path.must_equal "/friges/#{@frig.id}/beers"
    end
  end
end
