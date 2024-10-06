import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/core/asset/app_icons.dart';
import 'package:portfolio_website/core/asset/app_images.dart';
import 'package:portfolio_website/core/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController = PageController(initialPage: 0);
  late List<Widget> pages = [
    _homeContent(),
    _aboutMeContent(),
    _servicesContent(context),
    _contactContent(),
  ];

  String isReadMore = "Read More";
  bool onHover = false;
  String contextText =
      "I’m Mohammed Asfar, a second-year student pursuing a B.E. in Computer Science Engineering. I have a strong passion for app development and enjoy staying current with the latest technologies and trends in the field. I’ve developed mobile apps, websites, and desktop software using Flutter, and I am proficient in Python, Java, C, and Dart. I’ve also worked on several projects, including real-time object detection with OpenCV and integrating AI chatbots into mobile applications. These experiences have honed my coding skills and problem-solving abilities. I’m eager to further develop my skills and contribute to innovative projects in app development and AI, particularly those that involve real-world data and enhance user experiences. Outside of my studies, I enjoy gaming and keeping up with tech trends, which inspires me to create engaging applications.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: _appBar(),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          controller: pageController,
          itemBuilder: (context, index) {
            return pages[index];
          },
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      color: Colors.transparent,
      height: 70,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
          ),
          Text(
            "Mohammed",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
          Text(
            " Asfar",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          MouseRegion(
            child: Text(
              "Home",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "About",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "Services",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            " Contact",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 100,
          )
        ],
      ),
    );
  }

  Widget _homeContent() {
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: const TextSpan(
                        text: "Hi, Its's ",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 50,
                        ),
                        children: [
                          TextSpan(
                              text: "Asfar",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontFamily: "Poppins")),
                        ],
                      ),
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      text: "I'm a ",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      children: [
                        TextSpan(
                          text: "App Developer",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 500,
                    child: Text(
                      "An experienced app developer with a focus on creating highly scalable and user friendly mobile applications using Flutter. Skilled in integrating Firebase for real time database management, authentication, and cloud storage, ensuring seamless performance and enhanced security for users across platforms.",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _socialIconButton(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shadowColor: AppColors.primaryColor,
                          foregroundColor: Colors.black,
                          elevation: 10,
                        ),
                        child: const Text("Hire",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {
                          pageController.animateToPage(1,
                              duration: const Duration(seconds: 1),
                              curve: Curves.linearToEaseOut);
                        },
                        style: const ButtonStyle(
                          side: WidgetStatePropertyAll(
                              BorderSide(color: AppColors.primaryColor)),
                          foregroundColor:
                              WidgetStatePropertyAll(AppColors.primaryColor),
                        ),
                        child: const Text("Contact",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 70,
              ),
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(blurRadius: 50, color: AppColors.primaryColor)
                    ]),
                child: const CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage(
                    AppImages.profile,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _aboutMeContent() {
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    onHover = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    onHover = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        blurRadius: onHover ? 80 : 50,
                        color: AppColors.primaryColor)
                  ]),
                  child: const CircleAvatar(
                    radius: 150,
                    backgroundImage: AssetImage(
                      AppImages.profile,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: "About ",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 50,
                      ),
                      children: [
                        TextSpan(
                            text: "Me",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontFamily: "Poppins")),
                      ],
                    ),
                  ),
                  const SizedBox(width: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 500,
                        child: Text(
                          isReadMore == "Read More"
                              ? "${contextText.substring(0, 200)}..." // Display first part
                              : contextText,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (isReadMore == "Read More") {
                              isReadMore = "Read Less";
                            } else {
                              isReadMore = "Read More";
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shadowColor: AppColors.primaryColor,
                          foregroundColor: Colors.black,
                          elevation: 10,
                        ),
                        child: Text(isReadMore),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _servicesContent(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Services",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Mobile
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(25),
              width: width / 4,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.mobile_friendly_rounded,
                    color: Colors.black,
                    size: 80,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Mobile App \nDevelopment",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: width / 4,
                    child: const Text(
                      "I have experience developing mobile applications for both iOS and Android platforms using Flutter. This cross-platform framework allows me to create seamless and efficient apps with a single codebase, ensuring smooth performance on both operating systems. My projects have involved integrating real-time data, AI features, and user-friendly interfaces, and I continuously strive to improve my skills in mobile app development to create engaging and high-performing apps for diverse audiences.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
            // Web
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(25),
              width: width / 4,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.web,
                    color: Colors.black,
                    size: 80,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Website \nDevelopment",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: width / 4,
                    child: const Text(
                      "In web development using Flutter, I focus on building responsive and visually appealing web applications that can run seamlessly across browsers. Flutter Web allows me to use a single codebase to develop both mobile and web apps, ensuring consistency and reducing development time. With Flutter’s rich widget library, I can design interactive, modern, and responsive UIs that adapt well to different screen sizes and devices. For the backend, I integrate Firebase for real-time databases, user authentication, and cloud storage.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
            // Backend
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(25),
              width: width / 4,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.backup_outlined,
                    color: Colors.black,
                    size: 80,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Backend \nDevelopment",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: width / 4,
                    child: const Text(
                      "In my Flutter development projects, I’ve worked with various backend technologies to ensure seamless functionality and data management. I often use Firebase as a backend solution, which provides features like real-time databases, cloud storage, authentication, and hosting. Firebase integrates smoothly with Flutter, allowing for efficient user authentication, data synchronization, and secure cloud storage. Use REST APIs to connect the web application to external services and data sources.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _contactContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: const TextSpan(
            text: "Contact ",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 50,
            ),
            children: [
              TextSpan(
                  text: "Me",
                  style: TextStyle(
                      color: AppColors.primaryColor, fontFamily: "Poppins")),
            ],
          ),
        ),
        const SizedBox(height: 50),
        const Text(
          "You can contact me through Instagram and LinkedIn",
        ),
        const SizedBox(
          height: 20,
        ),
        Center(child: _socialIconButton()),
        const SizedBox(
          height: 20,
        ),
        const Text(
            "Feel free to reach out for any inquiries or collaborations!"),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("© Mohammed Asfar, 2024. All Rights Reserved."),
        )
      ],
    );
  }

  Widget _socialIconButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () async {
            final Uri url = Uri.parse('https://github.com/MiniCodedev');
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },
          child: Container(
            padding: const EdgeInsets.all(1.5),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                shape: BoxShape.circle),
            child: SvgPicture.asset(
              AppIcons.githubIcon,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () async {
            final Uri url = Uri.parse(
                "https://www.linkedin.com/in/mohammed-asfar-a22b68295");
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                shape: BoxShape.circle),
            child: SvgPicture.asset(
              AppIcons.linkedIcon,
              height: 23,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () async {
            final Uri url =
                Uri.parse('https://www.instagram.com/mohammed_asfar/');
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                shape: BoxShape.circle),
            child: SvgPicture.asset(
              AppIcons.instaIcon,
              height: 23,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
          ),
        )
      ],
    );
  }
}
