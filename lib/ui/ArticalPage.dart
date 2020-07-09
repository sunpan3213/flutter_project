import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid/model/banner_entity.dart';
import 'package:wanandroid/net/NetUtils.dart';

class ArticalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArticalPageState();
}

class _ArticalPageState extends State<ArticalPage> {
  var banners = List<BannerEntity>();

  @override
  void initState() {
    super.initState();
    NetUtils.instance.getBanner((bannerList) {
      if (mounted)
        setState(() {
          banners = bannerList;
        });
    }, (msg) {
      showToast(msg);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        child: Swiper(
          itemBuilder: (BuildContext build, int index) {
            return Image.network(banners[index].imagePath);
          },
          index: 0,
          itemCount: banners.length,
          autoplay: true,
        ),
      ),
    );
  }
}
