Product.create!(name: "商品A", price:1000 , stock_quantity:1100 )
Product.create!(name: "商品B", price:15000 , stock_quantity:100 )
Product.create!(name: "商品C", price:2000 , stock_quantity:50 )

User.create! (
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)

User.create! (
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false
)
