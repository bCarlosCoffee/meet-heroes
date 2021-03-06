import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meet_heroes/app/app_routes.dart';
import 'package:meet_heroes/app/shared/widgets/character_detail.dart';
import 'search_getx_controller.dart';

class SearchPage extends StatelessWidget {
  final _controller;

  const SearchPage(this._controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: Colors.black,
              style: const TextStyle(
                fontSize: 12,
              ),
              decoration: const InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Procurar...',
                hintStyle: const TextStyle(
                  fontSize: 12,
                ),
              ),
              onChanged: _controller.changeSearch,
              onSubmitted: _controller.search,
            ),
          ),
          const Divider(),
          Expanded(
            child: GetBuilder<SearchGetxController>(
              builder: (_) {
                if (_controller.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (_controller.searchText.isEmpty ||
                    _controller.resultSearch.isEmpty) {
                  return Container();
                }

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          '${_controller.resultSearch.length} Resultados para ${_controller.searchText}',
                        ),
                      ),
                      Column(
                        children: List.generate(
                          _controller.resultSearch.length,
                          (characterID) {
                            return Container(
                              width: Get.width * 0.9,
                              child: characterDetail(
                                _controller.resultSearch[characterID],
                                widthInfinity: true,
                                onTap: () {
                                  Get.toNamed(
                                    AppRoutes.DETAIL_ROUTE,
                                    arguments:
                                        _controller.resultSearch[characterID],
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
