

part of '../mypage.dart';

class CartShopping extends StatelessWidget {
  const CartShopping({
    super.key,
    required this.id,
    required this.picture,
    required this.nameCard,
    required this.price,
    required this.quantity,
    required this.index,
  });
  final int id;
  final String picture;
  final String nameCard;
  final String price;
  final String quantity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Image.asset(
                picture,
                fit: BoxFit.cover,
              ),
              // color: Colors.green,
            )),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 70,
                    child: Container(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      height: double.maxFinite,
                      width: double.infinity,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('ชื่อสินค้า : $nameCard'),
                              Text('ราคา : $price'),
                              // const Text('รายละเอียด : '),
                            ],
                          ),
                           Column(
                            children: [   Text('จำนวนคงเหลือ : $quantity ชิ้น'),],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: SizedBox(
                      height: double.maxFinite,
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Add to Cart',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () => context.read<Blocs>().add(addToCart(index, id)),
                                icon: const Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () => context.read<Blocs>().add(removeToCart(index, id)),
                                icon: const Icon(
                                  Icons.remove_circle_outline_outlined,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
