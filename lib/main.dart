import 'package:bloc_api_call/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ApiBloc(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiBloc apiBloc = BlocProvider.of<ApiBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc API Call')),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          if (state is ApiLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ApiFail) {
            return Center(
              child: Text(state.errorMsg),
            );
          } else if (state is ApiSuccess) {
            return Center(
              child: Text(
                state.data,
                style: const TextStyle(fontSize: 30),
              ),
            );
          }
          return Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () => apiBloc.add(GetDataEvent('xxx')),
              child: const Text('Get Data'),
            ),
          );
        },
      ),
    );
  }
}
