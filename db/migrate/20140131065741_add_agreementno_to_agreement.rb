class AddAgreementnoToAgreement < ActiveRecord::Migration
  def change
    remove_column :agreements, :agreementno
  end
end
