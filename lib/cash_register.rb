
require 'pry'

class CashRegister
    
    attr_accessor :total, :discount, :cart

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def add_item(title, price, quantity=1)
    
        cart_hash = {}
        cart_hash[:item] = title
        cart_hash[:price] = price
        cart_hash[:quantity] = quantity 
        @cart << cart_hash
        @total += price * quantity
    end

    def apply_discount
        if @discount > 0
            @total = @total - (@total * (@discount/100.0))
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        item_cart = []
        @cart.each do |item|
            item[:quantity].times do
                item_cart << item[:item]
            end
        end
        item_cart
    end

    def void_last_transaction
        last_item = @cart.pop
        void = last_item[:price] * last_item[:quantity]
        @total -= void
    end

end