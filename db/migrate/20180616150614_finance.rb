class Finance < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
    add_index :users, :email, unique: true

    create_table :bank_accounts do |t|
      t.integer :bank_id, null: false
      t.string :acct_id, null: false
      t.string :acct_type
    end
    add_index :bank_accounts, :acct_id, unique: true

    create_table :user_bank_accounts do |t|
      t.references :user
      t.references :bank_account
    end

    create_table :statements do |t|
      t.string :transaction_type, null: false
      t.decimal :transaction_amt, precision: 8, scale: 2
      t.string :name, null: false
      t.date :date_posted
      t.text :memo
      t.references :bank_account
      t.integer :fit_id
      t.timestamps
    end
    add_index :statements, :date_posted
    add_index :statements, [:transaction_type, :date_posted]
  end
end
