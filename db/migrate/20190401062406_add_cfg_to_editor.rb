class AddCfgToEditor < ActiveRecord::Migration[5.2]
  def change
    add_column :editors, :cfgfile, :string
  end
end
