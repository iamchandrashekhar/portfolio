import 'package:portfolio/src/models/project_model.dart';
import 'package:portfolio/src/screens/contact/contact.dart';
import 'package:portfolio/src/screens/homepage/homepage.dart';
import 'package:portfolio/src/screens/projects/project.dart';
import 'package:portfolio/src/screens/skiils/skills.dart';
import 'package:portfolio/src/models/page_model.dart';
import 'package:portfolio/src/models/image_model.dart';
import 'package:portfolio/src/utils/assets_list.dart';

class AppValue {
  static List<PageModel> pages = [
    PageModel(
        name: 'Home',
        svgPath: AppImagesSource.homeIcon,
        widget: const HomePage()),
    PageModel(
        name: 'Project',
        svgPath: AppImagesSource.projectIcon,
        widget: const Projects()),
    PageModel(
        name: 'Skills',
        svgPath: AppImagesSource.skillsIcon,
        widget: const Skills()),
    PageModel(
        name: 'Contact',
        svgPath: AppImagesSource.contactIcon,
        widget: const Contact()),
  ];

  static List<ImageModel> social = [
    ImageModel(svgSource: AppImagesSource.mailIcon, link: "mail"),
    ImageModel(svgSource: AppImagesSource.githubIcon, link: "github"),
    ImageModel(svgSource: AppImagesSource.linkedinIcon, link: "linkedin"),
    ImageModel(svgSource: AppImagesSource.telegramIcon, link: "telegram"),
  ];

  static String hello = "Hello,\nI'm Chandrashekhar";
  static String designation = "DevOps Engineer";
  static String about =
      "Hiring prioritize lift sexy productive ocean bake stand. Knowledge three is harvest 4-blocker can't or. Eco-system minimize cadence also buy-in. Open nail invite nail dive. Meat angel say both conversation conversation closer teeth usabiltiy.";

  static Map<String, String> techBadges = {
    "ansible": AppImagesSource.ansibleIcon,
    "docker": AppImagesSource.dockerIcon,
    "flutter": AppImagesSource.flutterIcon,
    "kubernetes": AppImagesSource.kubernetesIcon,
    "python": AppImagesSource.pythonIcon,
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
        AppImagesSource.ansibleIcon,
        AppImagesSource.dockerIcon,
        AppImagesSource.flaskIcon,
        AppImagesSource.pythonIcon,
      ],
      link: "github.com",
    )
  ];

  // Skiils

  static String skills = "Skills";

  static List<ImageModel> skillsList = [
    ImageModel(
      svgSource: AppImagesSource.cLangIcon,
      title: "C",
    ),
    ImageModel(
      svgSource: AppImagesSource.cppIcon,
      title: "CPP",
    ),
    ImageModel(
      svgSource: AppImagesSource.pythonIcon,
      title: "Python",
    ),
    ImageModel(
      svgSource: AppImagesSource.dartIcon,
      title: "Dart",
    ),
    ImageModel(
      svgSource: AppImagesSource.goLangIcon,
      title: "Go",
    ),
    ImageModel(
      svgSource: AppImagesSource.flaskIcon,
      title: "Flask",
    ),
    ImageModel(
      svgSource: AppImagesSource.flutterIcon,
      title: "Flutter",
    ),
    ImageModel(
      svgSource: AppImagesSource.dockerIcon,
      title: "Docker",
    ),
    ImageModel(
      svgSource: AppImagesSource.kubernetesIcon,
      title: "Kubernetes",
    ),
    ImageModel(
      svgSource: AppImagesSource.ansibleIcon,
      title: "Ansible",
    ),
    ImageModel(
      svgSource: AppImagesSource.jenkinsIcon,
      title: "Jenkins",
    ),
    ImageModel(
      svgSource: AppImagesSource.terraformIcon,
      title: "Terraform",
    ),
  ];

  // Contacts
  static String contactMe = "Contact Me";
  static String getInTouch = "Get In Touch";

  static List<ImageModel> contactDetails = [
    ImageModel(
      svgSource: AppImagesSource.mailBorderedIcon,
      title: "chandrashekhar3227@gmail.com",
    ),
    ImageModel(
      svgSource: AppImagesSource.linkedinBorderedIcon,
      title: "chandrashekharpanwar",
    ),
  ];
}
