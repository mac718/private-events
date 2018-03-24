class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.integer :event_invited_to_id
      t.integer :invitee_id

      t.timestamps
    end
  end
end
