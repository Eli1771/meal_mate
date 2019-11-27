class WeekPlan < ApplicationRecord
  has_many :day_plans, dependent: :destroy
  # has_many :recipes, through: :day_plans

  before_save :date_slug

  def self.clearAll
    self.all.each do |wp|
      wp.delete
    end
  end

  private

  def date_slug
    self.slug = self.start_date.gsub(' ', '_').downcase
  end

  def to_param
    slug
  end
end
