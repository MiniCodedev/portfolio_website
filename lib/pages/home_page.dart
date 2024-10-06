import 'package:flutter/material.dart';
import 'package:portfolio_website/core/asset/app_images.dart';
import 'package:portfolio_website/core/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(alignment: Alignment.topCenter, child: _appBar(context)),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _homeContent(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
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
          Text(
            "Home",
            style: TextStyle(
              fontWeight: FontWeight.w600,
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

  Widget _homeContent(BuildContext context) {
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
                            fontFamily: "Poppins")),
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
            ],
          ),
          const SizedBox(
            width: 200,
          ),
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(blurRadius: 20, color: AppColors.primaryColor)
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
  }
}
