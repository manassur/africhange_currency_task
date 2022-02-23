import 'package:africhange_currency_task/data/app_colors.dart';
import 'package:africhange_currency_task/data/app_enums.dart';
import 'package:africhange_currency_task/data/app_icons.dart';
import 'package:africhange_currency_task/data/app_texts.dart';
import 'package:africhange_currency_task/view_models/rates_list_view_model.dart';
import 'package:africhange_currency_task/widgets/currency_box.dart';
import 'package:africhange_currency_task/widgets/graph_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  TextEditingController textController = TextEditingController();
  RateListViewModel? viewModel;
  @override
  void initState() {
    super.initState();

    // fetch the available exchange rates
  viewModel =  Provider.of<RateListViewModel>(context, listen: false);
  textController.text = viewModel!.getConversionQuery.toString();
   viewModel!.fetchRates();

  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RateListViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        // hamburger menu icon
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            AppIcons.menu,
            color: AppColors.primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: AppColors.primaryColor,
              ),
              child: Text(
                AppTexts.signUp,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //currency elements
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // some space
                  const SizedBox(
                    height: 10,
                  ),
                  // page title
                  RichText(
                    text: TextSpan(
                        text: AppTexts.currencyCalculator,
                        style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  // some space
                  const SizedBox(
                    height: 30,
                  ),
                  // input field 1
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: textController,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            onChanged: (value){
                              setState(() {

                              });
                            },
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                            decoration: const InputDecoration(
                              isDense: true,
                              hintStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          vm.getBaseCurrency,
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  // some space
                  const SizedBox(
                    height: 20,
                  ),
                  // input field 2
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(right: 20,left:15),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      children: [
                        Expanded(
                          child:   Text(
                            vm.getConversionResult.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          vm.getConvertingCurrency,
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  // some space
                  const SizedBox(
                    height: 40,
                  ),
                  // currency options row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // current currency
                      const Expanded(child: CurrencyBoxWidget(type: CurrencySelectionType.base,)),
                      const SizedBox(
                        width: 15,
                      ),
                      // to
                      SvgPicture.asset(
                        AppIcons.convertIcon,
                        color: Colors.grey.shade600,
                        width: 24,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      // converting currency
                      const Expanded(child: CurrencyBoxWidget(
                         type: CurrencySelectionType.converting
                      )),
                    ],
                  ),
                  // some space
                  const SizedBox(
                    height: 40,
                  ),
                  // convert button
                  MaterialButton(
                    minWidth: double.infinity,
                    elevation: 0,
                    height: 55,

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    color: textController.text.isNotEmpty? AppColors.primaryColor:Colors.grey.withOpacity(0.4),
                    child: Text(AppTexts.convert,
                        style:
                        TextStyle(fontSize: 19.0, color: Colors.white)),
                    onPressed: textController.text.isNotEmpty?() {
                      // get the inputed text from the view
                      // and further perform the calculations
                      vm.setConversionQuery(textController.text);
                      vm.convertCurrency();
                    }:(){}
                  ),
                  // some space
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center ,
                        children: [
                          Text(AppTexts.midMarket,
                              style:TextStyle(color: AppColors.secondaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w500)),

                          SizedBox(width:10),

                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey.shade300,
                            child:SvgPicture.asset(AppIcons.infoIcon,width:24,height: 24,)
                          )
                        ],
                      )),



                ],

              ),
            ),
            // graph elements
             GraphTabWidget()
          ],
        ),
      ),
    );
  }
}
