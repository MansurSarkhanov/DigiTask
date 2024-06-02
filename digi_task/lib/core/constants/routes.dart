enum AppRoutes {
  splash(path: '/', name: 'splash'),
  onboarding(path: '/onboarding', name: 'onboarding'),
  login(path: '/login', name: 'login'),
  home(path: '/home', name: 'home'),
  resetPassword(path: 'resetPassword', name: 'resetPassword'),
  notification(path: 'notification', name: 'notification'),
  profileEdit(path: 'profileEdit', name: 'profileEdit');



  const AppRoutes({required this.path, required this.name});
  final String path;
  final String name;
}
