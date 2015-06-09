class DeviseCreateKelloggBudgetTables < ActiveRecord::Migration
  def change
    create_table(:kellogg_budget_tables) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.integer :kelloggstartyear
      t.integer :kelloggtuition
      t.integer :kelloggbooks
      t.integer :kelloggtravelexpenses
      t.integer :kellogghealthinsurance
      t.integer :kelloggcomputer
      t.integer :kelloggstudentlifefee
      t.integer :kelloggenrollmentfee
      t.integer :kelloggloanfees
      t.string :username
      t.string :useremail
      t.integer :kelloggbudgetyear
      t.integer :kelloggroomboard
      t.integer :kelloggpersonalexpenses
      t.integer :kelloggcostyr1
      t.integer :kelloggcostyr2
      t.integer :tuitionyr2
      t.integer :maxloanyr1
      t.integer :maxloanyr2
      t.float :loaninterestrate
      t.integer :bonusrate
      t.integer :rentmortgage
      t.integer :utilities
      t.integer :cableinternet
      t.integer :gas
      t.integer :generalspending
      t.integer :retirementsavings
      t.integer :monthlyloanpayment
      t.integer :monthlyposttaxsalary
      t.integer :monthlyposttaxbonus
      t.integer :monthlysavings
      t.integer :tuitionyr1
      t.integer :scholarships
      t.integer :personalcontribution
      t.integer :totalloanamount
      t.integer :loanpayoffperiod
      t.integer :pretaxsalary
      t.integer :carinsurance
      t.integer :carpayment
      t.integer :parking
      t.integer :cellphone
      t.integer :food
      t.integer :publictransit
      t.integer :entertainment
      t.float :personalsavingsrate

      t.timestamps null: false
    end

    add_index :kellogg_budget_tables, :email,                unique: true
    add_index :kellogg_budget_tables, :reset_password_token, unique: true
    # add_index :kellogg_budget_tables, :confirmation_token,   unique: true
    # add_index :kellogg_budget_tables, :unlock_token,         unique: true
  end
end
