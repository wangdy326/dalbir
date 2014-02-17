class RemoveAgreementDateFromAgreement < ActiveRecord::Migration
  def up
	remove_column :agreements, :agreement_date
  end

  def down
  end
end
