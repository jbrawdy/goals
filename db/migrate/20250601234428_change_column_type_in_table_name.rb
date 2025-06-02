class ChangeColumnTypeInTableName < ActiveRecord::Migration[8.0]
  def change
    change_column :goals , :date, :date
  end
end
