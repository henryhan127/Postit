class AddTimestampsToUserPost < ActiveRecord::Migration
  def change
  	add_timestamps(:users)
  	add_timestamps(:posts)
  end
end
