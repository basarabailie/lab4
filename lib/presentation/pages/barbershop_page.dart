import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../data/repositories/barbershop_repository_impl.dart';
import '../../domain/usecases/get_barbershops.dart';
import '../bloc/barbershop_bloc.dart';
import '../widgets/barbershop_section.dart';

class BarbershopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BarbershopBloc(
        GetBarbershopsUseCase(
          BarbershopRepositoryImpl(),
        ),
      )..add(LoadBarbershopsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("BARBERSHOP", style: TextStyle(fontWeight: FontWeight.bold)),
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.deepPurple,
        ),
        body: BlocBuilder<BarbershopBloc, BarbershopState>(
          builder: (context, state) {
            if (state is BarbershopLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is BarbershopLoaded) {
              return ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  Image.asset('assets/banner.png',
                      height: 150, fit: BoxFit.cover),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      elevation: 0,
                    ),
                    child: Text(
                      "Booking Now",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SearchBar(),
                  SizedBox(height: 24.0),
                  BarbershopSection(
                    title: 'Nearest Barbershop',
                    barbershops: state.nearestBarbershops,
                  ),
                  SizedBox(height: 24.0),
                  BarbershopSection(
                    title: 'Most Recommended',
                    barbershops: state.recommendedBarbershops,
                  ),
                ],
              );
            } else if (state is BarbershopError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
