module Features
  def sign_in(user)
    visit login_path
    fill_in "E-Mail", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
  end
end
