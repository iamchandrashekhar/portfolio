import 'package:portfolio/src/features/contact/contact.dart';
import 'package:portfolio/src/features/homepage/homepage.dart';
import 'package:portfolio/src/features/projects/project.dart';
import 'package:portfolio/src/features/skiils/skills.dart';
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
}
