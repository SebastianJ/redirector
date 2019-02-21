class CreateRedirectRules < ActiveRecord::Migration[5.2]
  def change
    create_table :redirect_rules do |t|
      t.belongs_to :site, foreign_key: true, null: false
      t.string :source, null: false, index: true
      t.boolean :source_is_regex, null: false, default: false, index: true
      t.boolean :source_is_case_sensitive, null: false, default: false, index: true
      t.string :destination, null: false
      t.boolean :active, default: false, index: true
      t.timestamps
    end
  end
end
