class AddIndexCityToDogAndDogsitter < ActiveRecord::Migration[7.1]
  def change
    add_reference :dogs, :city, index: true, foreign_key: true
    add_reference :dogsitters, :city, index: true, foreign_key: true
  end
end
