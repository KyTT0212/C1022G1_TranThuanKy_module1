package model;

public class Product {
        private int id;
        private String name;
        private String price;
        private String quantity; //số lượng
        private String status;
//        private String producer; //nhà sản xuất

    public Product(String name, String price, String quantity, String status) {
    }

    public Product(int id, String name, String price, String quantity, String status) {
            this.id = id;
            this.name = name;
            this.price = price;
            this.quantity = quantity;
            this.status = status;
//            this.producer = producer;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getPrice() {
            return price;
        }

        public void setPrice(String price) {
            this.price = price;
        }

        public String getQuantity() {
            return quantity;
        }

        public void setQuantity(String quantity) {
            this.quantity = quantity;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String HSD) {
            this.status = status;
        }
//
//        public String getProducer() {
//            return producer;
//        }
//
//        public void setProducer(String producer) {
//            this.producer = producer;
//        }

    }
