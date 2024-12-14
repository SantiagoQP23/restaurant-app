import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/features/bills/presentation/widgets/select_customer_screen.dart';
import 'package:restaurant_app/features/finances/presentation/providers/cash_register_providers.dart';
import 'package:restaurant_app/features/orders/domain/entities/bill.dart';
import 'package:restaurant_app/features/orders/presentation/providers/bills_provider.dart';
import 'package:restaurant_app/features/shared/widgets/custom_text_form_field.dart';

class SelectPaymentMethodScreen extends ConsumerStatefulWidget {
  final Bill bill;
  const SelectPaymentMethodScreen({super.key, required this.bill});

  @override
  ConsumerState<SelectPaymentMethodScreen> createState() =>
      SelectPaymentMethodScreenState();
}

class SelectPaymentMethodScreenState
    extends ConsumerState<SelectPaymentMethodScreen> {
  List<double> optionsAmountReceived = [5, 10, 15, 20, 30, 40, 50, 100];
  final TextEditingController _amountReceivedController =
      TextEditingController();
  double amountReceived = 0;

  changePaymentMethod(PaymentMethod paymentMethod) {
    ref
        .read(paymentMethodBillProvider.notifier)
        .setPaymentMethod(paymentMethod);
  }

  updateAmountReceived(String value) {
    setState(() {
      amountReceived = double.parse(value);
      ref
          .read(receivedAmountBillProvider.notifier)
          .setReceivedAmount(amountReceived);
    });
  }

  @override
  void initState() {
    super.initState();
    optionsAmountReceived = [widget.bill.total, ...optionsAmountReceived];
  }

  @override
  Widget build(BuildContext context) {
    final paymentMethod = ref.watch(paymentMethodBillProvider);
    final cashRegistersState = ref.watch(openCashRegistersProvider);
    final cashRegisterBill = ref.watch(cashRegisterBillProvider);
    final bill = widget.bill;
    final change = amountReceived - bill.total;
    final isValid = paymentMethod == PaymentMethod.cash &&
        (cashRegisterBill == null || amountReceived < bill.total);
    return Scaffold(
      appBar: AppBar(
          // title: Text('Select payment method'),
          ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('Select payment method',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: paymentMethod == PaymentMethod.cash
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: InkWell(
                        onTap: () => changePaymentMethod(PaymentMethod.cash),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 100,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.attach_money),
                              SizedBox(height: 10),
                              Text('Cash'),
                            ],
                          ),
                        ),
                      )),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: paymentMethod == PaymentMethod.transfer
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: InkWell(
                        onTap: () =>
                            changePaymentMethod(PaymentMethod.transfer),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 100,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.credit_card),
                              SizedBox(height: 10),
                              Text('Transfer'),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                  child: paymentMethod != PaymentMethod.cash
                      ? const SizedBox()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Select cash register',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            cashRegistersState.when(
                              data: (cashRegisters) => Row(
                                children: [
                                  for (var cashRegister in cashRegisters)
                                    Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                            color: cashRegister.id ==
                                                    cashRegisterBill?.id
                                                ? Colors.blue
                                                : Colors.transparent,
                                            width: 2,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            ref
                                                .read(cashRegisterBillProvider
                                                    .notifier)
                                                .setCashRegister(cashRegister);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            width: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Icon(Icons.monitor),
                                                const SizedBox(height: 10),
                                                Text(
                                                    'Cash register ${cashRegister.id}'),
                                              ],
                                            ),
                                          ),
                                        )),
                                ],
                              ),
                              error: (error, stackTrace) =>
                                  Text('Error: $error $stackTrace'),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text('Payment details',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _amountReceivedController,
                              decoration: const InputDecoration(
                                labelText: 'Amount received',
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) => updateAmountReceived(value),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: optionsAmountReceived.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: index ==
                                              optionsAmountReceived.length - 1
                                          ? const EdgeInsets.fromLTRB(
                                              8, 0, 8, 0)
                                          : const EdgeInsets.only(left: 8),
                                      child: ChoiceChip(
                                          selected: amountReceived ==
                                              optionsAmountReceived[index],
                                          onSelected: (selected) {
                                            setState(() {
                                              amountReceived =
                                                  optionsAmountReceived[index];
                                              _amountReceivedController.text =
                                                  amountReceived.toString();
                                              ref
                                                  .read(
                                                      receivedAmountBillProvider
                                                          .notifier)
                                                  .setReceivedAmount(
                                                      amountReceived);
                                            });
                                          },
                                          label: Text(
                                              '\$ ${optionsAmountReceived[index]}')),
                                    );
                                  }),
                            ),
                            if (amountReceived < widget.bill.total)
                              const Text('Amount received is less than total',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red)),
                            const SizedBox(height: 20),
                            Container(
                              child: bill.total > amountReceived
                                  ? const SizedBox()
                                  : Column(
                                      children: [
                                        const Text('Change',
                                            style: TextStyle(fontSize: 16)),
                                        Text('\$ ${change.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                                fontSize: 36,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                            )
                          ],
                        ))
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isValid
                ? null
                : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return SelectCustomerScreen(bill: bill);
                        },
                      ),
                    );
                  },
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Colors.transparent,
              disabledForegroundColor: Colors.grey,
            ),
            child: const Text('Continue'),
          ),
        ),
      ),
    );
  }
}
