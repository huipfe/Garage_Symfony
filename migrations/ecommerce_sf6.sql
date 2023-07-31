Table users as U {
  id int [pk, increment]
  email varchar [unique]
  password varchar
  lastname varchar
  firstname varchar
  address varchar
  zipcode varchar
  city varchar
  roles json
  created_at datetime [default: `now()`]
}

Table products as P {
  id int [pk, increment]
  name varchar
  slug varchar
  description text
  price int [note: 'Rounded integer value (price*100)']
  stock int
  categories_id int
  created_at datetime [default: `now()`]
}

Table images as I{
  id int [pk, increment]
  name varchar
  products_id int
}


Table categories as CA {
  id int [pk, increment]
  name varchar
  slug varchar
  category_order int
  parent_id int
}

Table orders as O {
  id int [pk, increment]
  reference varchar [unique]
  coupons_id int
  users_id int
  created_at datetime [default: `now()`]
}

Table orders_details as OD{
  orders_id int [pk]
  products_id int [pk]
  quantity int
  price int
}

Table coupons as CO{
  id int [pk, increment]
  code varchar unique
  description text
  coupons_types_id int
  discount int
  max_usage int
  validity datetime
  is_valid boolean
  created_at datetime
}

Table coupons_types as CT{
  id int [pk, increment]
  name varchar
}

Ref: CA.id < P.categories_id
Ref: P.id < I.products_id
Ref: CA.id < CA.parent_id
Ref: U.id < O.users_id
Ref: O.id < OD.orders_id
Ref: P.id < OD.products_id
Ref: CO.id < O.coupons_id
Ref: CT.id < CO.coupons_types_id
