# Chocolate Shop

## Overview

This app tests different promotions for different flavors of chocolate. The different promotions are as follows. When a shopper trades the required number of:
  - `milk` wrappers they will receive one complimentary `milk` chocolate
    and one complimentary `sugar free` chocolate.
  - `white` wrappers they will receive one complimentary `white`
    chocolate and one complimentary `sugar free` chocolate.
  - `sugar free` wrappers they will receive one complimentary `sugar
    free` chocolate and one complimentary `dark` chocolate.
  - `dark` wrappers they will receive one complimentary `dark`
    chocolate.

### Setup

To run this project, perform the following:
  1. `cd` into the project's directory
  2. From the root level run `rake all`
     - This rake command will run all unit tests and output the redemptions file
  3. Individual test files can be ran with `ruby test/file_name.rb`
  4. The runner file can be ran with `ruby lib/runner.rb`

### Design
The app is split into three separate classes:
* OrdersReader - read the csv file and create an order object with each row
* Order- Compute promotional calculations
* OrdersWriter - write data to csv file with correct format

### Dependencies

* This application uses the built in Ruby CSV library and minitest for its testing library.
* This app was created with ruby 2.3.1

### Discussion
  A main design challenge for me was balancing singe responsibility classes with simplicity. In a previous iteration I created an IncomingOrders class that iterated through each row of the csv file and created an order object. I can see this class being useful if the data in the csv file was inconsistent and needed to be standardized. For simplicity sake, I removed the class and gave that responsibility to the OrdersReader class through the csv.foreach method. Along those same lines, I previously had an OutgoingOrder class. This class closely resembled a data class so I was able to remove it and give the responsibility to built in ruby methods. For example, in a previous iteration while writing my csv file I was calling `#{outgoing_order.milk}`. I removed the outgoing order class and am now using ruby's built in hash methods `#{order[:milk]}` to produce the same output.

### Contributors:
* [Brett Schwartz](https://github.com/bschwartz10)
