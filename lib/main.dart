import 'package:darkmode/bloc/app_theme_bloc.dart';
import 'package:darkmode/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppThemeBloc>(
        create: (context) => AppThemeBloc(),
        child: BlocBuilder<AppThemeBloc, AppThemeState>(
            builder: ((context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.theme,
            home: const MyHomePage(title: 'Bloc Dark'),
          );
        })));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isThemeSwitch = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          BlocBuilder<AppThemeBloc, AppThemeState>(builder: (context, state) {
            return Switch(
                value: _isThemeSwitch,
                onChanged: (val) {
                  _isThemeSwitch = val;
                  if (_isThemeSwitch) {
                    BlocProvider.of<AppThemeBloc>(context).add(AppThemeEvent(
                      theme: AppTheme.darkTheme,
                      isTrue: _isThemeSwitch,
                    ));
                  } else {
                    BlocProvider.of<AppThemeBloc>(context).add(AppThemeEvent(
                        theme: AppTheme.lightTheme, isTrue: _isThemeSwitch));
                  }
                });
          })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
