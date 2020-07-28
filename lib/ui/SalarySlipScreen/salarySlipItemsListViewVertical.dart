import 'package:ess_application/bloc/salarySlipBloc/salarySlipBloc.dart';
import 'package:ess_application/bloc/salarySlipBloc/salarySlipEvent.dart';
import 'package:ess_application/bloc/salarySlipBloc/salarySlipState.dart';
import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/repository/salalrySlipRepository.dart';
import 'package:ess_application/ui/SalarySlipScreen/salarySlipListViewVerticalItemCard.dart';
import 'package:ess_application/ui/commonWidgets/bottomLoader.dart';
import 'package:ess_application/ui/commonWidgets/commonWidgets.dart';
import 'package:ess_application/ui/commonWidgets/loadingIndicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalarySlipItemsListViewVericalMain extends StatelessWidget {
  SalarySlipRepository salarySlipRepository = new SalarySlipRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pieChartBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.drawerBackgroundColor2,
        elevation: 0.0,
        title: Text(
          "Salary Slips",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.white),
        actions: [],
      ),
      body: BlocProvider(
        create: (context) =>
            SalarySlipBloc(salarySlipRepository: salarySlipRepository)
              ..add(SalarySlipFetched()),
        child: SalarySlipItemsListViewVerical(
          context: context,
        ),
      ),
    );

    // home:
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('Posts'),
    //   ),
    //   body: BlocProvider(
    //     create: (context) =>
    //         SalarySlipBloc(salarySlipRepository: salarySlipRepository)
    //           ..add(SalarySlipFetched()),
    //     child: SalarySlipItemsListViewVerical(),
    //   ),
    // );
  }
}

class SalarySlipItemsListViewVerical extends StatefulWidget {
  BuildContext context;
  SalarySlipItemsListViewVerical({this.context});
  @override
  _SalarySlipItemsListViewVericalState createState() =>
      _SalarySlipItemsListViewVericalState();
}

class _SalarySlipItemsListViewVericalState
    extends State<SalarySlipItemsListViewVerical>
    with TickerProviderStateMixin {
  List category = [
    1,
    1,
    1,
    1,
    1,
    1,
    11,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
  ];

  AnimationController animationController;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  SalarySlipBloc _salarySlipBloc;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    _scrollController.addListener(_onScroll);
    _salarySlipBloc = BlocProvider.of<SalarySlipBloc>(context);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= _scrollThreshold) {
      _salarySlipBloc.add(SalarySlipFetched());
    }
  }

  @override
  void dispose() {
    //dispossing animation controller to controll ticker dispose issues
    animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalarySlipBloc, SalarySlipState>(
      builder: (BuildContext context, SalarySlipState state) {
        if (state is SalarySlipInitialState) {
          return Center(
            child: LoadingIndicator(),
          );
        }

        if (state is SalarySlipFailureState) {
          return Center(
            child: Column(
              children: <Widget>[
                Text('failed to fetch Salary Slip'),
              ],
            ),
          );
        }

        if (state is SalarySlipSuccessState) {
          if (state.salarySlipList.isEmpty) {
            return Center(
              child: Text('no items'),
            );
          }

          return ListView.builder(
              itemCount: state.hasReachedMax
                  ? state.salarySlipList.length
                  : state.salarySlipList.length + 1,
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final int count = state.salarySlipList.length > 20
                    ? 10
                    : state.salarySlipList.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animationController,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                animationController.forward();

                return index >= state.salarySlipList.length
                    ? Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: CommonWidgets.progressIndicator)
                    : SalarySlipListViewVerticalItemCard(
                        animation: animation,
                        animationController: animationController, salarySlip:state.salarySlipList[index]
                      );
              });
        }
        return Center(
          child: Text('no items'),
        );
      },
    );

    // return Container(
    //   child: Scaffold(
    //     backgroundColor: AppTheme.pieChartBackgroundColor,
    //     appBar: AppBar(
    //       backgroundColor: AppTheme.drawerBackgroundColor2,
    //       elevation: 0.0,
    //       title: Text(
    //         "Salary Slips",
    //         style: Theme.of(context)
    //             .textTheme
    //             .title
    //             .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
    //       ),
    //       centerTitle: true,
    //       iconTheme: new IconThemeData(color: Colors.white),
    //       actions: [],
    //     ),
    //     body: _buildBody(context),
    //   ),
    // );
  }

  // Widget _buildBody(BuildContext context, SalarySlipState state) {
  //   return Container(
  //     height: MediaQuery.of(context).size.height,
  //     child: ListView.builder(
  //         itemCount:
  //             state.hasReachedMax ? state.posts.length : state.posts.length + 1,
  //         controller: _scrollController,
  //         scrollDirection: Axis.vertical,
  //         itemBuilder: (BuildContext context, int index) {
  //           final int count = category.length > 20 ? 10 : category.length;
  //           final Animation<double> animation =
  //               Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //                   parent: animationController,
  //                   curve: Interval((1 / count) * index, 1.0,
  //                       curve: Curves.fastOutSlowIn)));
  //           animationController.forward();

  //           return SalarySlipListViewVerticalItemCard(
  //             animation: animation,
  //             animationController: animationController,
  //           );
  //         }),
  //   );
  // }
}
