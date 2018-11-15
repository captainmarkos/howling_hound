class AddBankAccountName < ActiveRecord::Migration[5.2]
  def change
    add_column :bank_accounts, :name, :string

    add_index :bank_accounts, :name, unique: true
  end
end
