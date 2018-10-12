require 'pry'

class CashRegister

  attr_accessor :discount, :items, :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    new_items = []
    quantity.times {
      new_items << {title: title, price: price}
    }
    if @items.size == 0
      @items = new_items
    else
      new_items.each {|item| @items << item}
    end
    @total += (price * quantity)
  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0
    discount = @discount.to_f
    @total *= (1 - discount/100)
    "After the discount, the total comes to $#{total.to_i}."
  end

  def items
    @items.map{|item| item[:title]}
  end

  def void_last_transaction
    @total -= last_item[:price]
    @items.pop
  end

end
