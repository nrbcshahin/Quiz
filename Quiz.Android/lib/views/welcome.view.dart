import 'package:flutter/material.dart';
import '../../helpers/api.helper.dart';
import '../models/carousel.dart';
import '../widgets/carousel.widget.dart';
import '../widgets/drawer.widget.dart';
import '../widgets/theme.widget.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  createState() => WelcomeViewState();
}

class WelcomeViewState extends State<WelcomeView> {
  late bool loading = false;
  late List<Carousel> _carousels = [];

  @override
  void initState() {
    super.initState();
    pullData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeWidget().appBar(context, "টাকা জিতি"),
      drawer: getDrawer(context),
      body: loading ? ThemeWidget().progress() : _buildBody(),
    );
  }

  Widget _buildBody() => SingleChildScrollView(
        child: Column(
          children: [
            CarouselWidget().slider(_carousels),
          ],
        ),
      );

  pullData() async {
    const param = {
      "menuId": 1,
      "pageSize": 10,
    };

    final response = await Api().post("welcome", param);
    if (!response.success) {
      if (!mounted) return;

      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(response.message),
        ),
      );
    } else {
      setState(() {
        _carousels = (response.data["carousels"] as List)
            .map((x) => Carousel.fromJson(x))
            .toList();

        loading = false;
      });
    }
  }
}
