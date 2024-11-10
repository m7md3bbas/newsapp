import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/serviecs/news_services.dart';
import 'package:newsapp/views/widget/Custom_list_view.dart';
import 'package:newsapp/views/widget/news_list_view_builder.dart';

class HomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isVisible = ValueNotifier(false);

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  HomePage({super.key}) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 200) {
        _isVisible.value = true; // Show button
      } else {
        _isVisible.value = false; // Hide button
      }
    });
  }

  Future<void> _refreshData(BuildContext context) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final newsResponse = await NewsServices(dio: Dio()).getTopHeadlinesNews(category: "general");

      if (newsResponse.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Center(child: Text('Everything is up to date!',style: TextStyle(color: Colors.black),),),backgroundColor: Colors.white,),
        );
      }
    } catch (error) {
      // Handle error case
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News"),
            Text(
              "Cloud",
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () => _refreshData(context),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: CategoryListView(),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),
                const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "General News",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),
                const NewsListViewbuilder(
                  category: "general",
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _isVisible,
            builder: (context, isVisible, child) {
              return Positioned(
                bottom: 16.0,
                right: 16.0,
                child: isVisible
                    ? FloatingActionButton(
                        onPressed: scrollToTop,
                        child: const Icon(Icons.arrow_upward),
                      )
                    : Container(), // Hide button if not visible
              );
            },
          ),
        ],
      ),
    );
  }
}
