class Onboardpagemodel {
  String image;
  String title;
  String description;

  Onboardpagemodel(
      {required this.image, required this.title, required this.description});
}

List<Onboardpagemodel> onboardingPages = [
  Onboardpagemodel(
      image: 'assets/images/onboarding_1.png',
      title: 'Best online courses\nin the world',
      description:
          'Now you can learn anywhere, anytime, even if\nthere is no internet access!'),
  Onboardpagemodel(
      image: 'assets/images/onboarding_2.png',
      title: 'Explore your new skill \ntoday',
      description:
          'Our platform is designed to help you explore\nnew skills. Let’s learn & grow with Eduline!'),
];
