import 'package:wanandroid/generated/json/base/json_convert_content.dart';

class BannerEntity with JsonConvert<BannerEntity> {
	String desc;
	int id;
	String imagePath;
	int isVisible;
	int order;
	String title;
	int type;
	String url;
}
