require 'spec_helper'



feature "User requests an appointment" do
  before do
    time = Time.now

    # User.create!()
    # Availability.create!(start_time: time, end_time: time + 1.hour, mentor_id: 1, city: "Chicago",
    #                        timezone: "America/Chicago")
  end

  scenario "when user creates a new mentoring request" do
    availability = Availability.last.id
    visit "/appointment_requests/new?availability_id=#{availability}"

    fill_in "first_name", with: "teeee"
    fill_in "last_name", with: "money"
    fill_in "twitter_handle", with: "makarnamasdf"
    fill_in "email", with: "gphummer@gmail.com"


    # ar_param = {availability_id: 2, mentee_id: 3}
    # AppointmentRequest.any_instance.stub(ar_param)

    click_on 'submit'

    expect(page).to have_text("Thanks for signing up!!!!")
  end
end
