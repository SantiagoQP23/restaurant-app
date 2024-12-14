import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/core/websockets/socket_service.dart';
import 'package:restaurant_app/features/bills/presentation/widgets/select_customer_screen.dart';
import 'package:restaurant_app/features/orders/domain/entities/bill.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/dto/update_bill_dto.dart';
import 'package:restaurant_app/features/shared/infraestructure/models/socket_event_mapper.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/toast_service.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/toast_service_imp.dart';
import 'package:restaurant_app/features/shared/providers/socket_provider.dart';
import 'package:restaurant_app/features/shared/widgets/custom_text_form_field.dart';

import 'package:restaurant_app/features/orders/presentation/providers/bills_provider.dart';

class PaymentDetailsScreen extends ConsumerStatefulWidget {
  final Bill bill;
  const PaymentDetailsScreen({super.key, required this.bill});

  @override
  ConsumerState<PaymentDetailsScreen> createState() =>
      _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends ConsumerState<PaymentDetailsScreen> {
  late SocketService socketService;
  late double discount;
  late double receivedAmount;

  payBill(UpdateBillDTO updateBillDTO) {
    final toast = ToastServiceImpl();
    socketService.socket.emitWithAck(
        SocketEvents.updateBill, updateBillDTO.toJson(), ack: (data) {
      final socketResponse = SocketEventMapper.fromJson(data);
      if (socketResponse.ok) {
        toast.show(socketResponse.msg, ToastType.success);
      } else {
        toast.show(socketResponse.msg, ToastType.error);
      }
    });
    // widget.updateBill(bill);
  }

  @override
  void initState() {
    super.initState();
    socketService = ref.read(socketInstanceProvider);
    discount = ref.read(discountBillProvider);
    receivedAmount = ref.read(receivedAmountBillProvider);
  }

  @override
  Widget build(BuildContext context) {
    final paymentMethod = ref.watch(paymentMethodBillProvider);
    final customer = ref.watch(customerBillProvider);
    final discount = ref.watch(discountBillProvider);
    final receivedAmount = ref.watch(receivedAmountBillProvider);
    final cashRegister = ref.watch(cashRegisterBillProvider);
    // final activeBill = ref.watch(activeBillProvider);
    // final bill = bill;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('Payment details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('Payment method'),
                subtitle: Text(paymentMethod.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                // onTap: () {
                //   Navigator.of(context).pop();
                // },
              ),
              const SizedBox(height: 10),
              Container(
                child: customer == null
                    ? const Card(
                        child: ListTile(
                          title: Text('Final customer',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      )
                    : Card(
                        child: ListTile(
                          title: Text(
                              '${customer.person.name} ${customer.person.lastName}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            customer.person.identification?.number ?? '',
                          ),
                          // onTap: () {
                          //   Navigator.of(context).pop();
                          // },
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              const Text('Total to pay', style: TextStyle(fontSize: 16)),
              Text('\$${widget.bill.total - discount}',
                  style: const TextStyle(
                      fontSize: 36, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              const Text('Change', style: TextStyle(fontSize: 16)),
              Text('\$${receivedAmount - widget.bill.total}',
                  style: const TextStyle(
                      fontSize: 36, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              final updateBillDTO = widget.bill.toUpdateDTO(
                  paymentMethod: paymentMethod,
                  customer: customer,
                  discount: discount,
                  cashRegister: cashRegister,
                  receivedAmount: receivedAmount);
              payBill(updateBillDTO);
            },
            child: const Text('Continue'),
          ),
        ),
      ),
    );
  }
}
