class CreateRequestEnvironmentRules < ActiveRecord::Migration[5.2]
  def change
    create_table :request_environment_rules do |t|
      t.belongs_to :redirect_rule, foreign_key: true, null: false
      t.string :environment_key_name, null: false
      t.string :environment_value, null: false
      t.boolean :environment_value_is_regex, null: false, default: false
      t.boolean :environment_value_is_case_sensitive, null: false, default: true
      t.timestamps
    end
  end
end
