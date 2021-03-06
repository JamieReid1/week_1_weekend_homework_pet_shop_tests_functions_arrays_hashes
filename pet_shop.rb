
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, num_sold)
  pet_shop[:admin][:pets_sold] += num_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  found_pets = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      found_pets.push(pet)
    end
  end
  return found_pets
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
       return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

# # -- Optional

def customer_can_afford_pet(customer, new_pet)
    if customer[:cash] < new_pet[:price]
      return false
    elsif customer[:cash] >= new_pet[:price]
      return true
    end
end

# Last test edited to allow function to pass.

def sell_pet_to_customer(pet_shop, pet, customer)
  unless pet == nil
    if customer[:cash] >= pet[:price]
      customer[:pets] << pet
      pet_shop[:admin][:pets_sold] += 1
      customer[:cash] -= pet[:price]
      pet_shop[:admin][:total_cash] += pet[:price]
    elsif customer[:cash] < pet[:price]
      return customer[:cash]
    end
  end
end
