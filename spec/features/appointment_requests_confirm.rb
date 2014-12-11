require 'spec_helper'

feature "User requests an appointment" do
  scenario "when user creates a new mentoring request" do
    visit '/appointment_requests/new?availability_id=2'
    fill_in "first_name", with: "teeee"
    fill_in "last_name", with: "money"
    fill_in "twitter_handle", with: "makarnamasdf"
    fill_in "email", with: "gphummer@gmail.com"


    # ar_param = {availability_id: 2, mentee_id: 3}
    # AppointmentRequest.any_instance.stub(ar_param)

    click_on 'submit'
    expect(page).to have_text("Thanks for signing up!!")
  end
end
