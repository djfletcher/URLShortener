class AddPresenceConstraintToShortenedUrls < ActiveRecord::Migration
  def change
    change_column :shortened_urls, :long_url, :string, null: false
    change_column :shortened_urls, :user_id, :integer, null: false
  end
end
