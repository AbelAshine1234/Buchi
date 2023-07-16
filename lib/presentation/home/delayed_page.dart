import 'package:buchi/components/different/bottom_navigation.dart';
import 'package:buchi/components/different/custom_loadin_widget.dart';
import 'package:buchi/pets/bloc/pets_bloc%20state.dart';
import 'package:buchi/pets/bloc/pets_bloc.dart';
import 'package:buchi/presentation/initial/brand_page.dart';
import 'package:buchi/presentation/pets/ShowPets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pets/bloc/pets_bloc event.dart';

class DelayedPage extends StatefulWidget {
  @override
  _DelayedPageState createState() => _DelayedPageState();
}

class _DelayedPageState extends State<DelayedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ActualPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const BrandPage();
  }
}

class ActualPage extends StatelessWidget {
  const ActualPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PetBloc, PetState>(
        builder: (context, state) {
          if (state is PetEmpty) {
            // Dispatch an event to the bloc to trigger a state update
            BlocProvider.of<PetBloc>(context).add(GetAllPetsEvent());
            return const Text("data");
          } else if (state is PetLoading) {
            return CustomLoadingWidget();
          } else if (state is PetLoaded) {
            return const CustomBottomNavigation();
          } else if (state is PetLoaded) {
            return const CustomBottomNavigation();
          } else if (state is PetError) {
            return Text(state.message);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
