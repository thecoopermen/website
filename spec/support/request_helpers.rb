module RequestHelpers

  def sign_in
    VCR.use_cassette('interactive_sign_in') do
      @sign_in_user ||= create(:admin_user, password: 'password', password_confirmation: 'password')
      visit "/admin/login"
      fill_in "Email",    with: @sign_in_user.email
      fill_in "Password", with: "password"
      click_on "Login"
    end
    @sign_in_user
  end
end
