class LoginForm
  include Capybara::DSL

  def visit_page
    visit('/users/sign_in')
    self
  end

  def login_as(user)
    fill_in('user[email]', with: user.email)
    fill_in("Password", with: user.password)
    click_on("Sign In")
    self
  end
end