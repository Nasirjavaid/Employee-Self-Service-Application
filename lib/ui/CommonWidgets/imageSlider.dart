import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<String> items = [
    "https://images.squarespace-cdn.com/content/v1/5d01440fc4bd93000125725d/1580951055220-US4F2RWQ0E66G8NI454F/ke17ZwdGBToddI8pDm48kLuFnPMGVMzK8mMmlZWcUC4UqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcfIdnX36F6izXnmmCd7tlqy4BJwzFY0SrIFrPxw9MMCo2cKAtV3-xzN3s5ys-PJJ9/Hero_Team_Scheduling.png",
    "https://zoom.us/docs/ent/enterprise/assets/img/zoom.png",
    "https://www.unifysquare.com/wp-content/uploads/2020/01/about-unify-top-image-650x515-V1.png",
    "https://img.pngio.com/dealroom-meetings-png-pictures-2321_1579.png"
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
          
            child: CarouselSlider(
              //  aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
               height: 100,
              
              scrollDirection: Axis.horizontal,

              // enlargeCenterPage: true,

              // autoPlay: true,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                  print("$_current");
                });
              },
              items: items.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom:0.0),
                      child: Container(
                       // width: MediaQuery.of(context).size.width,
                       width: 100,
                  
                        margin:
                            EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),

                        // decoration: BoxDecoration(color: Colors.amber),

                        child: CachedNetworkImage(
                     
                          imageUrl: i,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              //           border: Border.all(
                              //   color: Colors.blue,
                              //   width: 0.5,
                              // ),
                              shape: BoxShape.circle,

                              //  borderRadius: BorderRadius.circular(500),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                // colorFilter: ColorFilter.mode(
                                //     Colors.black12, BlendMode.colorBurn)
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 14,
                                  width: 14,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  )),
                            ],
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:5.0,top:8),
            child: Center(
                child: Text(
              "Vision Plus \n Employee Self Service",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.black38,fontWeight: FontWeight.w400),
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.map((url) {
              int index = items.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 0.5,
                  ),
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.blue : Colors.blue[100],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
