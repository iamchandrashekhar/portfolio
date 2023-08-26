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
    ImageModel(
      svgSource: AppImagesSource.mailIcon,
      link: "chandrashekhar3227@gmail.com",
      title: "Mail",
    ),
    ImageModel(
      svgSource: AppImagesSource.githubIcon,
      link: "github.com/iamchandrashekhar",
      title: "GitHub",
    ),
    ImageModel(
      svgSource: AppImagesSource.linkedinIcon,
      link: "www.linkedin.com/in/chandra-shekhar-panwar",
      title: "LinkedIn",
    ),
    ImageModel(
      svgSource: AppImagesSource.telegramIcon,
      link: "t.me/itsNuclear",
      title: "Telegram",
    ),
  ];

  static String hello = "Hello,\nI'm Chandrashekhar";
  static String designation = "Flutter Developer";
  static String about =
      "I am a Flutter developer with 2 years of experience in developing mobile applications for Android and iOS. I have a strong understanding of the Flutter framework and its capabilities, and I am proficient in using its widgets and APIs to create beautiful and user-friendly apps. I am also familiar with the Dart programming language and its syntax.";

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
      name: "System calls and capabilities in docker",
      description: "",
      techStack: [
        AppImagesSource.htmlIcon,
        AppImagesSource.cssIcon,
        AppImagesSource.flaskIcon,
        AppImagesSource.pythonIcon,
      ],
      link:
          "github.com/iamchandrashekhar/System-calls-and-Capabilities-in-Docker",
    ),
    ProjectModel(
      name: "Portfolio",
      description: "",
      techStack: [
        AppImagesSource.flutterIcon,
        AppImagesSource.firebaseIcon,
      ],
      link: "github.com/iamchandrashekhar/portfolio",
    ),
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
      svgSource: AppImagesSource.firebaseIcon,
      title: "Firebase",
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
  ];

  // Contacts
  static String contactMe = "Contact Me";
  static String getInTouch = "Get In Touch";

  static List<ImageModel> contactDetails = [
    ImageModel(
      svgSource: AppImagesSource.mailBorderedIcon,
      link: "chandrashekhar3227@gmail.com",
      title: "Send an email",
    ),
    ImageModel(
      svgSource: AppImagesSource.linkedinBorderedIcon,
      link: "www.linkedin.com/in/chandra-shekhar-panwar",
      title: "Connect on LinkedIn",
    ),
    ImageModel(
      svgSource: AppImagesSource.telegramCircleIcon,
      link: "t.me/itsNuclear",
      title: "Find me on Telegram",
    ),
  ];
}
