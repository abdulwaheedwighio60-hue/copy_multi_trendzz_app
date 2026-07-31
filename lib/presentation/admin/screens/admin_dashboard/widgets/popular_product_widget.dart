import 'package:flutter/material.dart';

class PopularProductsWidget extends StatelessWidget {
  const PopularProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double titleSize = isDesktop
        ? 20
        : isTablet
        ? 19
        : 18;

    final double productNameSize = isDesktop
        ? 14
        : isTablet
        ? 13
        : 13;

    final double detailSize = isDesktop
        ? 12
        : isTablet
        ? 11
        : 11;

    final double imageSize = isDesktop
        ? 60
        : isTablet
        ? 55
        : 50;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Popular Products",
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(fontSize: detailSize),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          _productItem(
            image:
            "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=300",
            name: "iPhone 15 Pro Max",
            sold: "1,245 Sold",
            revenue: "Rs. 4,250,000",
            rating: 4.9,
            imageSize: imageSize,
            productNameSize: productNameSize,
            detailSize: detailSize,
          ),

          const Divider(),

          _productItem(
            image:
            "https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=300",
            name: "MacBook Pro M4",
            sold: "945 Sold",
            revenue: "Rs. 8,450,000",
            rating: 4.8,
            imageSize: imageSize,
            productNameSize: productNameSize,
            detailSize: detailSize,
          ),

          const Divider(),

          _productItem(
            image:
            "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=300",
            name: "Apple Watch Ultra",
            sold: "650 Sold",
            revenue: "Rs. 2,120,000",
            rating: 4.7,
            imageSize: imageSize,
            productNameSize: productNameSize,
            detailSize: detailSize,
          ),

          const Divider(),

          _productItem(
            image:
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300",
            name: "AirPods Pro",
            sold: "870 Sold",
            revenue: "Rs. 1,450,000",
            rating: 4.9,
            imageSize: imageSize,
            productNameSize: productNameSize,
            detailSize: detailSize,
          ),
        ],
      ),
    );
  }

  Widget _productItem({
    required String image,
    required String name,
    required String sold,
    required String revenue,
    required double rating,
    required double imageSize,
    required double productNameSize,
    required double detailSize,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              image,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: productNameSize,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  sold,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: detailSize,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  revenue,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: detailSize,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Column(
            children: [

              Icon(
                Icons.star,
                color: Colors.orange,
                size: detailSize + 8,
              ),

              const SizedBox(height: 4),

              Text(
                rating.toString(),
                style: TextStyle(
                  fontSize: detailSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}