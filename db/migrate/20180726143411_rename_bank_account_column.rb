class RenameBankAccountColumn < ActiveRecord::Migration[5.2]
  def change
    remove_index :bank_accounts, :name

    rename_column :bank_accounts, :name, :bank_name
    rename_column :bank_accounts, :acct_type, :acct_name

    add_index :bank_accounts, [:bank_name, :acct_name], unique: true
    add_index :bank_accounts, [:bank_name, :acct_id], unique: true
    add_index :bank_accounts, [:bank_id, :acct_id], unique: true
  end
end
