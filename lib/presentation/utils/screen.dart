enum Screen {
  welcomeScreen('/'),
  loginScreen('/login'),
  forgotPassword('/forgot-password'),

  addPaymentMethodScreen('/add-payment-method'),

  registrationType('/register'),
  register('/register/details'),
  createPassword('/register/create-password'),
  confirmAccount('/register/verify'),

  home('/home');

  const Screen(this.value);
  final String value;
}