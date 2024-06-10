import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_ui/resource/constant/Getappimg.dart';
import 'package:ecommerce_ui/resource/constant/Texttheme.dart';
import 'package:ecommerce_ui/resource/constant/appcolors.dart';
import 'package:ecommerce_ui/screen/onboarding/welcomeview.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Sliderview extends StatefulWidget {
  const Sliderview({super.key});

  @override
  State<Sliderview> createState() => _SliderviewState();
}

class _SliderviewState extends State<Sliderview> {
  List<Map<String, dynamic>> datalist = [
    {
      "img": "assets/image/slider1.png",
      "name": "20% Dicount New Arrical Product",
      "description":
          "Lorem ipsum dolor sit amet consectetur. Lectus mi quam dolor nisl proin at turpis tellus nec."
    },
    {
      "img": "assets/image/slider2.png",
      "name": "Take Advantage of the Offer Shopping",
      "description":
          "Lorem ipsum dolor sit amet consectetur. Lectus mi quam dolor nisl proin at turpis tellus nec."
    },
    {
      "img": "assets/image/slider3.png",
      "name": "All Types Offer Within Your Reach",
      "description":
          "Lorem ipsum dolor sit amet consectetur. Lectus mi quam dolor nisl proin at turpis tellus nec."
    },
  ];
  int currentindex = 0;
  CarouselController _CarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    final txtstyle = Apptexttheme();
    final colors = AppColors();
    final icon = Getappicon();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                  datalist.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    height: 8,
                    width: currentindex == index ? 30 : 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: currentindex == index
                            ? colors.black
                            : colors.black.withOpacity(0.3)),
                  ),
                ),
              ),
              IconButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: colors.black),
                  onPressed: () {
                    _CarouselController.nextPage();
                    currentindex == 2
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Welcomeview(),
                            ))
                        : _CarouselController.nextPage();
                  },
                  icon: Image.asset(icon.arrowright, color: colors.white))
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            carouselController: _CarouselController,
            options: CarouselOptions(
                onPageChanged: (index, reason) => setState(() {
                      currentindex = index;
                    }),
                autoPlay: true,
                aspectRatio: 9 / 19,
                viewportFraction: 1),
            items: datalist.map((i) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Image.asset(i["img"]),
                    Gap(20),
                    Text(
                      i["name"],
                      style: txtstyle
                          .fs28Extra_bold()
                          .copyWith(color: colors.black),
                    ),
                    Gap(20),
                    Text(
                      i["description"],
                      style: txtstyle.fs14normal(),
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
