class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    readers.all.pluck(:email).join ";"
  end

  def self.most_popular
    subscribers = all.map { |mag| mag.subscriptions.count }.max
    subscribers.max
  end
end
