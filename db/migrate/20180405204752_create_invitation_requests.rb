class CreateInvitationRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :invitation_requests do |t|
      t.integer :requester_id
      t.integer :event_id

      t.timestamps
    end
  end
end
