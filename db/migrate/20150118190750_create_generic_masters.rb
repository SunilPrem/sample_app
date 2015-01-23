class CreateGenericMasters < ActiveRecord::Migration
  def change
    create_table :generic_masters do |t|
      t.string :name
      t.string :full_name
      t.integer :precedence, :default => 0
      # :type represents Master table name e.g. gender, language,...
      t.string :table_name
      # :table_type represents Master table type e.g. two_column, three_column,...
      t.string :table_type
      t.integer :status, :default => 0 # t.integer(:status, {:default=>0})
      t.timestamps null: false
    end
  end
end
