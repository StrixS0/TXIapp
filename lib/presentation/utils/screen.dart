enum Screen {
  welcomeScreen('/'),
  loginScreen('/login'),
  forgotPassword('/forgot-password'),

  addPaymentMethodScreen('/add-payment-method'),

  registrationType('/register'),
  register('/register/details'),
  createPassword('/register/create-password'),
  confirmAccount('/register/verify'),

  home('/home'),

  selectTeamMember('/booking/select-team-member'),
  bookingTypeMenu('/booking/type'),
  selectVehicle('/booking/vehicle'),
  selectPassengerCount('/booking/passenger'),
  selectTimeAndDate('/booking/time-and-date'),
  selectAirport('/booking/airport'),
  selectPrivateAirport('/booking/private-airport'),
  address('/booking/address'),
  reviewBooking('/booking/review'),
  confirmation('/booking/confirm'),
  bookingConfirmed('/booking/success'),

  teamMemberList('/teammember/list'),
  teamMemberAdd('/teammember/add'),

  bookingList('/modify-trip');

  const Screen(this.value);
  final String value;
}