 Item.destroy_all
 User.destroy_all

 users = [
 {
   email: "a@a.com",
   created_at:"",
   updated_at:"",
   username:"Giac",
   location:"Barcelona",
   password:"123456",
   phone:"+34 553 555 222"
 },
 {
   email: "james@gmail.com",
   created_at:"",
   updated_at:"",
   username:"James",
   location:"Barcelona",
   password:"11111111111",
   phone:"+34 553 555 222"
 },
 {
   email: "peter@gmail.com",
   created_at:"",
   updated_at:"",
   username:"Peter",
   location:"Sao Paulo",
   password:"11111111111",
   phone:"+34 553 555 222"
 },
 {
   email: "ruby@gmail.com",
   created_at:"",
   updated_at:"",
   username:"Ruby",
   location:"Hong Kong",
   password:"11111111111",
   phone:"+34 553 555 222"
 },
 {
   email: "yu@gmail.com",
   created_at:"",
   updated_at:"",
   username:"Yu",
   location:"Beijing",
   password:"11111111111",
   phone:"+34 553 555 222"
 },
 {
   email: "arata@gmail.com",
   created_at:"",
   updated_at:"",
   username:"Arata",
   location:"Tokyo",
   password:"11111111111",
   phone:"+34 553 555 222"
 },
 ]
 users.each { |params| User.create!(params) }

 items = [
 {
   user: User.all.sample,
   name: "Wallet",
   description: "Nike Wallet",
   code: "67TygB",
   reward: "35.00",
   contact: ""
 },
 {
   user: User.all.sample,
   name: "Pen",
   description: "Mont Blanc Silver Pen",
   code: "990UjN",
   reward: "",
   contact: ""
 },
 {
   user: User.all.sample,
   name: "Backpack",
   description: "Black Swiss Bag",
   code: "43RGtk",
   reward: "10.00",
   contact: ""
 },
 {
   user: User.all.sample,
   name: "Lenovo Notebook",
   description: "R350",
   code: "AAWeRt",
   reward: "200.00",
   contact: ""
 },
 {
   user: User.all.sample,
   name: "Samsonite",
   description: "luggage",
   code: "HgBN2m",
   reward: "25.00",
   contact: ""
 },
 ]
 items.each { |params| Item.create!(params) }
