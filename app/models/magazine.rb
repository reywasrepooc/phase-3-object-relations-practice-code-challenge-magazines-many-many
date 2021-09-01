class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    readers.all.pluck(:email).join ";"
  end

  def subscription_count
    subscriptions.count
  end

  def self.most_popular
    subscribers = all.map(&:subscription_count).max
    all.find { |mag| mag.subscription_count == subscribers }
  end

  def self.least_popular
    least_popular = all.map(&:subscription_count).min
    all.find { |mag| mag.subscription_count == least_popular }
  end

end
