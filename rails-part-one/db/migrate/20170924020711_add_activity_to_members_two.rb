class AddActivityToMembersTwo < ActiveRecord::Migration[5.1]
  def change
  	change_column :members, :activity, :integer, :default => 0
  end
end
