class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :zip
      t.boolean :wants_doors
      t.boolean :wants_windows

      t.timestamps
    end
  end
end
