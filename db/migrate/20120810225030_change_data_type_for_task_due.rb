class ChangeDataTypeForTaskDue < ActiveRecord::Migration
  def up
  	change_table :tasks do |t|
      t.change :due, :string
    end
  end

  def down
  	change_table :tasks do |t|
      t.change :due, :integer
    end
  end
end
