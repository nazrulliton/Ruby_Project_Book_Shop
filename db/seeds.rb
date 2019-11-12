require('pry-byebug')
require_relative( '../models/book.rb' )
require_relative( '../models/supplier.rb' )
require_relative( '../models/stock.rb' )


Stock.delete_all()
Book.delete_all()
Supplier.delete_all()

supplier1 = Supplier.new({
  'name' => "Penguin Books",
  'address' => "20 Artic cross, Noveltry, 12-122"
  });

  supplier2 = Supplier.new({
    'name' => "Wizzard Books",
    'address' => "420 Draghorn Alley, Peru"
    });

    supplier1.save
    supplier2.save


book1 = Book.new({
'name' => "Harry Potter 1",
'description' => "Fantasy tale about an orphan who becomes an wizard, called harry, harry potter.",
'genre' => 'Fantasy'
});

book2 = Book.new({
'name' => "Harry Potter 2",
'description' => "Fantasy tale about an orphan who becomes an wizard, called harry, harry potter.",
'genre' => 'Fantasy'
});

book3 = Book.new({
  'name' => 'Jack Reacher 1',
  'description' => "tale of a military MP solving/getting involved in crimes",
  'genre' => 'action'
  });

book4 = Book.new({
    'name' => 'Jack Reacher 2',
    'description' => "tale of a military MP solving/getting involved in crimes",
    'genre' => 'action'
    });

book5 = Book.new({
  'name' => "Jack Ryan 1",
  'description' => "military manual",
  'genre' => 'action'
  });

book1.save
book2.save
book3.save
book4.save
book5.save

stock1 = Stock.new({
  'book_name' => "Harry Potter 1",
  'quantity' => 50,
  'buying_cost' => 1,
  'selling_price' => 12,
  'book_id' => book1.id,
  'supplier_id' => supplier1.id
  });

stock2 = Stock.new({
    'book_name' => "Harry Potter 2",
    'quantity' => 50,
    'buying_cost' => 1,
    'selling_price' => 10,
    'book_id' => book2.id,
    'supplier_id' => supplier1.id
    });

stock3 = Stock.new({
      'book_name' => "Jack Reacher 1",
      'quantity' => 5,
      'buying_cost' => 4,
      'selling_price' => 7,
      'book_id' => book3.id,
      'supplier_id' => supplier2.id});


stock4 = Stock.new({
        'book_name' => "Jack Reacher 2",
        'quantity' => 13,
        'buying_cost' => 2,
        'selling_price' => 9,
        'book_id' => book4.id,
        'supplier_id' => supplier2.id
        });

stock5 = Stock.new({
          'book_name' => "Jack Ryan 1",
          'quantity' => 14,
          'buying_cost' => 5,
          'selling_price' => 9,
          'book_id' => book5.id,
          'supplier_id' => supplier2.id
          });

stock1.save
stock2.save
stock3.save
stock4.save
stock5.save

binding.pry
nil
