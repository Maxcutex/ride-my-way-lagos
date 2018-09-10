class CreateFaqs < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs do |t|
      t.string :title
      t.string :answer
      t.boolean :is_active

      t.timestamps
    end
  end
end
