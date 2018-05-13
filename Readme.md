How to run: 
===========
Assumimg you have ruby installed type the following in a bash terminal.

```$ bundle install```
```$ ./run_discount -c BOX8LOVE -i 7 -o output```

** Command line arguments
 -c coupon code
 -i outlet id
 -o filename (if you want to save the output in the file)

** Run tests
```rake test```

** Assumptions
Since the cart items do not have any relationship between them it was assumed that 
the cart has only two kinds of products at any given point of time to simplify Bogo
discount calculation. 

