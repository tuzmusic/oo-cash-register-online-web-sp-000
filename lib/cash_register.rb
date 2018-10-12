require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    if @items.size == 0
      @items = [title]
    else
      quantity.times { @items << title }
    end
    @total += (price * quantity)
    @last_item = {title: title, price: price.to_f}
  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0
    discount = @discount.to_f
    @total *= (1 - discount/100)
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= last_item[:price]
    @items.pop
  end

end
