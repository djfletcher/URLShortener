# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string           not null
#  short_url  :string
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'securerandom'

class ShortenedUrl < ActiveRecord::Base

  validates :long_url, presence: true
  validates :user_id, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :shortened_url_id

  has_many :visitors,
    through: :visits,
    source: :visitor

  def self.create_short_url(user, long_url)
    create!(user_id: user.id, long_url: long_url,
      short_url: ShortenedUrl.random_code)
  end

  def self.random_code
    str = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: str)
      str = SecureRandom.urlsafe_base64
    end
    str
  end

  def num_clicks
    URLShortener.execute(<<-SQL, self.id)
    SELECT
      COUNT(*)
    FROM
      visits
    WHERE
      visits.shortened_url_id = ?
    SQL
  end

  def num_uniques

  end

  def num_recent_uniques

  end

end
