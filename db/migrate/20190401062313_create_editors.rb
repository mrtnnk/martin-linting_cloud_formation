class CreateEditors < ActiveRecord::Migration[5.2]
  def change
    create_table :editors do |t|

      t.timestamps
    end
  end
end
