class Store
  def initialize(owner, name)
    @created_at = Time.now
    @owner = owner
    @name = name
    @employes = []
  end
end

class Employee
  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end
end

class Item
  def inintialize(name, sku, price, stock)
    @name = name
    @sku = sku
    @price = price
    @stock = stock
  end
end
