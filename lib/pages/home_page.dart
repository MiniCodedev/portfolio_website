import 'package:flutter/material.dart';
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
}
