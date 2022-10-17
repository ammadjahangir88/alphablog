class CreatePolycomments < ActiveRecord::Migration[7.0]
  def change
    create_table :polycomments do |t|
      t.text :context
      t.references :commentable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
