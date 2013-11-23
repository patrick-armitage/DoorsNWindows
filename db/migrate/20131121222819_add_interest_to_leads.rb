class AddInterestToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :interest, :string

    remove_column :leads, :wants_doors
    remove_column :leads, :wants_windows
  end
end
