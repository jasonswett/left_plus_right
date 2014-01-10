require "spec_helper"

feature "Create user" do
  scenario "with valid inputs" do
    role = FactoryGirl.create(:role)
    first_name = "Jason"
    last_name = "Swett"

    visit new_user_path
    fill_in "First name", with: first_name
    fill_in "Last name", with: last_name
    fill_in "Occupation", with: "Engineer"
    select(role.name, from: "Role")
    click_on "Create User"
    visit users_path

    expect(page).to have_content("#{first_name} #{last_name}")
  end
end
