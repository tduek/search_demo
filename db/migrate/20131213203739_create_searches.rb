class CreateSearches < ActiveRecord::Migration

  def change
    create_table :searches do |t|
      t.string :searchable_type
      t.integer :searchable_id
      t.text :term
    end
  end

end
