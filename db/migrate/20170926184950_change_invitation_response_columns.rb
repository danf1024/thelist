class ChangeInvitationResponseColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :invitations, :rsvped_at, :datetime
    add_column :invitations, :accepted_at, :datetime
    add_column :invitations, :declined_at, :datetime
  end
end
