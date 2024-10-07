import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/core/asset/app_icons.dart';
import 'package:portfolio_website/core/asset/app_images.dart';
import 'package:portfolio_website/core/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  late PageController pageController = PageController(initialPage: 0);
  late List<Widget> pages = [
    _homeContent(),
    _aboutMeContent(),
    _servicesContent(context),
    _contactContent(),
  ];

  bool homeCursor = false;
  bool aboutCursor = false;
  bool servicesCursor = false;
  bool contactCursor = false;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 20, color: AppColors.primaryColor)
              ], shape: BoxShape.circle),
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AppImages.profile),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            "Mohammed",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
          const Text(
            " Asfar",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _homeContent() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(blurRadius: 40, color: AppColors.primaryColor)
                      ]),
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      AppImages.profile,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: const TextSpan(
                          text: "Hi, Its's ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 30,
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
                          fontSize: 20,
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
                      width: 300,
                      child: Text(
                        "An experienced app developer with a focus on creating highly scalable and user friendly mobile applications using Flutter. Skilled in integrating Firebase for real time database management, authentication, and cloud storage, ensuring seamless performance and enhanced security for users across platforms.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _socialIconButton(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            pageController.animateToPage(3,
                                duration: const Duration(seconds: 1),
                                curve: Curves.linearToEaseOut);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shadowColor: AppColors.primaryColor,
                              foregroundColor: Colors.black,
                              elevation: 10,
                              fixedSize: const Size.fromHeight(5)),
                          child: const Text("Hire",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () {
                            pageController.animateToPage(3,
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
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _aboutMeContent() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: "About ",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 35,
                        ),
                        children: [
                          TextSpan(
                            text: "Me",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 100),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            isReadMore == "Read More"
                                ? "${contextText.substring(0, 200)}..." // Display first part
                                : contextText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 8),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                              fixedSize: const Size.fromHeight(10)),
                          child: Text(
                            isReadMore,
                            style: const TextStyle(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
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
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: onHover ? 80 : 50,
                              color: AppColors.primaryColor)
                        ]),
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(
                        AppImages.profile,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _servicesContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Services",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(height: 10),
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                // Mobile
                _servicesContentWidget(
                  Icons.mobile_friendly_rounded,
                  "Mobile App \nDevelopment",
                  "I have experience developing mobile applications for both iOS and Android platforms using Flutter. This cross-platform framework allows me to create seamless and efficient apps with a single codebase, ensuring smooth performance on both operating systems. My projects have involved integrating real-time data, AI features, and user-friendly interfaces, and I continuously strive to improve my skills in mobile app development to create engaging and high-performing apps for diverse audiences.",
                ),
                // Web
                _servicesContentWidget(
                  Icons.web,
                  "Website \nDevelopment",
                  "In web development using Flutter, I focus on building responsive and visually appealing web applications that can run seamlessly across browsers. Flutter Web allows me to use a single codebase to develop both mobile and web apps, ensuring consistency and reducing development time. With Flutter’s rich widget library, I can design interactive, modern, and responsive UIs that adapt well to different screen sizes and devices. For the backend, I integrate Firebase for real-time databases, user authentication, and cloud storage.",
                ),

                // Backend
                _servicesContentWidget(
                  Icons.backup_outlined,
                  "Backend \nDevelopment",
                  "In my Flutter development projects, I’ve worked with various backend technologies to ensure seamless functionality and data management. I often use Firebase as a backend solution, which provides features like real-time databases, cloud storage, authentication, and hosting. Firebase integrates smoothly with Flutter, allowing for efficient user authentication, data synchronization, and secure cloud storage. Use REST APIs to connect the web application to external services and data sources.",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _servicesContentWidget(IconData icon, String title, String content) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 50, right: 50, left: 50),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            content,
            textAlign: TextAlign.justify,
            style: const TextStyle(color: Colors.black, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _contactContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        RichText(
          text: const TextSpan(
            text: "Contact ",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 30,
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
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(child: _socialIconButton()),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Feel free to reach out for any inquiries or collaborations!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "© Mohammed Asfar, 2024. All Rights Reserved.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
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
