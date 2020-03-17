# Stock Management Project

This is the first project I made in CodeClan, after four weeks of learning on Ruby, Sinatra framework and PSQL. I had 5 days to create an app for a book shop to manage their inventory, the app should be able to add/edit books and publishers to inventory list.

## Project Brief

The project must be built using only:

* HTML / CSS
* Ruby
* Sinatra
* PostgreSQL and the PG gem

### Shop Inventory

Build an app which allows a shopkeeper to track their shop's inventory. This is not an app which the customer will see, it is an admin/management app for the shop workers.

#### MVP

* The inventory should track individual products, including a name, description, stock quantity, buying cost, and selling price.
* The inventory should track manufacturers, including a name and any other appropriate details.
* The shop can sell anything you like, but you should be able to create, edit and delete manufacturers and products separately.
  * This might mean that it makes more sense for a car shop to track makes and models of cars. Or a bookstore might sell books by author, or by publisher, and not by manufacturer. You are free to name classes and tables as appropriate to your project.
* Show an inventory page, listing all the details for all the products in stock in a single view.
* As well as showing stock quantity as a number, the app should visually highlight "low stock" and "out of stock" items to the user.



### Application Set up


Run the App

```
ruby app.db
```

Populate the database
```
ruby db/seeds.db
```

End with an example of getting some data out of the system or using it for a little demo
