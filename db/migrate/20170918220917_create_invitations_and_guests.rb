class CreateInvitationsAndGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.string :rsvp_code, null: false
      t.string :addressee, null: false
      t.string :address_line_1, null: false
      t.string :address_line_2
      t.string :city, null: false
      t.string :state
      t.string :country
      t.string :zip, null: false
      t.timestamp :sent_at
      t.timestamp :rsvped_at
      t.string :rsvp_comment, limit: 1024
      t.timestamps
    end

    create_table :guests do |t|
      t.belongs_to :invitation, index: true
      t.string :name
      t.string :category, null: false
      t.timestamp :accepted_at
      t.timestamp :declined_at
      t.string :entree_selection
      t.timestamps
    end
  end
end
