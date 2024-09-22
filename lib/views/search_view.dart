import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/models/search_model.dart';
import 'package:weather_app/services/search_service.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<SearchModel> searchList = [];
  bool loaded = false;
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          !isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                      searchList = List.filled(
                          7,
                          SearchModel(
                            cityName: 'Loading...',
                            country: 'Loading...',
                            lat: 0,
                            lon: 0,
                          ));
                    });
                  },
                  icon: const Icon(Icons.search),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      searchList = [];
                    });
                  },
                  icon: const Icon(Icons.cancel),
                ),
        ],
        title: isSearching
            ? TextField(
                onSubmitted: (value) async {
                  searchList =
                      await SearchService(Dio()).getSearch(search: value);
                  // i have to call setState to update the UI
                  loaded = true;
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintText: 'Search',
                ),
              )
            : const Text('Search'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Skeletonizer(
          enabled: !loaded,
          child: ListView.builder(
            itemCount: searchList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: () {},
                  title: Text(searchList[index].cityName),
                  subtitle: Text(searchList[index].country),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
