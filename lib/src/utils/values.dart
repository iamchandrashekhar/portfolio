import 'package:portfolio/src/screens/contact/contact.dart';
import 'package:portfolio/src/screens/homepage/homepage.dart';
import 'package:portfolio/src/screens/projects/project.dart';
import 'package:portfolio/src/screens/skiils/skills.dart';
import 'package:portfolio/src/models/page_model.dart';
import 'package:portfolio/src/models/social_model.dart';

class AppValue {
  static List<PageModel> pages = [
    PageModel(
        name: 'Home',
        svgPath: "assets/images/pages/home.svg",
        widget: const HomePage()),
    PageModel(
        name: 'Project',
        svgPath: "assets/images/pages/project.svg",
        widget: const Projects()),
    PageModel(
        name: 'Skills',
        svgPath: "assets/images/pages/skills.svg",
        widget: const Skills()),
    PageModel(
        name: 'Contact',
        svgPath: "assets/images/pages/contact.svg",
        widget: const Contact()),
  ];

  static List<SocialModel> social = [
    SocialModel(svgPath: "assets/images/socials/email.svg", link: "mail"),
    SocialModel(svgPath: "assets/images/socials/github.svg", link: "github"),
    SocialModel(
        svgPath: "assets/images/socials/linkedin.svg", link: "linkedin"),
    SocialModel(
        svgPath: "assets/images/socials/telegram.svg", link: "telegram"),
  ];

  static String hello = "Hello,\nI'm Chandrashekhar";
  static String designation = "DevOps Engineer";
  static String about =
      "Hiring prioritize lift sexy productive ocean bake stand. Knowledge three is harvest 4-blocker can't or. Eco-system minimize cadence also buy-in. Open nail invite nail dive. Meat angel say both conversation conversation closer teeth usabiltiy.";
}
