import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaigo_test/application/home/home_bloc.dart';
import 'package:zaigo_test/presentation/home_screen/sidebar.dart';

import '../../core/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(const FetchLawyerDetails());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lawyers'),
        actions: const [],
      ),
      drawer: SideBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final  lawyer = state.lawyerDetails[index];
                if(state.lawyerDetails.isEmpty){
                  return const Center(child: Text('No lawyers found'),);
                }
                return Lawyers(
                  lawyerRanking: lawyer.ranking,
                  lawyerBio:
                      lawyer.bio,
                  lawyerImgUrl:
                      lawyer.profilePicture,
                  lawyerName: state.lawyerDetails[index].name,
                  lawyerAddress: lawyer.address,
                  lawyerIndex: index,
                  lawyerId: lawyer.id,
                  lawyerFOE: lawyer.fieldOfExpertise,
                );
              },
              itemCount: state.lawyerDetails.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          },
        ),
      ),
    );
  }
}

class Lawyers extends StatelessWidget {
  const Lawyers({
    super.key,
    required this.lawyerName,
    required this.lawyerAddress,
    required this.lawyerBio,
    required this.lawyerRanking,
    required this.lawyerImgUrl,
    required this.lawyerIndex,
    required this.lawyerId,
    required this.lawyerFOE,
  });
  final String lawyerName;
  final String lawyerAddress;
  final String lawyerFOE;
  final String lawyerBio;
  final String lawyerRanking;
  final String lawyerImgUrl;
  final int lawyerIndex;
  final int lawyerId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kWidth,
            SizedBox(
              width: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lawyerName, style: lawyerNameText),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(lawyerFOE, style: lawyerFOEText),
                      Text(
                        'Rank : $lawyerRanking',
                        style: lawyerFOEText,
                      ),
                    ],
                  ),
                  kHeight,
                  Text(
                    lawyerBio,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  kHeight,
                ],
              ),
            ),
            kWidth,
            Image(
              image: NetworkImage(lawyerImgUrl),
              height: 150,
              width: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ],
    );
  }
}

class LawyerCard extends StatelessWidget {
  const LawyerCard({
    super.key,
    // required this.lawyer,
  });

  // final LawyerModel lawyer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => ScreenDetails(lawyer: lawyer),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[100],
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const ImageWidget(
                  image:
                      'https://www.collinsdictionary.com/images/full/lawyer_174092276.jpg'),
              const Details(),
            ],
          ),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    super.key,
    // required this.lawyer,
  });

  // final LawyerModel lawyer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          // lawyer.
          'name',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          // lawyer.
          'fieldOfExpertise',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.contain,
        ),
        color: Colors.white,
      ),
    );
  }
}
