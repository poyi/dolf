class ChangeDataTypeForTaskCompleted < ActiveRecord::Migration
  def up
  	change_table :tasks do |t|
      t.change :completed, :string
     end
  end

  def down
  	change_table :tasks do |t|
      t.change :completed, :boolean
    end
  end
end
