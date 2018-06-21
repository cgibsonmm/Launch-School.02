class Store
  attr_reader :items_in_stock
  attr_writer :employee

  def initialize(owner, name)
    @created_at = Time.now
    @owner = owner
    @name = name
    @employes = []
    @items_in_stock = []
  end

  def add_item(item)
    @items_in_stock << item
  end

  def show_items_instock
    items_in_stock.each do |item|
      puts item
    end
  end

  def add_employee(employee)
    @employes << employee
  end

  private

  attr_writer :items_in_stock
end

class Employee
  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end
end

class Item
  attr_reader :stock

  def initialize(name, sku, price, stock)
    @name = name
    @sku = sku
    @price = price
    @stock = stock
  end

  def stock_delivery(ammount)
    self.stock += ammount
  end

  private

  attr_writer :stock
end
