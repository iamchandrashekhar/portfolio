import 'package:portfolio/src/models/project_model.dart';
import 'package:portfolio/src/screens/contact/contact.dart';
import 'package:portfolio/src/screens/homepage/homepage.dart';
import 'package:portfolio/src/screens/projects/project.dart';
import 'package:portfolio/src/screens/skiils/skills.dart';
import 'package:portfolio/src/models/page_model.dart';
import 'package:portfolio/src/models/image_model.dart';

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

  static List<ImageModel> social = [
    ImageModel(svgSource: "assets/images/socials/email.svg", link: "mail"),
    ImageModel(svgSource: "assets/images/socials/github.svg", link: "github"),
    ImageModel(
        svgSource: "assets/images/socials/linkedin.svg", link: "linkedin"),
    ImageModel(
        svgSource: "assets/images/socials/telegram.svg", link: "telegram"),
  ];

  static String hello = "Hello,\nI'm Chandrashekhar";
  static String designation = "DevOps Engineer";
  static String about =
      "Hiring prioritize lift sexy productive ocean bake stand. Knowledge three is harvest 4-blocker can't or. Eco-system minimize cadence also buy-in. Open nail invite nail dive. Meat angel say both conversation conversation closer teeth usabiltiy.";

  static Map<String, String> techBadges = {
    "ansible": 'assets/images/tech_badges/ansible.svg',
    "docker": 'assets/images/tech_badges/docker.svg',
    "flutter": 'assets/images/tech_badges/flutter.svg',
    "kubernetes": 'assets/images/tech_badges/kubernetes.svg',
    "python": 'assets/images/tech_badges/python.svg',
  };

  // Project page

  static String myProjects = "My Projects";
  static String projectsAbout =
      "Following projects showcases my skills and experience through real-world examples of my work. Each project is briefly described with links to code repositories and live demos in it. It reflects my ability to solve complex problems, work with different technologies, and manage projects effectively.";
  static List<ProjectModel> projectList = [
    ProjectModel(
      name: "Lorem ipsum dolor sit amet",
      description:
          "What team web live be got as don't later. This reference these quick cc. Problem fruit hiring impact pulling requirements shark spaces. If as due keep culture.",
      techStack: [
        "assets/images/tech_badges/flutter.svg",
        "assets/images/tech_badges/ansible.svg",
        "assets/images/tech_badges/docker.svg",
        "assets/images/tech_badges/python.svg",
      ],
      link: "github.com",
    )
  ];

  // Skiils

  static String skills = "Skills";

  static List<ImageModel> skillsList = [
    ImageModel(
      svgSource: 'assets/images/tech_badges/c.svg',
      title: "C",
    ),
    ImageModel(
      svgSource: 'assets/images/tech_badges/cpp.svg',
      title: "CPP",
    ),
    ImageModel(
      svgSource: 'assets/images/tech_badges/python.svg',
      title: "Python",
    ),
    ImageModel(
      svgSource: 'assets/images/tech_badges/dart.svg',
      title: "Dart",
    ),
    ImageModel(
      svgSource: 'assets/images/tech_badges/go.svg',
      title: "Go",
    ),
    ImageModel(
      svgSource: 'assets/images/tech_badges/flask.svg',
      title: "Flask",
    ),
    ImageModel(
      svgSource: 'assets/images/tech_badges/flutter.svg',
      title: "Flutter",
    ),
    ImageModel(
      svgSource: 'assets/images/tech_badges/docker.svg',
      title: "Docker",
    ),
    ImageModel(
      svgSource: 'assets/images/tech_badges/kubernetes.svg',
      title: "Kubernetes",
    ),
    ImageModel(
      svgSource: 'assets/images/tech_badges/ansible.svg',
      title: "Ansible",
    ),
    ImageModel(
      svgSource: 'assets/images/tech_badges/jenkins.svg',
      title: "Jenkins",
    ),
    ImageModel(
      svgSource: 'assets/images/tech_badges/terraform.svg',
      title: "Terraform",
    ),
  ];

  // Contacts
  static String contactMe = "Contact Me";
  static String getInTouch = "Get In Touch";

  static List<ImageModel> contactDetails = [
    ImageModel(
        svgSource: "assets/images/socials/email_border.svg",
        title: "chandrashekhar3227@gmail.com"),
    ImageModel(
        svgSource: "assets/images/socials/linkedin_border.svg",
        title: "chandrashekharpanwar"),
  ];
}
