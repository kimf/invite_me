class CreateInviteMeRequests < ActiveRecord::Migration
  def change
    create_table :invite_me_requests do |t|
      t.string :email
      t.string :referring_url
      t.string :landing_url

      t.datetime :invited_at

      t.timestamps
    end
  end
end
